sudo -euxo pipefall

dnf update -y
dnf install docker -y docker
systemctl enable --now docker

cat > /opt/app.py <<'PY'
from flask import Flask
import socket

app = Flask(__name__)
@app.get("/")
def hello():
    return {"message": "hello from ALB --> Ec2", "hostname": socket.gethostname()}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
PY

cat > /opt/Dockerfile <<'DOCKER'
FROM python:3.9-slim
WORKDIR /app
COPY app.py .
EXPOSE 5000
CMD ["python", "app.py"]
DOCKER

cd /opt
docker build -t alb-ec2-demo:v1 .
docker run -d  --name alb-ec2-demo -p 80:5000 alb-ec2-demo:v1
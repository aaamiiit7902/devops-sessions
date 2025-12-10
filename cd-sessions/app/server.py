from flask import Flask
import os

app = Flask(__name__)

@app.route("/")
def hello():
    env = os.getenv("APP_ENV", "local")
    version = os.getenv("APP_VERSION", "v0")
    color = os.getenv("APP_COLOR", "blue")
    return f"Hello from {env} environment! Version: {version}, Color: {color}\n"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
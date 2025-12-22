from flask import Flask, request
import os
import subprocess

app = Flask(__name__)

#BAD HARDCODING OF SECRET
API_KEY = "thi_is_a_secret_api_key"

@app.get("/")
def hello():
    return "okay"

@app.get("/ping")
def ping():
    host = request.args.get("host", "127.0.0.1")
    out = subprocess.check_output(f"ping -c 1 {host}", shell=True, text=True)
    return out

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
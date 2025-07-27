from flask import Flask, jsonify, request
from flask_cors import CORS
import json
import os
import boto3

app = Flask(__name__)
CORS(app)

AWS_ACCESS_KEY = os.getenv("AWS_ACCESS_KEY_ID")
AWS_SECRET_KEY = os.getenv("AWS_SECRET_ACCESS_KEY")
AWS_SESSION_TOKEN = os.getenv("AWS_SESSION_TOKEN")
BUCKET_NAME = os.getenv("AWS_BUCKET_NAME")
OBJECT_KEY = "backup.json"

s3 = boto3.client(
    "s3",
    aws_access_key_id=AWS_ACCESS_KEY,
    aws_secret_access_key=AWS_SECRET_KEY,
    aws_session_token=AWS_SESSION_TOKEN
)

@app.route("/write", methods=["POST"])
def write_data():
    try:
        message = request.json.get("message")
        obj = s3.get_object(Bucket=BUCKET_NAME, Key=OBJECT_KEY)
        content = obj['Body'].read().decode('utf-8')
        data = json.loads(content)
        data["messages"].append(message)
    except s3.exceptions.NoSuchKey:
        data = {"messages": [message]}
    except Exception:
        data = {"messages": [message]}

    s3.put_object(
        Bucket=BUCKET_NAME,
        Key=OBJECT_KEY,
        Body=json.dumps(data),
        ContentType="application/json"
    )

    return jsonify({"status": "success", "data": data})

@app.route("/data", methods=["GET"])
def get_data():
    try:
        obj = s3.get_object(Bucket=BUCKET_NAME, Key=OBJECT_KEY)
        content = obj['Body'].read().decode('utf-8')
        data = json.loads(content)
        return jsonify(data)
    except Exception as e:
        return jsonify({"error": str(e)}), 404

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)


from flask import Flask, request
import json

app = Flask(__name__)

@app.route('/', methods=['GET'])
def index():
    return json.dumps({"message": "Hello World!"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
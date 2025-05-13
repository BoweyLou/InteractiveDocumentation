import os
from flask import Flask, render_template, send_from_directory

app = Flask(__name__)
app.secret_key = os.environ.get("SESSION_SECRET", "legacy_site_secret_key")

@app.route('/')
def index():
    return send_from_directory('static/LegacySite/Pages', 'login.html')

@app.route('/<path:path>')
def static_files(path):
    return send_from_directory('static', path)

@app.route('/Pages/<path:path>')
def pages(path):
    return send_from_directory('static/LegacySite/Pages', path)

@app.route('/Styles/<path:path>')
def styles(path):
    return send_from_directory('static/LegacySite/Styles', path)

@app.route('/Scripts/<path:path>')
def scripts(path):
    return send_from_directory('static/LegacySite/Scripts', path)

@app.route('/Data/<path:path>')
def data(path):
    return send_from_directory('static/LegacySite/Data', path)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)

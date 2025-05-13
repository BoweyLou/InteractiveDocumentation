import os
import lxml.etree as ET
from flask import Flask, render_template, send_from_directory, Response

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

@app.route('/generate-report')
def generate_report():
    try:
        # Load the XML and XSLT files
        xml_path = 'static/LegacySite/Data/sample-report.xml'
        xslt_path = 'static/LegacySite/Data/ReportTransform.xslt'
        
        # Parse the XML and XSLT files
        xml_doc = ET.parse(xml_path)
        xslt_doc = ET.parse(xslt_path)
        
        # Create a transformer
        transform = ET.XSLT(xslt_doc)
        
        # Apply the transformation
        result = transform(xml_doc)
        
        # Convert the result to a string
        html_content = ET.tostring(result, pretty_print=True)
        
        # Return the transformed HTML
        return Response(html_content, mimetype='text/html')
    except Exception as e:
        return f"Error generating report: {str(e)}", 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)

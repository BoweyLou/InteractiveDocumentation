import os
import lxml.etree as ET
from flask import Flask, render_template, send_from_directory, Response, request, redirect, url_for

app = Flask(__name__)
app.secret_key = os.environ.get("SESSION_SECRET", "legacy_site_secret_key")

# Ensure uploads directory exists
UPLOAD_FOLDER = 'static/LegacySite/Data/uploads'
if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

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

# Routes for ASP.NET Web Forms mimic (.NET 3.5)
@app.route('/CorporateBanking.Web35/<path:path>', methods=['GET'])
def web35_files(path):
    return send_from_directory('CorporateBankingSolution/CorporateBanking.Web35', path)

# Routes for ASP.NET Web Forms mimic (.NET 4.5)
@app.route('/CorporateBanking.Web45/<path:path>', methods=['GET'])
def web45_files(path):
    return send_from_directory('CorporateBankingSolution/CorporateBanking.Web45', path)

# Route for CorporateBankingLegacy static assets
@app.route('/CorporateBankingLegacy/<path:path>', methods=['GET'])
def legacy_solution_files(path):
    return send_from_directory('CorporateBankingSolution/CorporateBankingLegacy', path)

@app.route('/generate-report')
def generate_report():
    try:
        # Check if a custom XML file has been uploaded
        custom_xml_path = os.path.join(app.config['UPLOAD_FOLDER'], 'custom-report.xml')
        
        # Use the custom file if it exists, otherwise use the sample file
        if os.path.exists(custom_xml_path):
            xml_path = custom_xml_path
        else:
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

@app.route('/upload-xml', methods=['GET', 'POST'])
def upload_xml():
    if request.method == 'POST':
        # Check if a file was uploaded
        if 'xml_file' not in request.files:
            return 'No file part'
            
        file = request.files['xml_file']
        
        # If the user does not select a file, the browser submits an empty file
        if file.filename == '':
            return 'No selected file'
            
        if file:
            # Save the file as custom-report.xml
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], 'custom-report.xml'))
            return redirect(url_for('generate_report'))
    
    # For GET requests, show the upload form
    upload_form = '''
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
    <head>
        <title>Corporate Online - Upload XML</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link rel="stylesheet" type="text/css" href="/LegacySite/Styles/co.css">
        <link rel="stylesheet" type="text/css" href="/LegacySite/Styles/modern-stub.css">
        <script type="text/javascript" src="/LegacySite/Scripts/jquery-1.4.2.js"></script>
        <script type="text/javascript" src="/LegacySite/Scripts/scripts.js"></script>
    </head>
    <body>
        <!-- Main Table Container for centring -->
        <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td align="center" valign="top">
                    <!-- Content Table with fixed width -->
                    <table width="780" border="0" cellspacing="0" cellpadding="0" class="legacyui" bgcolor="#FFFFFF">
                        <tr>
                            <td colspan="3" bgcolor="#003366" height="80">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="20"><img src="/LegacySite/Data/spacer.gif" width="20" height="1" border="0" alt=""></td>
                                        <td>
                                            <font face="Verdana, Arial, Helvetica, sans-serif" size="5" color="#FFFFFF"><b>Corporate Online</b></font><br>
                                            <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF">Secure Banking Portal</font>
                                        </td>
                                        <td align="right">
                                            <table border="0" cellspacing="0" cellpadding="2">
                                                <tr>
                                                    <td align="right">
                                                        <font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF">
                                                            Welcome, <b>John Smith</b> | Last Login: 24/05/2005 10:32 AM
                                                        </font>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <a href="/LegacySite/Pages/login.html" style="color: #FFFFFF; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; text-decoration: none;">
                                                            <b>Logout</b>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td width="20"><img src="/LegacySite/Data/spacer.gif" width="20" height="1" border="0" alt=""></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#E5E5E5" width="180" valign="top">
                                <!-- Left Navigation Menu -->
                                <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                    <tr>
                                        <td height="30" bgcolor="#6699CC">
                                            <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF">
                                                <b>&nbsp;Main Menu</b>
                                            </font>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#F0F0F0">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="2">
                                                <tr>
                                                    <td>
                                                        <img src="/LegacySite/Data/bullet.gif" width="8" height="8" border="0" alt="">
                                                        <a href="/LegacySite/Pages/dashboard.html" class="navLink">Dashboard</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <img src="/LegacySite/Data/bullet.gif" width="8" height="8" border="0" alt="">
                                                        <a href="/LegacySite/Pages/settings.html" class="navLink">Account Settings</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <img src="/LegacySite/Data/bullet.gif" width="8" height="8" border="0" alt="">
                                                        <a href="/generate-report" class="navLink">Transaction Report</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <img src="/LegacySite/Data/bullet.gif" width="8" height="8" border="0" alt="">
                                                        <a href="#" class="navLink" onclick="showHelpDialog(); return false;">Help</a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <br>
                            </td>
                            <td valign="top" bgcolor="#FFFFFF">
                                <!-- Main Content Area -->
                                <table width="100%" border="0" cellspacing="0" cellpadding="10">
                                    <tr>
                                        <td>
                                            <font face="Verdana, Arial, Helvetica, sans-serif" size="3" color="#003366">
                                                <b>Upload XML Data</b>
                                            </font>
                                            <hr size="1" noshade color="#CCCCCC">
                                            <br>
                                            <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                                Use this form to upload a custom XML file for the transaction report. The file should conform to the expected format.
                                                <br><br>
                                                <a href="/LegacySite/Data/template-report.xml" style="color: #003366;" target="_blank">Download XML Template</a> to use as a starting point.
                                            </font>
                                            <br><br>
                                            <!-- Upload Form -->
                                            <form action="/upload-xml" method="post" enctype="multipart/form-data">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                                    <tr>
                                                        <td width="150">
                                                            <font face="Verdana, Arial, Helvetica, sans-serif" size="2">XML File:</font>
                                                        </td>
                                                        <td>
                                                            <input type="file" name="xml_file" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; width: 300px;">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>
                                                            <input type="submit" value="Upload and Generate Report" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; width: 180px; cursor: hand;">
                                                        </td>
                                                    </tr>
                                                </table>
                                            </form>
                                            <br>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="3" bgcolor="#F0F0F0">
                                                <tr>
                                                    <td>
                                                        <font face="Verdana, Arial, Helvetica, sans-serif" size="1">
                                                            <b>Note:</b> The XML file must match the structure expected by the report template. Sample XML structure:
                                                            <pre style="font-size: 9px; color: #666666; margin: 5px;">
&lt;TransactionReport&gt;
  &lt;ReportHeader&gt;
    &lt;Title&gt;Transaction Report&lt;/Title&gt;
    &lt;GeneratedDate&gt;12/04/2005 10:45:23&lt;/GeneratedDate&gt;
    &lt;GeneratedBy&gt;Corporate Online System&lt;/GeneratedBy&gt;
    &lt;AccountNumber&gt;1098-7654-3210&lt;/AccountNumber&gt;
    &lt;AccountType&gt;Current&lt;/AccountType&gt;
    &lt;ReportPeriod&gt;
      &lt;StartDate&gt;15/03/2005&lt;/StartDate&gt;
      &lt;EndDate&gt;12/04/2005&lt;/EndDate&gt;
    &lt;/ReportPeriod&gt;
    ...
  &lt;/ReportHeader&gt;
  &lt;Transactions&gt;
    &lt;Transaction DateNum="..." Date="..." Description="..." ...&gt;
    ...
  &lt;/Transactions&gt;
&lt;/TransactionReport&gt;
                                                            </pre>
                                                        </font>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td bgcolor="#CCCCCC" width="1"><img src="/LegacySite/Data/spacer.gif" width="1" height="1" border="0" alt=""></td>
                        </tr>
                        <tr>
                            <td colspan="3" bgcolor="#003366" height="30" align="center">
                                <font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF">
                                    Copyright &copy; 2005 Corporate Online. All Rights Reserved.
                                </font>
                            </td>
                        </tr>
                    </table>
                    <!-- End Content Table -->
                </td>
            </tr>
        </table>
        <!-- End Main Table Container -->
    </body>
    </html>
    '''
    return upload_form

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)

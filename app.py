import os
import re
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
    landing_page = '''
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
    <head>
        <title>Corporate Banking Portal - Version Selector</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link rel="stylesheet" type="text/css" href="/LegacySite/Styles/co.css">
        <style type="text/css">
            body { font-family: Verdana, Arial, Helvetica, sans-serif; margin: 0; padding: 0; background-color: #F0F0F0; }
            .container { width: 780px; margin: 50px auto; background-color: #FFFFFF; border: 1px solid #CCCCCC; }
            .header { background-color: #003366; color: #FFFFFF; padding: 20px; }
            .content { padding: 20px; }
            h1 { font-size: 24px; margin: 0; padding: 0; }
            h2 { font-size: 18px; color: #003366; margin-top: 30px; border-bottom: 1px solid #CCCCCC; padding-bottom: 5px; }
            .version-box { background-color: #F5F5F5; border: 1px solid #E0E0E0; padding: 15px; margin-bottom: 15px; }
            .version-title { font-weight: bold; color: #003366; margin-bottom: 5px; }
            .version-description { font-size: 12px; color: #666666; margin-bottom: 10px; }
            .version-link { display: inline-block; background-color: #6699CC; color: #FFFFFF; padding: 5px 10px; text-decoration: none; font-size: 12px; }
            .version-link:hover { background-color: #003366; }
            .footer { background-color: #003366; color: #FFFFFF; font-size: 11px; padding: 10px; text-align: center; }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1>Corporate Banking Portal</h1>
                <div style="font-size: 14px; margin-top: 5px;">Version Migration Demonstration</div>
            </div>
            <div class="content">
                <p>This demonstration shows the evolution of a legacy corporate banking portal through various technology migrations.</p>
                
                <h2>Select Version to View</h2>
                
                <div class="version-box">
                    <div class="version-title">Legacy Static Version (circa 2004-2005)</div>
                    <div class="version-description">
                        The original static HTML website using table-based layouts, spacer GIFs, and font tags with limited JavaScript.
                    </div>
                    <a href="/LegacySite/Pages/login.html" class="version-link">View Legacy Version</a>
                </div>
                
                <div class="version-box">
                    <div class="version-title">ASP.NET 3.5 Web Forms Migration</div>
                    <div class="version-description">
                        Migration showing how the legacy site would be wrapped in ASP.NET 3.5 Web Forms architecture with Master Pages and server controls.
                    </div>
                    <a href="/CorporateBanking.Web35/login.aspx" class="version-link">View .NET 3.5 Version</a>
                </div>
                
                <div class="version-box">
                    <div class="version-title">ASP.NET 4.5 Web Forms Migration</div>
                    <div class="version-description">
                        Further evolution to ASP.NET 4.5 Web Forms, maintaining backward compatibility while leveraging newer framework features.
                    </div>
                    <a href="/CorporateBanking.Web45/login.aspx" class="version-link">View .NET 4.5 Version</a>
                </div>
            </div>
            <div class="footer">
                Copyright &copy; 2005-2025 Corporate Banking Ltd. All Rights Reserved.
            </div>
        </div>
    </body>
    </html>
    '''
    return landing_page

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
    if path.endswith('.aspx'):
        try:
            # Load the master page
            with open('CorporateBankingSolution/CorporateBanking.Web35/Site.master', 'r') as master_file:
                master_content = master_file.read()
                
            # Strip ASP.NET directive from master page
            master_content = re.sub(r'<%@.*?%>', '', master_content)
            
            # Load the content page
            with open(f'CorporateBankingSolution/CorporateBanking.Web35/{path}', 'r') as content_file:
                content = content_file.read()
                
            # Strip ASP.NET directive from content page
            content = re.sub(r'<%@.*?%>', '', content)
                
            # Extract content from the asp:Content tags in the ASPX file
            main_content_match = re.search(r'<asp:Content[^>]*ContentPlaceHolderID="MainContent"[^>]*>(.*?)</asp:Content>', content, re.DOTALL)
            main_content = main_content_match.group(1) if main_content_match else "<!-- Content not found -->"
                
            # Insert the content into the master page
            processed_content = master_content.replace('<!-- CONTENT_PLACEHOLDER -->', main_content)
            
            # Replace ASP.NET specific attributes and tags
            processed_content = processed_content.replace('runat="server"', '')
            processed_content = re.sub(r'<asp:[^>]*>', '', processed_content)
            processed_content = re.sub(r'</asp:[^>]*>', '', processed_content)
            
            return Response(processed_content, mimetype='text/html')
        except Exception as e:
            return f"Error processing .aspx file: {str(e)}", 500
    elif path.endswith('.ascx'):
        try:
            with open(f'CorporateBankingSolution/CorporateBanking.Web35/{path}', 'r') as file:
                content = file.read()
                # Simple ASP.NET processing simulation
                content = re.sub(r'<%@.*?%>', '', content)
                content = content.replace('runat="server"', '')
                content = re.sub(r'<asp:[^>]*>', '', content)
                content = re.sub(r'</asp:[^>]*>', '', content)
                return Response(content, mimetype='text/html')
        except Exception as e:
            return f"Error loading control: {str(e)}", 500
    else:
        return send_from_directory('CorporateBankingSolution/CorporateBanking.Web35', path)

# Special route for user controls in .NET 3.5
@app.route('/CorporateBanking.Web35/Controls/<path:path>', methods=['GET'])
def web35_controls(path):
    try:
        # Use the existing .ascx handling from the web35_files function
        return web35_files(f'Controls/{path}')
    except Exception as e:
        return f"Error loading control: {str(e)}", 500

# Routes for ASP.NET Web Forms mimic (.NET 4.5)
@app.route('/CorporateBanking.Web45/<path:path>', methods=['GET'])
def web45_files(path):
    if path.endswith('.aspx'):
        try:
            # Load the master page
            with open('CorporateBankingSolution/CorporateBanking.Web45/Site.master', 'r') as master_file:
                master_content = master_file.read()
                
            # Strip ASP.NET directive from master page
            master_content = re.sub(r'<%@.*?%>', '', master_content)
            
            # Load the content page
            with open(f'CorporateBankingSolution/CorporateBanking.Web45/{path}', 'r') as content_file:
                content = content_file.read()
                
            # Strip ASP.NET directive from content page
            content = re.sub(r'<%@.*?%>', '', content)
                
            # Extract content from the asp:Content tags in the ASPX file
            main_content_match = re.search(r'<asp:Content[^>]*ContentPlaceHolderID="MainContent"[^>]*>(.*?)</asp:Content>', content, re.DOTALL)
            main_content = main_content_match.group(1) if main_content_match else "<!-- Content not found -->"
                
            # Insert the content into the master page
            processed_content = master_content.replace('<!-- CONTENT_PLACEHOLDER -->', main_content)
            
            # Replace ASP.NET specific attributes and tags
            processed_content = processed_content.replace('runat="server"', '')
            processed_content = re.sub(r'<asp:[^>]*>', '', processed_content)
            processed_content = re.sub(r'</asp:[^>]*>', '', processed_content)
            
            return Response(processed_content, mimetype='text/html')
        except Exception as e:
            return f"Error processing .aspx file: {str(e)}", 500
    elif path.endswith('.ascx'):
        try:
            with open(f'CorporateBankingSolution/CorporateBanking.Web45/{path}', 'r') as file:
                content = file.read()
                # Simple ASP.NET processing simulation
                content = re.sub(r'<%@.*?%>', '', content)
                content = content.replace('runat="server"', '')
                content = re.sub(r'<asp:[^>]*>', '', content)
                content = re.sub(r'</asp:[^>]*>', '', content)
                return Response(content, mimetype='text/html')
        except Exception as e:
            return f"Error loading control: {str(e)}", 500
    else:
        return send_from_directory('CorporateBankingSolution/CorporateBanking.Web45', path)

# Special route for user controls in .NET 4.5
@app.route('/CorporateBanking.Web45/Controls/<path:path>', methods=['GET'])
def web45_controls(path):
    try:
        # Use the existing .ascx handling from the web45_files function
        return web45_files(f'Controls/{path}')
    except Exception as e:
        return f"Error loading control: {str(e)}", 500

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

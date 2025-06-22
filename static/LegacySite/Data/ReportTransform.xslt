<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
    <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="4.0" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
<html>
<head>
    <title>Corporate Online - Transaction Report</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <link rel="stylesheet" type="text/css" href="/LegacySite/Styles/co.css"/>
    <link rel="stylesheet" type="text/css" href="/LegacySite/Styles/modern-stub.css"/>
    <style type="text/css">
        body { font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; }
        .reportHeader { font-size: 14px; font-weight: bold; color: #003366; }
        .reportSubHeader { font-size: 12px; color: #000000; }
        .tableHeader { background-color: #6699CC; color: #FFFFFF; font-weight: bold; }
        .rowEven { background-color: #F5F5F5; }
        .rowOdd { background-color: #FFFFFF; }
        .creditAmount { color: #008800; }
        .debitAmount { color: #FF0000; }
        .summaryTable { background-color: #E5E5E5; }
    </style>
    <script type="text/javascript" src="/LegacySite/Scripts/legacy-metrics.js"></script>
    <script type="text/javascript" src="/LegacySite/Scripts/jquery-1.4.2.js"></script>
    <script type="text/javascript" src="/LegacySite/Scripts/scripts.js"></script>
</head>
<body>
    <!-- Global Header with Metrics -->
    <div id="globalHeader" style="background-color: #000033; padding: 5px 0; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; color: #FFFFFF; font-size: 12px; border-bottom: 1px solid #333;">
        <div style="display: flex; justify-content: space-between; align-items: center; max-width: 1200px; margin: 0 auto; padding: 0 20px;">
            <a href="/" style="color: #FFFFFF; text-decoration: none; font-weight: bold; padding: 8px 16px; background-color: rgba(255,255,255,0.1); border-radius: 4px;">← Return to Version Selector</a>
            <button id="metricsToggle" onclick="toggleMetrics()" style="background: #4CAF50; color: white; border: none; padding: 6px 12px; border-radius: 4px; cursor: pointer; font-size: 11px;">Show Legacy Metrics</button>
        </div>
        <div id="metricsPanel" style="display: none; background-color: #f8f9fa; color: #333; padding: 15px; margin-top: 10px; border-top: 1px solid #ddd;">
            <div style="max-width: 1200px; margin: 0 auto;">
                <h4 style="margin: 0 0 10px 0; color: #333;">Legacy Code Analysis - XSLT Transaction Report</h4>
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; font-size: 11px;">
                    <div>
                        <strong>CSS Distribution:</strong><br/>
                        • Inline CSS: 31% (XSLT template heavy inline)<br/>
                        • Stylesheet CSS: 69%<br/><br/>
                        <strong>Inline CSS Controls:</strong><br/>
                        • Report table styling: style="border-collapse: separate"<br/>
                        • Cell-specific padding: style="padding: 4px 6px"<br/>
                        • Font variations: style="font-family: Courier New"<br/>
                        • Color coding: style="color: #006600" (credits/debits)
                    </div>
                    <div>
                        <strong>Stylesheet CSS Controls:</strong><br/>
                        • Base report layout (.legacyui)<br/>
                        • Report header styling (.reportHeader)<br/>
                        • Transaction table classes (.transactionTable)<br/>
                        • Amount formatting (.creditAmount/.debitAmount)<br/><br/>
                        <strong>Legacy Artifacts:</strong><br/>
                        • XSLT 1.0 transformation (legacy processor)<br/>
                        • Mixed XML namespaces and legacy patterns<br/>
                        • Inconsistent data formatting approaches<br/>
                        • 5+ levels of nested tables for layout
                    </div>
                </div>
            </div>
        </div>
    </div>
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
                                    <td width="20"><img src="/LegacySite/Data/spacer.gif" width="20" height="1" border="0" alt=""/></td>
                                    <td>
                                        <font face="Verdana, Arial, Helvetica, sans-serif" size="5" color="#FFFFFF"><b>Corporate Online</b></font><br/>
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
                                    <td width="20"><img src="/LegacySite/Data/spacer.gif" width="20" height="1" border="0" alt=""/></td>
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
                                                    <img src="/LegacySite/Data/bullet.gif" width="8" height="8" border="0" alt=""/>
                                                    <a href="/LegacySite/Pages/dashboard.html" class="navLink">Dashboard</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <img src="/LegacySite/Data/bullet.gif" width="8" height="8" border="0" alt=""/>
                                                    <a href="/LegacySite/Pages/settings.html" class="navLink">Account Settings</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <img src="/LegacySite/Data/bullet.gif" width="8" height="8" border="0" alt=""/>
                                                    <a href="/generate-report" class="navLink">Transaction Report</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <img src="/LegacySite/Data/bullet.gif" width="8" height="8" border="0" alt=""/>
                                                    <a href="#" class="navLink" onclick="showHelpDialog(); return false;">Help</a>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <br/>
                            <!-- Quick Stats Box -->
                            <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                <tr>
                                    <td height="25" bgcolor="#6699CC">
                                        <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF">
                                            <b>&nbsp;Quick Stats</b>
                                        </font>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F0F0F0">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="2">
                                            <tr>
                                                <td>
                                                    <font face="Verdana, Arial, Helvetica, sans-serif" size="1">
                                                        <b>Total Accounts:</b> 5<br/>
                                                        <b>Total Balance:</b> $145,230.45<br/>
                                                        <b>Last Transfer:</b> 23/05/2005
                                                    </font>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <!-- End Left Navigation Menu -->
                        </td>
                        <td valign="top" bgcolor="#FFFFFF">
                            <!-- Main Content Area -->
                            <table width="100%" border="0" cellspacing="0" cellpadding="10">
                                <tr>
                                    <td>
                                        <!-- Report Content -->
                                        <div align="center">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="3" class="reportHeader">
                                                <tr>
                                                    <td align="center">
                                                        <xsl:value-of select="TransactionReport/ReportHeader/Title"/>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br/>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="2" class="reportSubHeader">
                                                <tr>
                                                    <td width="50%" align="left">Account: <xsl:value-of select="TransactionReport/ReportHeader/AccountNumber"/> (<xsl:value-of select="TransactionReport/ReportHeader/AccountType"/>)</td>
                                                    <td width="50%" align="right">Generated: <xsl:value-of select="TransactionReport/ReportHeader/GeneratedDate"/></td>
                                                </tr>
                                                <tr>
                                                    <td align="left">Period: <xsl:value-of select="TransactionReport/ReportHeader/ReportPeriod/StartDate"/> - <xsl:value-of select="TransactionReport/ReportHeader/ReportPeriod/EndDate"/></td>
                                                    <td align="right">By: <xsl:value-of select="TransactionReport/ReportHeader/GeneratedBy"/></td>
                                                </tr>
                                            </table>
                                            <br/>
                                            <div align="right">
                                                <a href="/upload-xml" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #003366;">
                                                    <img src="/LegacySite/Data/bullet.gif" width="8" height="8" border="0" align="absmiddle" alt=""/>
                                                    Upload Custom XML
                                                </a>
                                            </div>
                                            <br/>
                                            <!-- Legacy nested table mess for report metadata (poor legacy pattern) -->
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color: #F0F0F0; margin-bottom: 10px;">
                                                <tr>
                                                    <td>
                                                        <table width="100%" border="0" cellspacing="2" cellpadding="2">
                                                            <tr>
                                                                <td width="25%" style="vertical-align: top;">
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="1" bgcolor="#E8E8E8">
                                                                        <tr>
                                                                            <td style="font-family: Verdana; font-size: 10px; color: #333; padding: 2px; font-weight: bold;">
                                                                                Report Period:
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td bgcolor="#FFFFFF" style="padding: 3px; border: 1px inset #CCCCCC;">
                                                                                <font face="Verdana" size="1" style="color: #000080;">
                                                                                    <xsl:value-of select="TransactionReport/ReportHeader/StartDate"/> - 
                                                                                    <xsl:value-of select="TransactionReport/ReportHeader/EndDate"/>
                                                                                </font>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="25%" style="vertical-align: top; padding-left: 3px;">
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="1" style="background-color: #E8E8E8;">
                                                                        <tr>
                                                                            <td><font face="Verdana" size="1" color="#333" style="font-weight: bold;">Account:</font></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td bgcolor="#FFFFFF" style="padding: 3px; border: 1px inset #CCCCCC;">
                                                                                <font face="Verdana" size="1" style="font-family: 'Courier New', monospace;">
                                                                                    <xsl:value-of select="TransactionReport/ReportHeader/AccountName"/>
                                                                                </font>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="25%" style="vertical-align: top; padding-left: 3px;">
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="1" bgcolor="#E8E8E8">
                                                                        <tr>
                                                                            <td><font face="Verdana" size="1" color="#333" style="font-weight: bold;">Generated:</font></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td bgcolor="#FFFFFF" style="padding: 3px; border: 1px inset #CCCCCC;">
                                                                                <font face="Verdana" size="1" style="color: #666666;">24/05/2005 14:32</font>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="25%" style="vertical-align: top; padding-left: 3px;">
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="1" bgcolor="#E8E8E8">
                                                                        <tr>
                                                                            <td><font face="Verdana" size="1" color="#333" style="font-weight: bold;">Status:</font></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td bgcolor="#FFFFFF" style="padding: 3px; border: 1px inset #CCCCCC;">
                                                                                <font face="Verdana" size="1" style="color: #006600; font-weight: bold;">COMPLETE</font>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                            <!-- Transaction Table -->
                                            <table width="100%" border="0" cellspacing="1" cellpadding="3" bgcolor="#CCCCCC" style="border-collapse: separate; border-spacing: 1px;">
                                                <tr class="tableHeader">
                                                    <td>Date</td>
                                                    <td>Description</td>
                                                    <td>Reference</td>
                                                    <td align="right">Amount</td>
                                                    <td align="right">Balance</td>
                                                </tr>
                                                <xsl:for-each select="TransactionReport/Transactions/Transaction">
                                                    <xsl:sort select="@DateNum" data-type="number" order="descending"/>
                                                    <tr style="border-bottom: 1px dotted #DDDDDD;">
                                                        <xsl:attribute name="class">
                                                            <xsl:choose>
                                                                <xsl:when test="position() mod 2 = 0">rowEven</xsl:when>
                                                                <xsl:otherwise>rowOdd</xsl:otherwise>
                                                            </xsl:choose>
                                                        </xsl:attribute>
                                                        <td style="padding: 4px 6px; vertical-align: middle; border-right: 1px solid #EEEEEE;">
                                                            <font face="Verdana" size="1" style="font-family: 'Courier New', monospace; letter-spacing: 0.3px;">
                                                                <xsl:value-of select="@Date"/>
                                                            </font>
                                                        </td>
                                                        <td style="padding: 4px 6px; vertical-align: middle; border-right: 1px solid #EEEEEE;">
                                                            <font face="Verdana" size="2" style="line-height: 1.2;">
                                                                <xsl:value-of select="@Description"/>
                                                            </font>
                                                        </td>
                                                        <td style="padding: 4px 6px; vertical-align: middle; border-right: 1px solid #EEEEEE;">
                                                            <font face="Verdana" size="1" style="font-family: 'Courier New', monospace; color: #666666;">
                                                                <xsl:value-of select="@ReferenceNumber"/>
                                                            </font>
                                                        </td>
                                                        <td align="right" style="padding: 4px 8px; vertical-align: middle; border-right: 1px solid #EEEEEE;">
                                                            <xsl:choose>
                                                                <xsl:when test="@Type = 'Credit'">
                                                                    <span class="creditAmount" style="font-weight: bold; font-family: 'Courier New', monospace;">$<xsl:value-of select="@Amount"/></span>
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    <span class="debitAmount" style="font-weight: bold; font-family: 'Courier New', monospace;">-$<xsl:value-of select="@Amount"/></span>
                                                                </xsl:otherwise>
                                                            </xsl:choose>
                                                        </td>
                                                        <td align="right" style="padding: 4px 8px; vertical-align: middle; font-weight: bold;">
                                                            <font face="Verdana" size="2" style="font-family: 'Courier New', monospace; color: #000080;">
                                                                $<xsl:value-of select="@Balance"/>
                                                            </font>
                                                        </td>
                                                    </tr>
                                                </xsl:for-each>
                                            </table>
                                            <br/>
                                            <!-- Summary Table -->
                                            <table width="350" border="0" cellspacing="0" cellpadding="3" align="right" class="summaryTable">
                                                <tr>
                                                    <td align="right"><b>Opening Balance:</b></td>
                                                    <td align="right">$<xsl:value-of select="TransactionReport/ReportSummary/OpeningBalance"/></td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><b>Total Credits:</b></td>
                                                    <td align="right"><span class="creditAmount">$<xsl:value-of select="TransactionReport/ReportSummary/TotalCredits"/></span></td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><b>Total Debits:</b></td>
                                                    <td align="right"><span class="debitAmount">-$<xsl:value-of select="TransactionReport/ReportSummary/TotalDebits"/></span></td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><b>Net Change:</b></td>
                                                    <td align="right">$<xsl:value-of select="TransactionReport/ReportSummary/NetChange"/></td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><b>Closing Balance:</b></td>
                                                    <td align="right"><b>$<xsl:value-of select="TransactionReport/ReportSummary/ClosingBalance"/></b></td>
                                                </tr>
                                            </table>
                                            <br clear="all"/>
                                            <br/>
                                            <!-- Print/Export Options -->
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td align="center">
                                                        <input type="button" value="Print Report" onclick="window.print();" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; width: 100px; cursor: hand;"/>
                                                        &#160;
                                                        <input type="button" value="Export to CSV" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; width: 100px; cursor: hand;"/>
                                                        &#160;
                                                        <input type="button" value="Back to Dashboard" onclick="window.location='/LegacySite/Pages/dashboard.html';" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; width: 120px; cursor: hand;"/>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <!-- End Report Content -->
                                    </td>
                                </tr>
                            </table>
                            <!-- End Main Content Area -->
                        </td>
                        <td bgcolor="#E5E5E5" width="1"><img src="/LegacySite/Data/spacer.gif" width="1" height="1" border="0" alt=""/></td>
                    </tr>
                    <tr>
                        <td colspan="3" bgcolor="#003366" height="30" align="center">
                            <font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF">
                                Copyright &#169; 2005 Corporate Online. All Rights Reserved.
                            </font>
                        </td>
                    </tr>
                </table>
                <!-- End Content Table -->
            </td>
        </tr>
    </table>
    <!-- End Main Table Container -->
    <!-- Hidden dialog div that will be positioned using JavaScript -->
    <div id="helpDialog" style="display: none; position: absolute; top: 200px; left: 250px; width: 400px; border: 2px solid #003366; background-color: #FFFFFF; padding: 0px;">
        <table width="100%" border="0" cellspacing="0" cellpadding="3" bgcolor="#003366">
            <tr>
                <td>
                    <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF">
                        <b>Corporate Online Help</b>
                    </font>
                </td>
                <td align="right">
                    <a href="#" onclick="hideHelpDialog(); return false;" style="color: #FFFFFF; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; text-decoration: none;">
                        <b>Close [X]</b>
                    </a>
                </td>
            </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="10">
            <tr>
                <td>
                    <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                        For assistance with Corporate Online, please contact our support team:<br/><br/>
                        Phone: 1800 555 123<br/>
                        Email: support@corporateonline.com.au<br/>
                        Hours: Monday to Friday, 8:00 AM - 6:00 PM AEST
                    </font>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>

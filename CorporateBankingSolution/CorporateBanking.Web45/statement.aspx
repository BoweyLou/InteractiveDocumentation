<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="statement.aspx.cs" Inherits="CorporateBanking.Web45.StatementPage" %>

<asp:Content ID="StatementContent" ContentPlaceHolderID="MainContent" runat="server">
    <font face="Verdana, Arial, Helvetica, sans-serif" size="3" color="#003366">
        <b>Account Statement</b>
    </font>
    <hr size="1" noshade color="#CCCCCC">
    <br>
    <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
        View your recent account transaction history below.
    </font>
    <br><br>
    
    <!-- Account Statement Header -->
    <table width="100%" border="0" cellspacing="0" cellpadding="3" bgcolor="#F0F0F0">
        <tr>
            <td>
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    <b>Account Number:</b> 1098-7654-3210 &nbsp;&nbsp;&nbsp;
                    <b>Account Type:</b> Current &nbsp;&nbsp;&nbsp;
                    <b>Statement Period:</b> 15/03/2005 - 12/04/2005
                </font>
            </td>
        </tr>
    </table>
    <br>
    
    <!-- Balance Summary -->
    <table width="100%" border="0" cellspacing="0" cellpadding="3">
        <tr>
            <td height="25" bgcolor="#6699CC">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF">
                    <b>&nbsp;Balance Summary</b>
                </font>
            </td>
        </tr>
        <tr>
            <td bgcolor="#F5F5F5">
                <table width="100%" border="0" cellspacing="0" cellpadding="3">
                    <tr>
                        <td width="33%">
                            <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                <b>Opening Balance:</b> $39,873.55
                            </font>
                        </td>
                        <td width="33%">
                            <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                <b>Closing Balance:</b> $45,230.45
                            </font>
                        </td>
                        <td width="34%">
                            <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                <b>Net Change:</b> $5,356.90
                            </font>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br>
    
    <!-- Transaction History -->
    <table width="100%" border="0" cellspacing="0" cellpadding="3">
        <tr>
            <td height="25" bgcolor="#6699CC">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF">
                    <b>&nbsp;Transaction History</b>
                </font>
            </td>
        </tr>
    </table>
    <table width="100%" border="0" cellspacing="1" cellpadding="3" bgcolor="#CCCCCC">
        <tr bgcolor="#E6E6E6">
            <td width="15%">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    <b>Date</b>
                </font>
            </td>
            <td width="40%">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    <b>Description</b>
                </font>
            </td>
            <td width="15%">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    <b>Reference</b>
                </font>
            </td>
            <td width="15%" align="right">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    <b>Amount</b>
                </font>
            </td>
            <td width="15%" align="right">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    <b>Balance</b>
                </font>
            </td>
        </tr>
        
        <!-- Transaction Row 1 -->
        <tr bgcolor="#FFFFFF">
            <td>
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    23/05/2005
                </font>
            </td>
            <td>
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    Direct Deposit - ABC Pty Ltd
                </font>
            </td>
            <td>
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    TR-239857
                </font>
            </td>
            <td align="right">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#008800">
                    $1,250.75
                </font>
            </td>
            <td align="right">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    $45,230.45
                </font>
            </td>
        </tr>
        
        <!-- Transaction Row 2 -->
        <tr bgcolor="#F5F5F5">
            <td>
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    21/05/2005
                </font>
            </td>
            <td>
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    Cheque Withdrawal - Supplier Payment
                </font>
            </td>
            <td>
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    CHQ-002341
                </font>
            </td>
            <td align="right">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FF0000">
                    $780.50
                </font>
            </td>
            <td align="right">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    $43,979.70
                </font>
            </td>
        </tr>
        
        <!-- Transaction Row 3 -->
        <tr bgcolor="#FFFFFF">
            <td>
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    20/05/2005
                </font>
            </td>
            <td>
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    Internet Transfer - To Savings Account
                </font>
            </td>
            <td>
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    ITR-987601
                </font>
            </td>
            <td align="right">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FF0000">
                    $2,000.00
                </font>
            </td>
            <td align="right">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    $44,760.20
                </font>
            </td>
        </tr>
        
        <!-- Transaction Row 4 -->
        <tr bgcolor="#F5F5F5">
            <td>
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    18/05/2005
                </font>
            </td>
            <td>
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    EFTPOS Purchase - Office Supplies
                </font>
            </td>
            <td>
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    EFT-756438
                </font>
            </td>
            <td align="right">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FF0000">
                    $345.67
                </font>
            </td>
            <td align="right">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    $46,760.20
                </font>
            </td>
        </tr>
        
        <!-- Transaction Row 5 -->
        <tr bgcolor="#FFFFFF">
            <td>
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    16/05/2005
                </font>
            </td>
            <td>
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    ATM Withdrawal - Elizabeth St Branch
                </font>
            </td>
            <td>
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    ATM-534290
                </font>
            </td>
            <td align="right">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FF0000">
                    $200.00
                </font>
            </td>
            <td align="right">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    $47,105.87
                </font>
            </td>
        </tr>
        
        <!-- Transaction Row 6 -->
        <tr bgcolor="#F5F5F5">
            <td>
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    14/05/2005
                </font>
            </td>
            <td>
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    Direct Deposit - XYZ Corporation
                </font>
            </td>
            <td>
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    TR-239845
                </font>
            </td>
            <td align="right">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#008800">
                    $5,432.10
                </font>
            </td>
            <td align="right">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    $47,305.87
                </font>
            </td>
        </tr>
    </table>
    
    <br>
    <!-- Report Options -->
    <table width="100%" border="0" cellspacing="0" cellpadding="3">
        <tr>
            <td>
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    <img src="/LegacySite/Data/print_icon.gif" width="16" height="16" border="0" align="absmiddle" alt="">
                    <a href="#" class="contentLink" onclick="window.print(); return false;">Print Statement</a> | 
                    <img src="/LegacySite/Data/download_icon.gif" width="16" height="16" border="0" align="absmiddle" alt="">
                    <a href="/upload-xml" class="contentLink">Upload Custom XML</a> |
                    <img src="/LegacySite/Data/download_icon.gif" width="16" height="16" border="0" align="absmiddle" alt="">
                    <a href="/Data/template-report.xml" class="contentLink">Download Template</a>
                </font>
            </td>
        </tr>
    </table>
</asp:Content>
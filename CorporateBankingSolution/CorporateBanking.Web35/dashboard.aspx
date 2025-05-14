<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="CorporateBanking.Web35.DashboardPage" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" src="Scripts/legacy-compat.js"></script>
</asp:Content>
<asp:Content ID="DashboardContent" ContentPlaceHolderID="MainContent" runat="server">
    <font face="Verdana, Arial, Helvetica, sans-serif" size="3" color="#003366">
        <b>Account Dashboard</b>
    </font>
    <hr size="1" noshade color="#CCCCCC">
    <br>
    <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
        Welcome to your account dashboard. Below you will find a summary of your accounts.
    </font>
    <br><br>
    <!-- Accounts Data Grid -->
    <asp:GridView ID="gvAccounts" runat="server" AutoGenerateColumns="False" CellPadding="3" Width="100%" 
        BackColor="#CCCCCC" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
        CellSpacing="1" GridLines="None">
        <HeaderStyle BackColor="#6699CC" Font-Names="Verdana, Arial, Helvetica, sans-serif" 
            Font-Size="Small" ForeColor="White" Font-Bold="True" />
        <RowStyle BackColor="#F5F5F5" Font-Names="Verdana, Arial, Helvetica, sans-serif" 
            Font-Size="Small" />
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Account Name">
                <ItemTemplate>
                    <img src="/LegacySite/Data/account_icon.gif" width="16" height="16" border="0" align="absmiddle" alt="">
                    &nbsp;<%# Eval("AccountName") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="AccountNumber" HeaderText="Account Number" />
            <asp:BoundField DataField="Balance" HeaderText="Balance" DataFormatString="{0:C}" HtmlEncode="False" />
            <asp:BoundField DataField="LastTransaction" HeaderText="Last Transaction" />
        </Columns>
    </asp:GridView>
    
    <br>
    <!-- Account Activity Summary -->
    <table width="100%" border="0" cellspacing="0" cellpadding="3" bgcolor="#F5F5F5">
        <tr>
            <td>
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    <b>Recent Activity Summary</b><br>
                    <img src="/LegacySite/Data/chart_icon.gif" width="16" height="16" border="0" align="absmiddle" alt="">
                    <a href="#" class="contentLink">View Transactions</a> | 
                    <img src="/LegacySite/Data/print_icon.gif" width="16" height="16" border="0" align="absmiddle" alt="">
                    <a href="#" class="contentLink">Print Statement</a> | 
                    <img src="/LegacySite/Data/download_icon.gif" width="16" height="16" border="0" align="absmiddle" alt="">
                    <a href="#" class="contentLink">Download CSV</a>
                </font>
            </td>
        </tr>
    </table>
    <br>
    <!-- Account Message -->
    <table width="100%" border="0" cellspacing="0" cellpadding="5" bgcolor="#FFFFCC">
        <tr>
            <td>
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    <img src="/LegacySite/Data/info_icon.gif" width="16" height="16" border="0" align="absmiddle" alt="">
                    <b>Important Notice:</b> System maintenance is scheduled for Sunday, 29/05/2005, from 2:00 AM to 5:00 AM AEST. Online banking services will be unavailable during this time.
                </font>
            </td>
        </tr>
    </table>
    
    <br>
    <!-- jQuery Collapsible Panel Example -->
    <div class="collapsiblePanel">
        <div class="panelHeader">
            <span class="collapseIcon">+</span> Market Update
        </div>
        <div class="panelContent">
            <p>Latest Financial Market Updates (24/05/2005)</p>
            <table width="100%" border="0" cellspacing="1" cellpadding="3" bgcolor="#CCCCCC">
                <tr>
                    <td bgcolor="#FFFFFF" width="120">AUD/USD</td>
                    <td bgcolor="#FFFFFF" align="right">0.7640</td>
                    <td bgcolor="#FFFFFF" align="right" class="creditAmount">+0.0015</td>
                </tr>
                <tr>
                    <td bgcolor="#F5F5F5">AUD/EUR</td>
                    <td bgcolor="#F5F5F5" align="right">0.6120</td>
                    <td bgcolor="#F5F5F5" align="right" class="debitAmount">-0.0008</td>
                </tr>
                <tr>
                    <td bgcolor="#FFFFFF">ASX 200</td>
                    <td bgcolor="#FFFFFF" align="right">4,275.8</td>
                    <td bgcolor="#FFFFFF" align="right" class="creditAmount">+12.5</td>
                </tr>
            </table>
            <p><small>Disclaimer: Information is delayed by 15 minutes and is provided for informational purposes only.</small></p>
        </div>
    </div>
    <br>
    <!-- REPORTS_PLACEHOLDER -->
</asp:Content>
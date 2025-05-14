<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CorporateBanking.Web45.LoginPage" %>

<asp:Content ID="LoginContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- ASP.NET Login Form (4.5) -->
    <font face="Verdana, Arial, Helvetica, sans-serif" size="3" color="#003366">
        <b>Login to Corporate Online</b>
    </font>
    <hr size="1" noshade color="#CCCCCC">
    <br>
    <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
        Please enter your username and password to access your accounts.
    </font>
    <br><br>
    <table width="100%" border="0" cellspacing="0" cellpadding="3">
        <tr>
            <td width="150" align="right">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Username:</b></font>
            </td>
            <td>
                <!-- ASP:TextBox replacement -->
                <input type="text" id="txtUsername" class="formField" style="width: 200px;" />
            </td>
        </tr>
        <tr>
            <td width="150" align="right">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Password:</b></font>
            </td>
            <td>
                <!-- ASP:TextBox replacement -->
                <input type="password" id="txtPassword" class="formField" style="width: 200px;" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <!-- ASP:Button replacement -->
                <input type="button" id="btnLogin" value="Login" class="formButton" onclick="javascript:window.location.href='/CorporateBanking.Web45/dashboard.aspx';" />
            </td>
        </tr>
    </table>
    <br>
    <table width="100%" border="0" cellspacing="0" cellpadding="3" bgcolor="#F5F5F5">
        <tr>
            <td>
                <font face="Verdana, Arial, Helvetica, sans-serif" size="1">
                    <b>Security Notice:</b> For your security, Corporate Online automatically times out after 30 minutes of inactivity. Please ensure you log out when you have finished your session.
                </font>
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content ID="LoginStatusContent" ContentPlaceHolderID="LoginStatusPlaceHolder" runat="server">
    Please log in
</asp:Content>

<asp:Content ID="LoginLinkContent" ContentPlaceHolderID="LoginLinkPlaceholder" runat="server">
</asp:Content>
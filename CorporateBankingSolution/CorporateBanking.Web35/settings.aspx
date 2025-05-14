<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="settings.aspx.cs" Inherits="CorporateBanking.Web35.SettingsPage" %>

<asp:Content ID="SettingsContent" ContentPlaceHolderID="MainContent" runat="server">
    <font face="Verdana, Arial, Helvetica, sans-serif" size="3" color="#003366">
        <b>Account Settings</b>
    </font>
    <hr size="1" noshade color="#CCCCCC">
    <br>
    <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
        Manage your account settings and preferences below.
    </font>
    <br><br>
    <!-- Settings Form -->
    <!-- SETTINGS_FORM_PLACEHOLDER -->
    <table width="100%" border="0" cellspacing="0" cellpadding="3">
        <tr>
            <td colspan="2" bgcolor="#6699CC" height="25">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF">
                    <b>&nbsp;Personal Details</b>
                </font>
            </td>
        </tr>
        <tr>
            <td width="150" align="right" bgcolor="#F5F5F5">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Full Name:</b></font>
            </td>
            <td bgcolor="#F5F5F5">
                <asp:TextBox ID="txtFullName" runat="server" CssClass="formField" Width="300px" Text="John Smith"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="150" align="right">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Email Address:</b></font>
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="formField" Width="300px" Text="john.smith@example.com"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="150" align="right" bgcolor="#F5F5F5">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Phone Number:</b></font>
            </td>
            <td bgcolor="#F5F5F5">
                <asp:TextBox ID="txtPhone" runat="server" CssClass="formField" Width="300px" Text="(02) 9876 5432"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" bgcolor="#6699CC" height="25">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF">
                    <b>&nbsp;Security Settings</b>
                </font>
            </td>
        </tr>
        <tr>
            <td width="150" align="right" bgcolor="#F5F5F5">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Change Password:</b></font>
            </td>
            <td bgcolor="#F5F5F5">
                <asp:CheckBox ID="chkChangePassword" runat="server" Text=" Yes, I want to change my password" Font-Names="Verdana, Arial, Helvetica, sans-serif" Font-Size="Small" />
            </td>
        </tr>
        <tr>
            <td width="150" align="right">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Current Password:</b></font>
            </td>
            <td>
                <asp:TextBox ID="txtCurrentPassword" runat="server" CssClass="formField" Width="200px" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="150" align="right" bgcolor="#F5F5F5">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>New Password:</b></font>
            </td>
            <td bgcolor="#F5F5F5">
                <asp:TextBox ID="txtNewPassword" runat="server" CssClass="formField" Width="200px" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="150" align="right">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Confirm Password:</b></font>
            </td>
            <td>
                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="formField" Width="200px" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" bgcolor="#6699CC" height="25">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF">
                    <b>&nbsp;Notification Preferences</b>
                </font>
            </td>
        </tr>
        <tr>
            <td width="150" align="right" bgcolor="#F5F5F5">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Email Notifications:</b></font>
            </td>
            <td bgcolor="#F5F5F5">
                <asp:CheckBox ID="chkTransactionAlerts" runat="server" Text=" Transaction alerts" Font-Names="Verdana, Arial, Helvetica, sans-serif" Font-Size="Small" Checked="True" />
                <br>
                <asp:CheckBox ID="chkBalanceAlerts" runat="server" Text=" Low balance alerts" Font-Names="Verdana, Arial, Helvetica, sans-serif" Font-Size="Small" Checked="True" />
                <br>
                <asp:CheckBox ID="chkStatementAlerts" runat="server" Text=" Statement availability alerts" Font-Names="Verdana, Arial, Helvetica, sans-serif" Font-Size="Small" Checked="True" />
            </td>
        </tr>
        <tr>
            <td width="150" align="right">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Balance Threshold:</b></font>
            </td>
            <td>
                <asp:TextBox ID="txtBalanceThreshold" runat="server" CssClass="formField" Width="100px" Text="1000.00"></asp:TextBox>
                <font face="Verdana, Arial, Helvetica, sans-serif" size="1"> (Minimum balance for low balance alerts)</font>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <br>
                <asp:Button ID="btnSaveSettings" runat="server" Text="Save Settings" CssClass="formButton" OnClick="btnSaveSettings_Click" />
                &nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="formButton" OnClick="btnCancel_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
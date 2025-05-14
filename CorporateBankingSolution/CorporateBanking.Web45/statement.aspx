<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="statement.aspx.cs" Inherits="CorporateBanking.Web45.StatementPage" %>

<asp:Content ID="StatementContent" ContentPlaceHolderID="MainContent" runat="server">
    <font face="Verdana, Arial, Helvetica, sans-serif" size="3" color="#003366">
        <b>Transaction Report</b>
    </font>
    <hr size="1" noshade color="#CCCCCC">
    <br>
    
    <!-- XSLT Statement Display -->
    <asp:Xml ID="XmlDisplay" runat="server" 
        DocumentSource="~/CorporateBankingLegacy/Data/sample-report.xml"
        TransformSource="~/CorporateBankingLegacy/Data/ReportTransform.xslt" />
</asp:Content>
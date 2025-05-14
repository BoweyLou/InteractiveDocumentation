<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ModalDialog.ascx.cs" Inherits="CorporateBanking.Web35.Controls.ModalDialog" %>

<div id="modalDialogContainer" style="display: none; position: absolute; top: 200px; left: 250px; width: 400px; border: 2px solid #003366; background-color: #FFFFFF; padding: 0px;">
    <table width="100%" border="0" cellspacing="0" cellpadding="3" bgcolor="#003366">
        <tr>
            <td>
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF">
                    <b><asp:Literal ID="litDialogTitle" runat="server">Modal Dialog</asp:Literal></b>
                </font>
            </td>
            <td align="right">
                <a href="#" onclick="hideModalDialog(); return false;" style="color: #FFFFFF; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; text-decoration: none;">
                    <b>Close [X]</b>
                </a>
            </td>
        </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="10">
        <tr>
            <td>
                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    <asp:PlaceHolder ID="phDialogContent" runat="server">
                        Default dialog content. Override this with your custom content.
                    </asp:PlaceHolder>
                </font>
            </td>
        </tr>
    </table>
</div>

<script type="text/javascript">
function showModalDialog() {
    document.getElementById('modalDialogContainer').style.display = 'block';
    centerModalDialog();
}

function hideModalDialog() {
    document.getElementById('modalDialogContainer').style.display = 'none';
}

function centerModalDialog() {
    var dialog = document.getElementById('modalDialogContainer');
    var winW = document.body.clientWidth;
    var winH = document.body.clientHeight;
    var dialogWidth = dialog.offsetWidth;
    var dialogHeight = dialog.offsetHeight;
    var leftPos = (winW - dialogWidth) / 2;
    var topPos = (winH - dialogHeight) / 3;
    if (topPos < 0) topPos = 0;
    if (leftPos < 0) leftPos = 0;
    dialog.style.left = leftPos + 'px';
    dialog.style.top = topPos + 'px';
}

// Add window resize handler
if (window.addEventListener) {
    window.addEventListener('resize', centerModalDialog, false);
} else if (window.attachEvent) {
    window.attachEvent('onresize', centerModalDialog);
}
</script>
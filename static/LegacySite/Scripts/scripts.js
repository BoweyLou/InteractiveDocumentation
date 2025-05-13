// Corporate Online JavaScript Library
// Created: 15/03/2005
// Last Updated: 24/05/2005

// Include jQuery 1.4.2
document.write('<script src="/LegacySite/Scripts/jquery-1.4.2.js" type="text/javascript"></script>');

// Global Variables
var isIE = (navigator.appName.indexOf("Microsoft") != -1);
var isNetscape = (navigator.appName.indexOf("Netscape") != -1);
var isMozilla = (navigator.userAgent.indexOf("Mozilla") != -1);

// Function to center modal dialogs
function centerDialog() {
    if (document.getElementById("modalDialog")) {
        var dialog = document.getElementById("modalDialog");
        var windowWidth = 0, windowHeight = 0;
        
        if (typeof(window.innerWidth) == 'number') {
            // Non-IE browsers
            windowWidth = window.innerWidth;
            windowHeight = window.innerHeight;
        } else if (document.documentElement && (document.documentElement.clientWidth || document.documentElement.clientHeight)) {
            // IE 6+ in 'standards compliant mode'
            windowWidth = document.documentElement.clientWidth;
            windowHeight = document.documentElement.clientHeight;
        } else if (document.body && (document.body.clientWidth || document.body.clientHeight)) {
            // IE 4 compatible
            windowWidth = document.body.clientWidth;
            windowHeight = document.body.clientHeight;
        }
        
        var dialogWidth = dialog.offsetWidth;
        var dialogHeight = dialog.offsetHeight;
        
        var left = (windowWidth - dialogWidth) / 2;
        var top = (windowHeight - dialogHeight) / 2;
        
        if (top < 0) top = 0;
        if (left < 0) left = 0;
        
        dialog.style.left = left + "px";
        dialog.style.top = top + "px";
        
        // Also size overlay
        if (document.getElementById("overlay")) {
            var overlay = document.getElementById("overlay");
            overlay.style.width = windowWidth + "px";
            overlay.style.height = windowHeight + "px";
        }
    }
}

// Function to show help dialog
function showHelpDialog() {
    var helpDialog = document.getElementById("helpDialog");
    if (helpDialog) {
        // Position dialog
        var windowWidth = 0, windowHeight = 0;
        
        if (typeof(window.innerWidth) == 'number') {
            // Non-IE browsers
            windowWidth = window.innerWidth;
            windowHeight = window.innerHeight;
        } else if (document.documentElement && (document.documentElement.clientWidth || document.documentElement.clientHeight)) {
            // IE 6+ in 'standards compliant mode'
            windowWidth = document.documentElement.clientWidth;
            windowHeight = document.documentElement.clientHeight;
        } else if (document.body && (document.body.clientWidth || document.body.clientWidth)) {
            // IE 4 compatible
            windowWidth = document.body.clientWidth;
            windowHeight = document.body.clientHeight;
        }
        
        var dialogWidth = 400;
        var dialogHeight = 250;
        
        var left = (windowWidth - dialogWidth) / 2;
        var top = (windowHeight - dialogHeight) / 2;
        
        if (top < 0) top = 0;
        if (left < 0) left = 0;
        
        helpDialog.style.left = left + "px";
        helpDialog.style.top = top + "px";
        helpDialog.style.display = "block";
        
        // Create semi-transparent overlay
        var overlay = document.createElement("div");
        overlay.id = "dialogOverlay";
        overlay.style.position = "absolute";
        overlay.style.top = "0px";
        overlay.style.left = "0px";
        overlay.style.width = windowWidth + "px";
        overlay.style.height = windowHeight + "px";
        overlay.style.backgroundColor = "#000000";
        
        if (isIE) {
            overlay.style.filter = "alpha(opacity=50)";
        } else {
            overlay.style.opacity = "0.5";
        }
        
        document.body.appendChild(overlay);
    }
}

// Function to hide help dialog
function hideHelpDialog() {
    var helpDialog = document.getElementById("helpDialog");
    if (helpDialog) {
        helpDialog.style.display = "none";
        
        // Remove overlay
        var overlay = document.getElementById("dialogOverlay");
        if (overlay) {
            document.body.removeChild(overlay);
        }
    }
}

// Function to show confirmation dialog
function showConfirmation(message, onYes, onNo) {
    if (confirm(message)) {
        if (onYes) onYes();
    } else {
        if (onNo) onNo();
    }
}

// Function to update status message
function updateStatus(message) {
    var statusSpan = document.getElementById("statusMessage");
    if (statusSpan) {
        statusSpan.innerHTML = message;
    }
}

// Function to validate form field
function validateField(field, pattern, errorMessage) {
    var value = field.value;
    var isValid = value.match(pattern);
    
    if (!isValid && value != "") {
        alert(errorMessage);
        field.focus();
        field.select();
        return false;
    }
    
    return true;
}

// Function to format currency
function formatCurrency(amount) {
    var i = parseFloat(amount);
    if(isNaN(i)) { i = 0.00; }
    var minus = '';
    if(i < 0) { minus = '-'; }
    i = Math.abs(i);
    i = parseInt((i + .005) * 100);
    i = i / 100;
    s = new String(i);
    if(s.indexOf('.') < 0) { s += '.00'; }
    if(s.indexOf('.') == (s.length - 2)) { s += '0'; }
    s = minus + s;
    return s;
}

// Window resize handler
window.onresize = function() {
    centerDialog();
};

// Document ready function (using jQuery)
$(document).ready(function() {
    // Apply hover effects to navigation
    $(".navLink").hover(
        function() {
            $(this).css("color", "#003366");
            $(this).css("textDecoration", "underline");
        },
        function() {
            $(this).css("color", "#000000");
            $(this).css("textDecoration", "none");
        }
    );
    
    // Add row hover effects to tables
    $(".gridRow, .gridAlternateRow").hover(
        function() {
            $(this).css("backgroundColor", "#E5E5E5");
        },
        function() {
            if ($(this).hasClass("gridRow")) {
                $(this).css("backgroundColor", "#FFFFFF");
            } else {
                $(this).css("backgroundColor", "#F5F5F5");
            }
        }
    );
});

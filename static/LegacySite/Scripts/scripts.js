// Corporate Online JavaScript Library
// Created: 15/03/2005
// Last Updated: 24/05/2005

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

// Function to analyze page and calculate legacy metrics dynamically
function calculateLegacyMetrics() {
    var metrics = {
        inlineStyles: 0,
        stylesheetStyles: 0,
        hiddenTables: 0,
        nestingLevels: 0,
        fontTags: 0,
        tableCount: 0,
        legacyHacks: 0
    };
    
    // Count inline styles
    var elementsWithStyle = document.querySelectorAll('*[style]');
    metrics.inlineStyles = elementsWithStyle.length;
    
    // Count stylesheet rules (approximate)
    var stylesheets = document.styleSheets;
    for (var i = 0; i < stylesheets.length; i++) {
        try {
            // Only count the main stylesheet, not the top banner styles
            var sheet = stylesheets[i];
            if (sheet.href && (sheet.href.indexOf('co.css') !== -1 || sheet.href.indexOf('modern-stub.css') !== -1)) {
                if (sheet.cssRules) {
                    metrics.stylesheetStyles += sheet.cssRules.length;
                }
            }
        } catch (e) {
            // Cross-origin or access issues - estimate based on which CSS is loaded
            var mainStylesheet = document.getElementById('mainStylesheet');
            if (mainStylesheet && mainStylesheet.href.indexOf('co.css') !== -1) {
                metrics.stylesheetStyles += 24; // Legacy CSS has 24 rules (from curl count)
            } else {
                metrics.stylesheetStyles += 0; // Modern stub is empty
            }
        }
    }
    
    // Count hidden tables and legacy hacks
    var allTables = document.getElementsByTagName('table');
    for (var i = 0; i < allTables.length; i++) {
        var table = allTables[i];
        metrics.tableCount++;
        
        var style = window.getComputedStyle ? window.getComputedStyle(table) : table.currentStyle;
        if (style && (style.display === 'none' || style.visibility === 'hidden' || 
            style.position === 'absolute' && (style.left === '-9999px' || style.left === '-10000px'))) {
            metrics.hiddenTables++;
            metrics.legacyHacks++;
        }
    }
    
    // Count font tags
    metrics.fontTags = document.getElementsByTagName('font').length;
    
    // Calculate nesting levels
    var maxNesting = 0;
    var tables = document.getElementsByTagName('table');
    for (var i = 0; i < tables.length; i++) {
        var nesting = 0;
        var parent = tables[i].parentNode;
        while (parent) {
            if (parent.tagName && parent.tagName.toLowerCase() === 'table') {
                nesting++;
            }
            parent = parent.parentNode;
        }
        if (nesting > maxNesting) {
            maxNesting = nesting;
        }
    }
    metrics.nestingLevels = maxNesting;
    
    return metrics;
}

// Function to generate dynamic metrics content
function generateMetricsContent() {
    var metrics = calculateLegacyMetrics();
    var totalStyles = metrics.inlineStyles + metrics.stylesheetStyles;
    var inlinePercentage = totalStyles > 0 ? Math.round((metrics.inlineStyles / totalStyles) * 100) : 0;
    var stylesheetPercentage = 100 - inlinePercentage;
    
    var pageName = document.title.replace('Corporate Online - ', '') || 'Unknown Page';
    
    return '<h4 style="margin: 0 0 10px 0; color: #333;">Legacy Code Analysis - ' + pageName + '</h4>' +
           '<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; font-size: 11px;">' +
           '<div>' +
           '<strong>CSS Distribution:</strong><br>' +
           '• Inline CSS: ' + inlinePercentage + '% (' + metrics.inlineStyles + ' elements)<br>' +
           '• Stylesheet CSS: ' + stylesheetPercentage + '% (' + metrics.stylesheetStyles + ' rules)<br><br>' +
           '<strong>Inline CSS Controls:</strong><br>' +
           '• Elements with style attributes: ' + metrics.inlineStyles + '<br>' +
           '• Font tags used: ' + metrics.fontTags + '<br>' +
           '• Hidden compatibility tables: ' + metrics.hiddenTables + '<br>' +
           '• Maximum table nesting: ' + metrics.nestingLevels + ' levels' +
           '</div>' +
           '<div>' +
           '<strong>Legacy Artifacts:</strong><br>' +
           '• Total tables: ' + metrics.tableCount + '<br>' +
           '• Hidden browser hacks: ' + metrics.legacyHacks + '<br>' +
           '• Legacy font tags: ' + metrics.fontTags + '<br>' +
           '• Mixed styling approaches detected<br><br>' +
           '<strong>Compatibility Issues:</strong><br>' +
           '• IE6/Netscape legacy patterns<br>' +
           '• Nested table layout structure<br>' +
           '• Inline styling inconsistencies<br>' +
           '• Poor separation of concerns' +
           '</div>' +
           '</div>';
}

// Function to toggle legacy metrics panel
// CSS Toggle functionality
function toggleStylesheet() {
    var mainStylesheet = document.getElementById('mainStylesheet');
    var toggleButton = document.getElementById('styleToggle');
    
    if (mainStylesheet && toggleButton) {
        if (mainStylesheet.href.indexOf('co.css') !== -1) {
            mainStylesheet.href = '/LegacySite/Styles/modern-stub.css';
            toggleButton.innerHTML = 'Modern CSS';
            toggleButton.style.background = '#2196F3';
        } else {
            mainStylesheet.href = '/LegacySite/Styles/co.css';
            toggleButton.innerHTML = 'Legacy CSS';
            toggleButton.style.background = '#FF9800';
        }
        
        // Update metrics after CSS change with a delay to allow stylesheet to load
        setTimeout(function() {
            var metricsPanel = document.getElementById('metricsPanel');
            if (metricsPanel && metricsPanel.style.display !== 'none') {
                // Update metrics if panel is visible
                if (typeof generateMetricsContent === 'function') {
                    var metricsContentDiv = document.getElementById('metricsContent');
                    if (metricsContentDiv) {
                        metricsContentDiv.innerHTML = generateMetricsContent();
                    }
                }
            }
        }, 500); // Increased delay to 500ms to ensure stylesheet loads
    }
}

function toggleMetrics() {
    var panel = document.getElementById('metricsPanel');
    var button = document.getElementById('metricsToggle');
    
    if (panel && button) {
        if (panel.style.display === 'none' || panel.style.display === '') {
            // Generate dynamic content when opening
            var contentDiv = panel.querySelector('div[style*="max-width"]');
            if (contentDiv) {
                contentDiv.innerHTML = generateMetricsContent();
            }
            
            panel.style.display = 'block';
            button.innerHTML = 'Hide Legacy Metrics';
            button.style.background = '#f44336';
        } else {
            panel.style.display = 'none';
            button.innerHTML = 'Show Legacy Metrics';
            button.style.background = '#4CAF50';
        }
    }
}

// Legacy browser compatibility - define function globally
window.toggleMetrics = toggleMetrics;

// Alternative inline definition for legacy browsers
if (typeof window.toggleMetrics === 'undefined') {
    window.toggleMetrics = function() {
        var panel = document.getElementById('metricsPanel');
        var button = document.getElementById('metricsToggle');
        
        if (panel && button) {
            if (panel.style.display === 'none' || panel.style.display === '') {
                panel.style.display = 'block';
                button.innerHTML = 'Hide Legacy Metrics';
                button.style.background = '#f44336';
            } else {
                panel.style.display = 'none';
                button.innerHTML = 'Show Legacy Metrics';
                button.style.background = '#4CAF50';
            }
        }
    };
}

// Window resize handler
window.onresize = function() {
    centerDialog();
};

// jQuery Collapsible Panel Function (circa 2005 style)
function initCollapsiblePanel() {
    // Add click handlers to all collapsible panels
    $(".collapsiblePanel .panelHeader").click(function() {
        var panel = $(this).parent();
        var content = panel.find(".panelContent");
        
        if (content.is(":visible")) {
            content.slideUp("slow");
            $(this).find(".collapseIcon").html("+");
        } else {
            content.slideDown("slow");
            $(this).find(".collapseIcon").html("-");
        }
    });
    
    // Initialize all panels as collapsed
    $(".collapsiblePanel .panelContent").hide();
}

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
    
    // Initialize collapsible panels
    initCollapsiblePanel();
});

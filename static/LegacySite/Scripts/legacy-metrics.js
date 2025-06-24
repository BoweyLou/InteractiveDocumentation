// Dynamic legacy metrics functions (legacy browser compatibility)
function calculateLegacyMetrics() {
    var metrics = { inlineStyles: 0, stylesheetStyles: 0, hiddenTables: 0, nestingLevels: 0, fontTags: 0, tableCount: 0, legacyHacks: 0 };
    var elementsWithStyle = document.querySelectorAll ? document.querySelectorAll('*[style]') : [];
    metrics.inlineStyles = elementsWithStyle.length;
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
    var allTables = document.getElementsByTagName('table');
    for (var i = 0; i < allTables.length; i++) {
        var table = allTables[i];
        metrics.tableCount++;
        var style = window.getComputedStyle ? window.getComputedStyle(table) : table.currentStyle;
        if (style && (style.display === 'none' || style.visibility === 'hidden')) {
            metrics.hiddenTables++; 
            metrics.legacyHacks++;
        }
    }
    metrics.fontTags = document.getElementsByTagName('font').length;
    return metrics;
}

function generateMetricsContent() {
    var metrics = calculateLegacyMetrics();
    var totalStyles = metrics.inlineStyles + metrics.stylesheetStyles;
    var inlinePercentage = totalStyles > 0 ? Math.round((metrics.inlineStyles / totalStyles) * 100) : 0;
    var pageName = document.title.replace('Corporate Online - ', '') || 'Report';
    return '<h4 style="margin: 0 0 10px 0; color: #333;">Legacy Code Analysis - ' + pageName + '</h4>' +
           '<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; font-size: 11px;">' +
           '<div><strong>CSS Distribution:</strong><br>• Inline CSS: ' + inlinePercentage + '% (' + metrics.inlineStyles + ' elements)<br>' +
           '• Stylesheet CSS: ' + (100-inlinePercentage) + '% (' + metrics.stylesheetStyles + ' rules)<br><br>' +
           '<strong>Inline CSS Controls:</strong><br>• Elements with style attributes: ' + metrics.inlineStyles + '<br>' +
           '• Font tags used: ' + metrics.fontTags + '<br>• Hidden compatibility tables: ' + metrics.hiddenTables + '</div>' +
           '<div><strong>Legacy Artifacts:</strong><br>• Total tables: ' + metrics.tableCount + '<br>' +
           '• Hidden browser hacks: ' + metrics.legacyHacks + '<br>• Legacy font tags: ' + metrics.fontTags + '<br>' +
           '• XSLT transformation patterns<br><br><strong>Compatibility Issues:</strong><br>' +
           '• Mixed XML namespaces<br>• Inconsistent data formatting</div></div>';
}

function toggleMetrics() {
    var panel = document.getElementById('metricsPanel');
    var button = document.getElementById('metricsToggle');
    if (panel && button) {
        if (panel.style.display === 'none' || panel.style.display === '') {
            var contentDiv = panel.querySelector('div[style*="max-width"]');
            if (contentDiv) contentDiv.innerHTML = generateMetricsContent();
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
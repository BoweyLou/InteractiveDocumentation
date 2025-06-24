# Task 1 CSS Consolidation - Inventory Report

## Overview
This report documents all inline styles, `<style>` blocks, `<font>` tags, and IE-specific hacks found across the LegacySite codebase that need to be consolidated into the main `co.css` stylesheet.

## Files Analyzed
- `static/LegacySite/Pages/dashboard.html`
- `static/LegacySite/Pages/login.html` 
- `static/LegacySite/Pages/settings.html`
- `static/LegacySite/Pages/modal-dialog.html`
- `static/LegacySite/Pages/report-rendered.html`
- `static/LegacySite/Pages/report-fallback.html`
- `static/LegacySite/Data/ReportTransform.xslt`
- `static/LegacySite/Styles/co.css`

## Inline Styles Found

### Global Header Styles (Present in all HTML files)
```html
<div id="globalHeader" style="background-color: #000033 !important; padding: 5px 0 !important; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif !important; color: #FFFFFF !important; font-size: 12px !important; border-bottom: 1px solid #333 !important; position: relative !important; z-index: 10000 !important;">
```

### Form Input Styles
- Login inputs: `style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; width: 150px;"`
- Buttons: `style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; width: 80px; cursor: hand;"`
- Settings form inputs: Various width and font-family combinations

### Modal Dialog Styles
- Container: `style="position: absolute; width: 450px; border: 2px solid #003366; background-color: #FFFFFF;"`
- Overlay: `style="position: absolute; top: 0px; left: 0px; width: 100%; height: 100%; background-color: #000000; filter: alpha(opacity=50); opacity: 0.5;"`
- Marquee: `style="background-color: #FFFFCC; border: 1px solid #FFCC00; width: 100%; height: 20px;"`

### Table Layout Styles
- Spacer tables: `style="display: none; visibility: hidden;"`
- Positioning: `style="position: absolute; left: -9999px; top: -9999px;"`
- Cell styling: `style="padding: 4px 6px; border: 1px inset #CCCCCC;"`

## `<style>` Blocks Found

### ReportTransform.xslt (Lines 14-23)
```css
body { font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; }
.reportHeader { font-size: 14px; font-weight: bold; color: #003366; }
.reportSubHeader { font-size: 12px; color: #000000; }
.tableHeader { background-color: #6699CC; color: #FFFFFF; font-weight: bold; }
.rowEven { background-color: #F5F5F5; }
.rowOdd { background-color: #FFFFFF; }
.creditAmount { color: #008800; }
.debitAmount { color: #FF0000; }
.summaryTable { background-color: #E5E5E5; }
```

## `<font>` Tags Found

### Count by File
- `dashboard.html`: 15+ font tags
- `login.html`: 8+ font tags  
- `settings.html`: 25+ font tags
- `modal-dialog.html`: 6+ font tags
- `report-rendered.html`: 20+ font tags
- `report-fallback.html`: 10+ font tags
- `ReportTransform.xslt`: 8+ font tags

### Common Patterns
- `<font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF">`
- `<font face="Verdana, Arial, Helvetica, sans-serif" size="1">`
- `<font face="Verdana" size="1" style="color: #000080;">`

## IE-Specific Hacks Found

### In co.css
- **Lines 12-18**: Scrollbar styling properties
  ```css
  scrollbar-face-color: #CCCCCC;
  scrollbar-highlight-color: #FFFFFF;
  scrollbar-shadow-color: #999999;
  scrollbar-3dlight-color: #FFFFFF;
  scrollbar-arrow-color: #003366;
  scrollbar-track-color: #F0F0F0;
  scrollbar-darkshadow-color: #666666;
  ```
- **Line 74**: `cursor: hand;` (should be `cursor: pointer;`)
- **Line 118**: `filter: alpha(opacity=50);`

### In HTML Files
- **Zoom hack**: `<div style="zoom: 1; display: none;"></div>`
- **Clearfix hack**: `<br clear="all" style="display: none;">`
- **Hidden compatibility tables**: Multiple spacer tables with `style="display: none; visibility: hidden;"`
- **Safari font hack**: Positioned tables at `-9999px`

## Legacy Browser Compatibility Elements

### Hidden Tables for Layout
- Empty spacer tables in all HTML files
- Width/height="0" tables with `&nbsp;` content
- Tables positioned off-screen for font rendering

### JavaScript Compatibility
- `cursor: hand` instead of `cursor: pointer`
- IE-specific `filter` properties
- Legacy event handling patterns

## Summary Statistics
- **Total inline style attributes**: 50+ across all files
- **Total `<font>` tags**: 90+ across all files  
- **IE-specific hacks in CSS**: 9 properties to remove
- **Legacy compatibility elements**: 15+ hidden tables/divs
- **Embedded style blocks**: 1 in XSLT file

## Consolidation Strategy
1. Create semantic CSS classes for all inline styles
2. Replace all `<font>` tags with appropriate CSS classes
3. Remove IE-specific properties from co.css
4. Move XSLT style block into co.css
5. Remove all legacy browser compatibility hacks
6. Ensure single stylesheet loading per page

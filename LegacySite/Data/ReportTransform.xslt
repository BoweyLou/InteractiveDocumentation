<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  
  <!-- Sort transactions by date (descending) -->
  <xsl:template match="/">
    <table class="reportTable">
      <tr>
        <th>Date</th>
        <th>Transaction ID</th>
        <th>Description</th>
        <th>Category</th>
        <th align="right">Amount</th>
        <th align="right">Balance</th>
      </tr>
      
      <!-- Process each transaction, sorted by DateNum descending -->
      <xsl:for-each select="TransactionReport/Transactions/Transaction">
        <xsl:sort select="@DateNum" data-type="number" order="descending"/>
        
        <!-- Alternate row styling -->
        <xsl:variable name="rowClass">
          <xsl:choose>
            <xsl:when test="position() mod 2 = 1">rowOdd</xsl:when>
            <xsl:otherwise>rowEven</xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        
        <tr class="{$rowClass}">
          <td><xsl:value-of select="Date"/></td>
          <td><xsl:value-of select="@ID"/></td>
          <td><xsl:value-of select="Description"/></td>
          <td><xsl:value-of select="Category"/></td>
          
          <!-- Format amount with color based on positive/negative -->
          <xsl:variable name="amountClass">
            <xsl:choose>
              <xsl:when test="starts-with(Amount, '-')">amountNegative</xsl:when>
              <xsl:otherwise>amountPositive</xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          
          <td align="right" class="{$amountClass}">
            <xsl:choose>
              <xsl:when test="starts-with(Amount, '-')">-$<xsl:value-of select="format-number(substring-after(Amount, '-'), '#,##0.00')"/></xsl:when>
              <xsl:otherwise>$<xsl:value-of select="format-number(Amount, '#,##0.00')"/></xsl:otherwise>
            </xsl:choose>
          </td>
          
          <td align="right">$<xsl:value-of select="format-number(Balance, '#,##0.00')"/></td>
        </tr>
      </xsl:for-each>
      
      <!-- Report summary -->
      <tr class="reportFooter">
        <td colspan="4" align="right">Total:</td>
        <td align="right">$<xsl:value-of select="format-number(/TransactionReport/ReportSummary/NetChange, '#,##0.00')"/></td>
        <td></td>
      </tr>
    </table>
  </xsl:template>
</xsl:stylesheet>

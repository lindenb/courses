<?xml version='1.0'  encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>
<xsl:output method="html"/>

<xsl:template match="/"><html><body>
<xsl:apply-templates select="Result"/>
</body></html></xsl:template>

<xsl:template match="Result">
<table><caption><xsl:value-of select="Term"/></caption>
<tr><th>Database</th><th>Count</th><th>Status</th></tr>
<xsl:apply-templates select="eGQueryResult/ResultItem"/>
</table>
</xsl:template>

<xsl:template match="ResultItem">
<tr>
<td><a>
<xsl:attribute name="href">http://www.ncbi.nlm.nih.gov/pubmed?cmd=search&amp;term=<xsl:value-of select="translate(/Result/Term,' ','+')"/></xsl:attribute>
<xsl:value-of select="DbName"/></a></td>
<td><xsl:value-of select="Count"/></td>
<td><xsl:value-of select="Status"/></td>
</tr>
</xsl:template>

</xsl:stylesheet>


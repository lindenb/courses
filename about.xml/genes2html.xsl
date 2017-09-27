<?xml version='1.0'  encoding="ISO-8859-1"?>
<xsl:stylesheet
xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
version='1.0'
>

<xsl:output method='html'/>

<xsl:template match="/">
<html><body>
<xsl:apply-templates select="genes"/>
</body></html>
</xsl:template>

<xsl:template match="genes">
<h1> 
  <xsl:value-of select="count(gene)"/> genes
</h1>
<xsl:apply-templates select="gene"/>
</xsl:template>

<xsl:template match="gene">
<h2>
<xsl:text>&gt;id:</xsl:text>
<xsl:value-of select="@id"/>
<xsl:text>|</xsl:text>
<xsl:value-of select="name[1]"/>
</h2>
<pre>
<xsl:value-of select="sequence"/>
</pre>
</xsl:template>

</xsl:stylesheet>


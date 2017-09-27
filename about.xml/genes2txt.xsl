<?xml version='1.0'  encoding="ISO-8859-1"?>
<xsl:stylesheet
xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
version='1.0'
>

<xsl:output method='text'/>

<xsl:template match="/">
<xsl:apply-templates select="genes"/>
</xsl:template>

<xsl:template match="genes">
<xsl:apply-templates select="gene"/>
</xsl:template>

<xsl:template match="gene">
<xsl:text>&gt;id:</xsl:text>
<xsl:value-of select="@id"/>
<xsl:text>|</xsl:text>
<xsl:value-of select="name[1]"/>
<xsl:text>
</xsl:text>
<xsl:value-of select="sequence"/>
<xsl:text>
</xsl:text>
</xsl:template>

</xsl:stylesheet>


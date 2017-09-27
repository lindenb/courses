<?xml version='1.0'  encoding="ISO-8859-1"?>
<xsl:stylesheet
xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
xmlns="http://www.w3.org/2000/svg"
xmlns:math="http://exslt.org/math"
version="1.0"
>

<xsl:output method='xml'/>

<xsl:template match="/">
<svg width="500" height="500" version='1.0'>
<xsl:apply-templates select="genes"/>
</svg>
</xsl:template>

<xsl:template match="genes">
<xsl:apply-templates select="gene[1]"/>
</xsl:template>

<xsl:template match="gene">
<text x="250" y="250">
 <xsl:value-of select="name[1]"/>
</text>
<xsl:call-template name="drawseq">
 <xsl:with-param name="i" select="number(1.0)"/>
 <xsl:with-param name="s" select="sequence"/>
</xsl:call-template>
</xsl:template>

<xsl:template name="drawseq">
 <xsl:param name="i"/>
 <xsl:param name="s" />
 <xsl:variable name="L" select="string-length($s)"/>
<text>
 <xsl:variable name="angle" select="$i * ( (2.0*3.14159) div $L )"/>
 <xsl:attribute name="x"><xsl:value-of select="250+200*math:cos( $angle )"/></xsl:attribute>
 <xsl:attribute name="y"><xsl:value-of select="250+200*math:sin( $angle )"/></xsl:attribute>
 <xsl:value-of select="substring($s,$i,1)"/>
</text>

<xsl:if test="$i+1 &lt;= $L">
<xsl:call-template name="drawseq">
 <xsl:with-param name="i" select="1 + $i"/>
 <xsl:with-param name="s" select="$s"/>
</xsl:call-template>
</xsl:if>

</xsl:template>


</xsl:stylesheet>


<?xml version='1.0'  encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>
<xsl:output method="text"/>

<xsl:param name="WebEnv"></xsl:param>

<xsl:template match="/">
<xsl:apply-templates select="TaxaSet"/>
</xsl:template>

<xsl:template match="TaxaSet">
<xsl:text>curl -d @-  "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/epost.fcgi" &lt;&lt;EOF
db=taxonomy&amp;WebEnv=</xsl:text>
<xsl:value-of select="$WebEnv"/>
<xsl:text>&amp;id=</xsl:text>
<xsl:apply-templates select="Taxon"/>
<xsl:text>
EOF
</xsl:text>
</xsl:template>

<xsl:template match="Taxon">
<xsl:apply-templates select="TaxId"/>
<xsl:text>,</xsl:text>
</xsl:template>

</xsl:stylesheet>


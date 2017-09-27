<?xml version='1.0'  encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>
<xsl:output method="text"/>


<xsl:template match="/">
date2count &lt;- list()
<xsl:apply-templates select="/PubmedArticleSet/PubmedArticle[MedlineCitation/DateCreated/Year]"/>
df &lt;- data.frame(
	Year=as.integer(names(date2count)),
	Count=unlist(date2count)
	)
png('jeterpubmed.png')
plot(df)
title('pubmed: count(articles)=f(year)')
dev.off()
</xsl:template>

<xsl:template match="PubmedArticle">
<xsl:variable name="year" select="MedlineCitation/DateCreated/Year"/>
date2count[["<xsl:value-of select="$year"/>"]] &lt;- ifelse(is.null(date2count[["<xsl:value-of select="$year"/>"]]),1,1+date2count[["<xsl:value-of select="$year"/>"]])
</xsl:template>

</xsl:stylesheet>


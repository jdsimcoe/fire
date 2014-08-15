<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text"
    media-type="text/css"
    encoding="UTF-8" />


<xsl:template match="data">
  <xsl:apply-templates select="structure-all/entry" mode="css"/>
</xsl:template>


<xsl:template match="structure-all/entry" mode="css">

  <xsl:text>#</xsl:text>
  <xsl:value-of select="slug"/>
  <xsl:text> .masthead {</xsl:text>
  <xsl:text>background-image:url('</xsl:text>
  <xsl:value-of select="$root"/>
  <xsl:text>/image/2/1800/800/5/0/uploads/images/</xsl:text>
  <xsl:value-of select="hero/item/image/filename"/>
  <xsl:text>');</xsl:text>
  <xsl:text>} </xsl:text>

</xsl:template>


</xsl:stylesheet>
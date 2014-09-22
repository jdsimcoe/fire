<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../utilities/master.xsl"/>


<xsl:template match="data">
  <xsl:choose>
    <xsl:when test="count(structure-url/entry)">
      <xsl:apply-templates select="structure-url/entry" mode="main"/>
    </xsl:when>
    <xsl:when test="string-length(/data/references-single/entry)">
      <xsl:apply-templates select="/data/references-single/entry" mode="main"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="error"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<xsl:template match="structure-url/entry" mode="main">
  <xsl:value-of select="content" disable-output-escaping="yes" />
  <xsl:choose>
    <xsl:when test="slug/@handle = 'contact'">
      <xsl:call-template name="contact-form" />
    </xsl:when>
    <xsl:when test="slug/@handle = 'projects'">
      <xsl:apply-templates select="/data/projects-all" mode="main"/>
    </xsl:when>
    <xsl:when test="slug/@handle = 'references'">
      <xsl:call-template name="references"/>
    </xsl:when>
    <xsl:when test="slug/@handle = 'testimonials'">
      <xsl:apply-templates select="/data/testimonials-all" mode="main"/>
    </xsl:when>
  </xsl:choose>

</xsl:template>


</xsl:stylesheet>
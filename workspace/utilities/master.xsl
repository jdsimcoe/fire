<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="toolkit.xsl"/>
<xsl:import href="date-time-advanced.xsl" />
<xsl:import href="globals.xsl"/>
<xsl:import href="head.xsl"/>
<xsl:import href="navigation.xsl"/>
<xsl:import href="footer.xsl"/>
<xsl:import href="contact.xsl"/>
<xsl:import href="projects.xsl"/>
<xsl:import href="testimonials.xsl"/>
<xsl:import href="error.xsl"/>


<xsl:output method="xml"
    doctype-public="XSLT-compat"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
    omit-xml-declaration="yes"
    encoding="UTF-8"
    indent="yes" />

<xsl:param name="cookie-username" />

<xsl:template match="/">
  <xsl:call-template name="master"/>
</xsl:template>

<xsl:template name="master">

  <html lang="en">

  <xsl:call-template name="head"/>

  <body>
    <xsl:attribute name="id">
      <xsl:choose>
        <xsl:when test="ds-structure-url.slug">
          <xsl:value-of select="ds-structure-url.slug"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$pt1"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>


    <xsl:apply-templates select="data/structure-navigation" mode="main" />
    <xsl:call-template name="jumbotron"/>
    <xsl:apply-templates select="data/structure-navigation" mode="sub" />

    <div class="container">
      <div id="content">
        <xsl:apply-templates />
      </div>
    </div>

    <xsl:call-template name="footer"/>

  </body>

</html>

</xsl:template>


</xsl:stylesheet>
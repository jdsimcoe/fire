<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="references">
  <xsl:choose>
    <xsl:when test="string-length($pt2) = 0">
      <xsl:apply-templates select="/data/references-all" mode="main"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates select="/data/references-single/entry" mode="main"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<xsl:template match="data/references-all" mode="main">
  <div class="row">
    <xsl:for-each select="entry">
      <div class="reference-entry col-md-6">
        <a href="{$root}/{$pt1}/{organization/@handle}">
          <h4><xsl:value-of select="organization"/></h4>
          <hr/>
          <h5><xsl:value-of select="contact-name"/></h5>
        </a>
      </div>
    </xsl:for-each>
  </div>
</xsl:template>


<xsl:template match="data/references-single/entry" mode="main">
  <div class="row">
    <div class="reference col-md-8 col-md-offset-2">
      <xsl:value-of select="content" disable-output-escaping="yes"/>
    </div>
  </div>

  <div class="row">
    <br/>
    <div class="reference-link col-md-8 col-md-offset-2">
      <a class="btn btn-primary btn-large" href="/references/">&#8592; Back to all References</a>
    </div>
  </div>
</xsl:template>


</xsl:stylesheet>

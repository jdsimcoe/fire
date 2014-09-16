<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="references">

  <xsl:choose>
    <xsl:when test="string-length($pt2)">
      <h1>You are Late!</h1>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates select="/data/references-all" mode="main"/>
    </xsl:otherwise>
  </xsl:choose>

</xsl:template>


<xsl:template match="data/references-all" mode="main">

  <div class="row">
    <xsl:for-each select="entry">
      <div class="col-md-6">
        <div class="img-thumbnail">
          <h4><xsl:value-of select="organization"/></h4>
          <h5><em><xsl:value-of select="contact-name"/></em></h5>
          <div class="content">
            <xsl:call-template name="truncate">
              <xsl:with-param name="node" select="content" />
              <xsl:with-param name="length" select="236" />
            </xsl:call-template>
          </div>
        </div>
      </div>
    </xsl:for-each>
  </div>

</xsl:template>


</xsl:stylesheet>

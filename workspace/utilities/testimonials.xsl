<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="data/testimonials-all" mode="main">


<div class="row">
  <xsl:for-each select="entry">
    <xsl:variable name="testimonial-id"><xsl:value-of select="@id"/></xsl:variable>
    <div class="col-md-6">
      <div class="well">
        <blockquote>
          <xsl:value-of select="content" disable-output-escaping="yes"/>
          <cite>—<strong><xsl:value-of select="name"/></strong></cite>
        </blockquote>
          <xsl:if test="/data/projects-all/entry[testimonials/item/@id = $testimonial-id]">
            <hr/>
            <p>
              <small>
              <xsl:text>This testimonial is featured in the following project(s): </xsl:text>
                <xsl:for-each select="/data/projects-all/entry[testimonials/item/@id = $testimonial-id]">
                  <a href="/projects/#{title/@handle}"><xsl:value-of select="title"/></a>
                  <xsl:if test="position() != last()"> ,</xsl:if>
                </xsl:for-each>
              </small>
            </p>
          </xsl:if>

      </div>
    </div>
  </xsl:for-each>
</div>

</xsl:template>


</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="data/projects-all" mode="main">

  <div class="row">
    <div class="col-md-4">
      <ul class="nav nav-pills nav-stacked">
        <xsl:for-each select="entry">
          <li>
            <xsl:attribute name="class">
              <xsl:if test="position() = 1">
                <xsl:text>active</xsl:text>
              </xsl:if>
            </xsl:attribute>
            <a href="#{title/@handle}" data-toggle="pill">
              <xsl:value-of select="short"/>
            </a>
          </li>
        </xsl:for-each>
      </ul>
    </div>
    <hr class="visible-sm visible-xs"/>
    <div class="col-md-8">
      <div class="tab-content">
        <xsl:for-each select="entry">
          <div>
            <xsl:attribute name="class">
              <xsl:choose>
                <xsl:when test="position() = 1">
                  <xsl:text>tab-pane fade in active</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:text>tab-pane fade</xsl:text>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <xsl:attribute name="id">
              <xsl:value-of select="title/@handle"/>
            </xsl:attribute>
            <h3><strong><xsl:value-of select="title"/></strong></h3>
            <h4>
              <xsl:value-of select="city"/>, <xsl:value-of select="state"/>
            </h4>
            <xsl:choose>
              <xsl:when test="count(images/item) = 1">
                <div class="image image-single">
                  <img class="img-responsive" src="{images/item/image/@url}" alt="{image/item/image/caption}"/>
                </div>
              </xsl:when>
              <xsl:otherwise>
                <div class="image image-multiple">
                  <div id="carousel-project-{title/@handle}" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                      <xsl:for-each select="images/item">
                        <li data-target="#carousel-project-{title/@handle}">
                          <xsl:if test="position() = 1">
                            <xsl:attribute name="class">active</xsl:attribute>
                          </xsl:if>
                          <xsl:attribute name="data-slide-to">
                            <xsl:value-of select="position()-1"/>
                          </xsl:attribute>
                        </li>
                      </xsl:for-each>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">

                      <xsl:for-each select="images/item">
                        <div class="item">
                          <xsl:attribute name="class">
                            <xsl:choose>
                              <xsl:when test="position() = 1">item active</xsl:when>
                              <xsl:otherwise>item</xsl:otherwise>
                            </xsl:choose>
                          </xsl:attribute>
                          <img src="{images/item/image/@url}" alt="{image/item/image/caption}"/>
                          <div class="carousel-caption">
                            <h4><xsl:value-of select="title"/></h4>
                            <p><xsl:value-of select="caption"/></p>
                          </div>
                        </div>
                      </xsl:for-each>

                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-project-{title/@handle}" data-slide="prev">
                      <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control" href="#carousel-project-{title/@handle}" data-slide="next">
                      <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                  </div>
                </div>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="content" disable-output-escaping="yes"/>
            <xsl:if test="testimonials/item">
              <hr/>
              <div class="well">
                <xsl:for-each select="testimonials/item">
                  <xsl:if test="position() &gt; 1">
                    <hr/>
                  </xsl:if>
                  <blockquote>
                    <xsl:value-of select="content" disable-output-escaping="yes"/>
                    <cite>—<strong><xsl:value-of select="name"/></strong></cite>
                  </blockquote>
                </xsl:for-each>
              </div>
            </xsl:if>
          </div>
        </xsl:for-each>
      </div>
    </div>
  </div>

</xsl:template>


</xsl:stylesheet>

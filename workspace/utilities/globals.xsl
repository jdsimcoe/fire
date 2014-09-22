<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="jumbotron">

  <div class="jumbotron">
    <a href="{$root}" class="logo">FIRE Restoration</a>
    <div class="tagline">
      <xsl:choose>
        <xsl:when test="count(data/structure-url/entry)">
          <xsl:apply-templates select="/data/structure-url/entry" mode="tagline"/>
        </xsl:when>
        <xsl:when test="string-length(data/structure-url/entry) = 0 and count(data/structure-complex/entry)">
          <xsl:apply-templates select="/data/structure-complex/entry" mode="tagline"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="error-tagline"/>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </div>

</xsl:template>


<xsl:template match="page-data-single/entry" mode="background">

  <xsl:attribute name="style">
    <xsl:text>background-image: url('</xsl:text>
    <xsl:value-of select="$root"/>
    <xsl:text>/image/2/1800/1200/5/0/uploads/images/</xsl:text>
    <xsl:value-of select="image/item/image"/>
    <xsl:text>');</xsl:text>
  </xsl:attribute>

</xsl:template>


<xsl:template name="google-analytics">
  <script>
    <xsl:text>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');</xsl:text>
    <xsl:text>ga('create', '</xsl:text>
    <xsl:value-of select="$ua-id"/>
    <xsl:text>', '</xsl:text>
    <xsl:value-of select="$ua-site"/>
    <xsl:text>');</xsl:text>
    <xsl:text>ga('send', 'pageview');</xsl:text>
  </script>
</xsl:template>


<xsl:template name="typekit">
  <script>
    <xsl:attribute name="src">
      <xsl:text>//use.typekit.net/</xsl:text>
      <xsl:value-of select="$typekit-id"/>
      <xsl:text>.js</xsl:text>
    </xsl:attribute>
  </script>
  <script>try{Typekit.load();}catch(e){}</script>
</xsl:template>


</xsl:stylesheet>

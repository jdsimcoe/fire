<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="structure-navigation" mode="main">

  <nav class="navbar navbar-default" role="navigation">
    <div>
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-fire">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
      </div>

      <div class="collapse navbar-collapse" id="navbar-collapse-fire">

        <ul class="top-nav">
          <li class="visible-xs">
            <a href="{$root}">Home</a>
          </li>
          <xsl:apply-templates select="entry" mode="nav"/>
        </ul>

      </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
  </nav>

</xsl:template>


<xsl:template name="admin-menu">
  <xsl:if test="$cookie-username">
    <li class="dropdown hidden-xs">
      <a href="#" data-toggle="dropdown"><i class="glyphicon glyphicon-wrench"></i></a>
      <ul class="dropdown-menu">
        <li>
          <a href="/symphony/" target="_blank">Symphony</a>
        </li>
        <li>
          <a href="?debug" target="_blank">Debug</a>
        </li>
        <li>
          <a href="?profile" target="_blank">Profile</a>
        </li>
        <li>
          <a href="?logs" target="_blank">Logs</a>
        </li>
        <li>
          <a href="{$root}/symphony/logout/">Logout</a>
        </li>
      </ul>
    </li>
  </xsl:if>
</xsl:template>


<xsl:template match="structure-navigation" mode="sub">


  <xsl:if test="entry != ''">
    <ul class="subnav nav nav-tabs">
      <xsl:apply-templates select="entry" mode="subnav"/>
    </ul>
  </xsl:if>

</xsl:template>


<xsl:template match="structure-navigation/entry" mode="nav">

  <xsl:if test="not(parent/item)">
    <li>
      <xsl:if test="$pt1 = slug">
        <xsl:attribute name="class">
          <xsl:text>active</xsl:text>
        </xsl:attribute>
      </xsl:if>
      <a href="{$root}{path}">
        <xsl:value-of select="title"/>
      </a>
    </li>
  </xsl:if>

</xsl:template>


<xsl:template match="structure-navigation/entry" mode="subnav">

  <xsl:if test="parent/item/@handle = $pt1">
    <li>
      <xsl:if test="slug = $pt2">
        <xsl:attribute name="class">
          <xsl:text>active</xsl:text>
        </xsl:attribute>
      </xsl:if>
      <a href="{$root}{path}">
        <xsl:value-of select="title"/>
      </a>
    </li>
  </xsl:if>

</xsl:template>



<xsl:template match="/data/structure-url/entry" mode="tagline">
  <xsl:value-of select="tagline" disable-output-escaping="yes"/>
</xsl:template>


<xsl:template match="/data/structure-complex/entry" mode="tagline">
  <xsl:value-of select="tagline" disable-output-escaping="yes"/>
</xsl:template>


</xsl:stylesheet>
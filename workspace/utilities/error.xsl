<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="error">
  <p>We're sorry that you weren't able to find what you are looking for. Hopefully you will find what you are looking for in some of our other content:</p>
  <hr/>

  <div class="row">

    <div class="col-md-3">
      <a href="/services/fire-restoration" title="Fire Restoration">
        <div class="panel panel-default">
          <div class="panel-body">
            <h4>Fire</h4>
            <img src="/workspace/img/fire.svg" alt="Fire Restoration" />
          </div>
          <div class="panel-footer">Fire Restoration</div>
        </div>
      </a>
    </div>

    <div class="col-md-3">
      <a href="/services/water-restoration" title="Water Restoration">
        <div class="panel panel-default">
          <div class="panel-body">
            <h4>Water</h4>
            <img src="/workspace/img/water.svg" alt="Water Restoration" />
          </div>
          <div class="panel-footer">Water Restoration</div>
        </div>
      </a>
    </div>

    <div class="col-md-3">
      <a href="/services/wind-restoration" title="Wind Restoration">
        <div class="panel panel-default">
          <div class="panel-body">
            <h4>Wind</h4>
            <img src="/workspace/img/wind.svg" alt="Wind Restoration" />
          </div>
          <div class="panel-footer">Wind Restoration</div>
        </div>
      </a>
    </div>

    <div class="col-md-3">
      <a href="/services/fire-restoration" title="Smoke Restoration">
        <div class="panel panel-default">
          <div class="panel-body">
            <h4>Smoke</h4>
            <img src="/workspace/img/smoke.svg" alt="Smoke Restoration" />
          </div>
          <div class="panel-footer">Smoke Restoration</div>
        </div>
      </a>
    </div>

  </div>
  <p>FIRE Restoration is comprised of the best talent in the construction and restoration industry. With real-world firefighting, construction, and extensive restoration experience, FIRE is uniquely suited to understand the needs of clients and marry those needs with an extensive network of quality subcontractors that are well suited to handle any type of restoration project.</p>
  <p>From big to small, commercial to residential, FIRE Restoration is positioned to handle any and all types of restoration projects.</p>
  <p>Get in touch with us to find out more about how we can serve you:</p>
  <div class="row">
    <div class="col-md-6 col-md-offset-3">
      <div class="btn-group btn-group-lg btn-group-justified">
        <div class="btn-group">
          <a class="btn btn-primary btn-large" href="/contact">Contact Us</a>
        </div>
        <div class="btn-group">
          <a class="btn btn-primary btn-large" href="/about">About Us</a>
        </div>
      </div>
    </div>
  </div>

</xsl:template>


<xsl:template name="error-tagline">
  <h2>Error!</h2>
  <p>The page “<strong><xsl:value-of select="$pt1"/></strong>” you are trying to reach was not found.</p>
</xsl:template>


</xsl:stylesheet>


<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://www.w3.org/1999/xhtml">

<xsl:import href="resource:templates/reST.xsl" />

<xsl:template match="step" name="step">
    <div class="step">
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates />
    </div>
</xsl:template>

<xsl:template match="note" name="note">
	<div class="notes"><xsl:apply-templates /></div>
</xsl:template>

<xsl:template match="/" name="main">
<html>
  <head>
    <title><xsl:value-of select="/document/@title"/></title>

    <xsl:for-each select="/document/templateinfo/header/css">
      <link rel="stylesheet">
        <xsl:copy-of select="@*"/>
      </link>
    </xsl:for-each>

    <xsl:for-each select="/document/templateinfo/header/js">
      <script type="text/javascript">
        <xsl:copy-of select="@*"/>
      </script>
    </xsl:for-each>
	<meta property="og:url" content="https://g0vhk-io.github.io/sitcon-hk-2017-jupyter-tutorial/"/>
	<meta property="og:type" content="article" />
	<meta property="og:title" content="Jupyter 101" />
	<meta property="og:description" content="Jupyter 101" />
	<meta property="og:image" content="images/preview.png" />
	<meta property="og:image:width" content="600" />
	<meta property="og:image:height" content="315" />
  </head>
  <body class="impress-not-supported">
    <a href="https://github.com/g0vhk-io/sitcon-hk-2017-jupyter-tutorial"><img style="position: absolute; top: 0; left: 0; border: 0;" src="https://camo.githubusercontent.com/82b228a3648bf44fc1163ef44c62fcc60081495e/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f6c6566745f7265645f6161303030302e706e67" alt="Fork me on GitHub" data-canonical-src="https://s3.amazonaws.com/github/ribbons/forkme_left_red_aa0000.png"/></a>
    <xsl:for-each select="/document">
      <div id="impress">
        <xsl:if test="@data-perspective">
          <xsl:attribute name="data-perspective">
            <xsl:value-of select="@data-perspective" />
          </xsl:attribute>
        </xsl:if>
        <xsl:if test="@data-transition-duration">
          <xsl:attribute name="data-transition-duration">
            <xsl:value-of select="@data-transition-duration" />
          </xsl:attribute>
        </xsl:if>
        <xsl:if test="@auto-console">
          <xsl:attribute name="auto-console">
            <xsl:value-of select="@auto-console" />
          </xsl:attribute>
        </xsl:if>
        <xsl:for-each select="step">
          <div class="step">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates />
          </div>
        </xsl:for-each>
      </div>
    </xsl:for-each>

    <div id="hovercraft-help">
      <xsl:if test="not(/document/@skip-help)">
        <xsl:attribute name="class">show</xsl:attribute>
      </xsl:if>
      <xsl:if test="/document/@skip-help">
        <xsl:attribute name="class">hide</xsl:attribute>
      </xsl:if>
      <table>
        <tr><th>Left, Down, Page Down, Space</th><td>Next slide</td></tr>
        <tr><th>Right, Up, Page Up</th><td>Previous slide</td></tr>
        <tr><th>H</th><td>Toggle this help</td></tr>
      </table>
    </div>
    <xsl:for-each select="/document/templateinfo/body/js">
      <script type="text/javascript">
        <xsl:copy-of select="@*"/>
      </script>
    </xsl:for-each>

</body>
</html>
</xsl:template>

</xsl:stylesheet>

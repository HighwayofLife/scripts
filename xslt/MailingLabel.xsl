<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output method="html" omit-xml-declaration="no" indent="yes" />
<xsl:template match="CustInfo">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Mailing Label</title>

	<style type="text/css">
	* {
	  font-size: 12px;
	  font-family: Verdana, sans-serif;
		color: #2c2c2c;
	}

  .name {
    display: block;
    text-transform: capitalize;
  }
	</style>
</head>
<body>
	<div class="mailing-label">
	  <span class="name"><xsl:value-of select="FirstName"/>&#160;<xsl:value-of select="LastName"/></span>
	  <xsl:value-of select="Addresss/Street"/><br />
	  <xsl:value-of select="Addresss/City"/>, <xsl:value-of select="Addresss/State"/>&#160;&#160;<xsl:value-of select="substring(Addresss/PostalCode, 1, 5)"/><br />
	  <xsl:value-of select="PhoneNum"/><br />
	  <xsl:value-of select="emailaddress"/>
	</div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>

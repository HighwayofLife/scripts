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
		color: #2c2c2c;
	  font-family: Verdana, sans-serif;
	  font-size: 12px;
		line-height: 22px;
	}

  .name {
    text-transform: capitalize;
  }

  .first-name {
    color: red;
  }

  .last-name {
    color: blue;
  }

  .phone {
    color: red;
    font-weight: bold;
  }
	</style>
</head>
<body>
	<div class="mailing-label">
	  <div class="name">
	    <span class="first-name">
	      <xsl:value-of select="translate(FirstName, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')" />
	    </span>&#160;<span class="last-name">
	      <xsl:value-of select="translate(LastName, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')" />
	    </span>
	  </div>
	  <em class="address"><xsl:value-of select="Addresss/Street"/></em><br />
	  <xsl:value-of select="Addresss/City"/>, <xsl:value-of select="Addresss/State"/>&#160;&#160;<xsl:value-of select="substring(Addresss/PostalCode, 1, 5)"/><br />
	  <div class="phone">
	    <xsl:call-template name="PhoneNumber">
        <xsl:with-param name="number" select="translate(PhoneNum, ')(-. ', '')"/>
	    </xsl:call-template>
	  </div>
	  <xsl:value-of select="substring-after(emailaddress, '@')"/>
	</div>
</body>
</html>
</xsl:template>

<xsl:template name="PhoneNumber">
  <xsl:param name="number"/>
  <xsl:value-of select="substring($number, 1, 3)"/>.<xsl:value-of select="substring($number, 4, 3)"/>.<xsl:value-of select="substring($number, 7, 4)"/>
</xsl:template>
</xsl:stylesheet>

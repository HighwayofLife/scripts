<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output method="html" omit-xml-declaration="no" indent="yes" />
<xsl:template match="/">
	<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Store Listings</title>

	<style type="text/css">
	* {
		color: #000;
		font-size: 10px;
		font-family: Verdana, Arial, sans-serif;
	}

	.store-listing {
		background-color: #d3d3d3;
		border: 1px solid #000;
		margin-bottom: 7px;
		padding: 7px;
		width: 450px;
	}

	.store-listing:hover {
		background-color: #b8b8b8;
	}

	a.store-name {
		color: #006400;
		text-decoration: underline;
	}

	a.store-name:hover {
		color: #16330a;
	}

	.right {
		float: right;
	}
	</style>
	</head>
	<body>
	<h1>Stores</h1>
	<xsl:for-each select="ArrayOfStore/Store[Location='Premium']">
	<xsl:variable name="AddressNum">
		<xsl:value-of select="translate(Address, translate(Address, '01234567890', ''), '')"/>
	</xsl:variable>
	<div class="store-listing">
		<span class="right"><xsl:value-of select="Manager"/></span>
		<a href="http://www.coldwatercreek.com/StoreLocator/Store_Details.aspx?StoreID={ID}" class="store-name"><xsl:value-of select="Name"/></a> - <xsl:value-of select="ID"/><br />
		<xsl:value-of select="Address"/><br />
		<xsl:value-of select="City"/>, <xsl:value-of select="State"/>&#160;&#160;
		<xsl:value-of select="Zip"/>-<xsl:value-of select="substring($AddressNum, string-length($AddressNum) - 3)"/>
		<span class="right"><xsl:value-of select="translate(Phone, '.', '-')"/></span>
	</div>
	</xsl:for-each>
	</body>
	</html>
</xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:cml="http://flashcardmaster.sourceforge.net/cardml/1.0/schema">
	<xsl:variable name="title">Cards</xsl:variable>
	<xsl:output  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" omit-xml-declaration="no" indent="yes" method="html" encoding="UTF-8"/>
	
	<!-- Anything that belongs to the cml namespace must be prefixed /cml: for root and cml: for any children -->
	
	<xsl:template match="/cml:CardDeck">
		<html xmlns="http://www.w3.org/1999/xhtml">
<xsl:comment>
	Generated by Flash Card Master (http://flashcardmaster.sourceforge.net/)
	Create-Review-Print Flash cards with Flash card Master

	Flash Card Master is Licensed under GNU GPL.
</xsl:comment>
			<head>
				<title>
					<xsl:value-of select="$title"/>
				</title>
				
				<style type="text/css"><![CDATA[
		body{
			font-family: verdana, helvetica, arial, sans-serif 
			font-size: 80%;
		}
		table {
			border-collapse: collapse;
			border-spacing: 0;
			overflow: visible;
			width: 100%;
		}
		thead th {
			background-color: #ACBF60; 
			color: black;
			font-variant: small-caps;
			letter-spacing: 0.1em;
			text-align: left;
			padding-left: 5px;
		}
		tbody tr:hover td, tbody th:hover {
			color: black;
			background-color: rgb(228,234,164);
		}
		tbody th, tbody td {
			border-bottom: 1px solid #ccc;
			padding: 2px 10px;
			text-align: left;
			vertical-align: top;
		}
		
		@media print {
			body{
				font-family: "Palatino Linotype", "Helvetica Neue", Helvetica, Arial, sans-serif; 
				font-size: 100%;
			}
		}
		
		/* Font Styles */
		span.bolditalic, span.bold { font-weight: bold; }
		span.bolditalic, span.italic { font-style: italic; }
		span.underline { text-decoration: underline; }
		span.strikethru { text-decoration: line-through; }
		span.super { vertical-align: super; }
		span.sub { vertical-align: sub; }
		span.monospace { font-family: monospace; }
		]]>
		
		<xsl:call-template name="GenerateCSS" />
				
				</style>

			</head>

			<body>
				<h1>
					<xsl:value-of select="$title"/>
				</h1>
				<table>
					<thead>
						<tr>
							<xsl:for-each select="/cml:CardDeck/cml:Fields/cml:Field">
								<th>
									<xsl:value-of select="@name"/>
								</th>
							</xsl:for-each>
						</tr>
					</thead>

					<tbody>
						<xsl:for-each select="/cml:CardDeck/cml:Cards/cml:Card">
							<tr>
								<xsl:apply-templates />
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="GenerateCSS">
		/* These are field-dependent styles. It varies based on content */ 
		<xsl:for-each select="/cml:CardDeck/cml:Fields/cml:Field">
		.<xsl:value-of select="@name"/> { 
			color: <xsl:value-of select="@forecolor"/>; 
			background-color: <xsl:value-of select="@backcolor"/>; 
		} </xsl:for-each>
	</xsl:template>
	
	<xsl:template match="cml:CardField">
		<xsl:element name="td">
			<xsl:attribute name="class">
				<xsl:value-of select="@name"/>
			</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="cml:br">
		<xsl:element name="br" />
	</xsl:template>

	<xsl:template match="cml:Style">
		<xsl:choose>
			<xsl:when test="@type='regular'">
				<xsl:value-of select="text()"/>
			</xsl:when>
			<xsl:when test="@type='linebreak'">
				<br/>
			</xsl:when>
			
			<xsl:otherwise>
				<xsl:element name="span"><xsl:attribute name="class">
						<xsl:value-of select="@type"/>
					</xsl:attribute>
					<xsl:value-of select="text()"/></xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>

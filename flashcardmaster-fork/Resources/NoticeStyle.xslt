﻿<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:variable name="title">Cards</xsl:variable>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
	 <!-- 
	 Generated by Flash Card Master (http://flashcardmaster.sourceforger.net/)
		Create-Review-Print Flash cards with Flash card Master
		
		Licensed under GNU GPL.
      -->
	 <head>
	   <title><xsl:value-of select="$title" /></title>
	 </head>
	 <style>
		table{
			border-collapse: collapse;
			border-spacing: 0;
			overflow: none;
		}
		
		thead th{
			background-color: rgb(224,219,173);
			font-variant: small-caps;
			letter-spacing: 0.1em;
			text-align: left;
			padding-left: 5px;
		}
		
		tbody tr:hover td, tbody th:hover{
			color: black;
			background-color: rgb(228,234,164);
		}
		
		tbody th, tbody td {
			border-bottom: 1px solid #ccc;
			padding: 2px 10px;
			text-align: left;
			vertical-align: top;
		}


	   /* These are field-dependent styles. It varies based on content */
	<xsl:for-each select="CardDeck/Fields/Field">
		.<xsl:value-of select="@name" /> {
			color: <xsl:value-of select="@forecolor" />;
			background-color: <xsl:value-of select="@backcolor" />;
		}
	</xsl:for-each>
	
	#infobox{
			font-family: sans-serif;
			font-size: .8em;
			display: block;
			background-color: rgb(188,142,120);
			padding: 10px;
			border: 1px solid #ccc;
		   }
		   
		   #infobox p, #infobox h3{
			margin: 2px;
		   }
		   
		   #infobox p{
			margin-left: 10px;
		   }
		   
		   #infobox a{
			color: black;
			text-decoration: none;
			background-color: rgb(109,153,163);
			padding-left: 3px;
			padding-right: 3px;
			border: 1px solid black;
		   }
		   
		   #infobox a:hover{
			background-color: rgb(196,193,140);
		   }
	
	</style>
	 
	<body>
		<div id="infobox">
			<h3>Wheelock Chapter 9 to 11</h3>
			<p>This is a sample flash card deck. It uses material from Fredrick Wheelock's Latin course.</p>
			<p><span style="font-weight: bold">Download: </span><a href="#">Xml Format</a> <a href="#">Card format</a></p>
		</div>
	   <h1><xsl:value-of select="$title" /></h1>
	   <table>
		<thead>
		<tr>
		  <xsl:for-each select="CardDeck/Fields/Field">
		    <th><xsl:value-of select="@name" /></th>
		  </xsl:for-each>
		</tr>
		</thead>
		
		<tbody>
		<xsl:for-each select="CardDeck/Cards/Card">
		  <tr>
		    <xsl:for-each select="CardField">
			 <td>
			   <xsl:attribute name="class"><xsl:value-of select="@name"/></xsl:attribute>			   
			   <xsl:value-of select="text()"/>
			 </td>
		    </xsl:for-each>
		  </tr>
		</xsl:for-each>
		</tbody>
	   </table>
	 </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
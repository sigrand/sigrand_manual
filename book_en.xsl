<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
         xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
         xmlns:fo="http://www.w3.org/1999/XSL/Format">
   <xsl:import href="/usr/share/xml/docbook/stylesheet/docbook-xsl-ns/fo/docbook.xsl"/>
   <xsl:param name="sans.font.family">Verdana</xsl:param>
   <xsl:param name="paper.type" select="'A4'"/>
   <xsl:template name="book.titlepage.recto">
	<fo:block-container absolute-position="fixed"
                    top="1cm"
                    left="2cm"
                    right="2cm">
		<fo:block text-align="center"
				font-family="sans-serif"
				font-size="30pt"
				font-weight="bold">
			<xsl:value-of select="''"/>
		</fo:block>
	</fo:block-container>
      <fo:block margin-top="0.3cm" text-align="center">
         <fo:external-graphic src="url('img/Sigrand_logo_blue.png')"/>
      </fo:block>
      <fo:block margin-top="4cm"
                text-align="center"
                hyphenate="false"
                font-family="sans-serif"
                font-size="38pt"
                font-weight="bold">
         <xsl:value-of select="'SG-17R User manual'"/>
      </fo:block>
      <fo:block margin-top="1cm" text-align="center">
         <fo:external-graphic src="url('img/SG-17R_model.png')"/>
      </fo:block>
      <fo:block-container absolute-position="fixed"
                           top="28cm" left="2cm"
                           right="2cm">
         <fo:block text-align="center"
                   font-family="sans-serif"
                   font-size="12pt"
                   font-weight="bold">
            <xsl:value-of select="'Novosibirsk, 2011'"/>
         </fo:block>
      </fo:block-container>
   </xsl:template>
</xsl:stylesheet>

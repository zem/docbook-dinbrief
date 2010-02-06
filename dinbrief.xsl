<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exsl="http://exslt.org/common"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:ng="http://docbook.org/docbook-ng"
                xmlns:db="http://docbook.org/ns/docbook"
                exclude-result-prefixes="db ng exsl"
                version='1.0'>
<!-- Modify this to the docbook.xsl path on your system -->
<xsl:import href="xsl/fo/docbook.xsl"/>

<!-- It is important to use indent="no" here, otherwise verbatim -->
<!-- environments get broken by indented tags...at least when the -->
<!-- callout extension is used...at least with some processors -->
<xsl:output method="xml" indent="no"/>

<!-- ********************************************************************
     $Id: dinbrief.xsl 0000 2010-01-04 22:40:23Z zem $
     ********************************************************************

     This file is not part of the XSL DocBook Stylesheet distribution, but 
     it is derived and distributed unter the same copyright. 
     See ../README or http://docbook.sf.net/release/xsl/current/ for
     copyright and other information.

     ******************************************************************** -->

<!-- ==================================================================== -->


<!-- Update this list if new root elements supported -->
<xsl:variable name="root.elements" select="' appendix article bibliography book chapter colophon dedication glossary index part preface qandaset refentry reference sect1 section set setindex dinbrief '"/>

<!-- modify page setup -->
<xsl:param name="paper.type">A4</xsl:param>
<xsl:param name="page.width">21cm</xsl:param>
<xsl:param name="page.height">29.6984848098cm</xsl:param>

<xsl:template match="dinbrief">
    <fo:page-sequence master-reference="body">
      <fo:static-content flow-name="xsl-region-start"> 
        <!-- <fo:block-container position="absolute" top="86.984848098mm" left="0pt"> -->
        <fo:block-container position="absolute"
                            top="0cm"
                            left="19pt"
                            height="45mm"
                            width="1mm"
                            border-color="black"
                            border-style="solid"
                            border-top-width="0.5pt"
                            border-bottom-width="0.5pt"
                            border-left-width="0pt"
                            border-right-width="0pt"
          >
          <fo:block />
        </fo:block-container>
        <fo:block-container position="absolute"
                            top="5.99848480983cm"
                            left="0pt"
                            height="6.15075759508cm"
                            width="3mm"
                            border-color="black"
                            border-style="solid"
                            border-top-width="0.5pt"
                            border-bottom-width="0.5pt"
                            border-left-width="0pt"
                            border-right-width="0pt"
          >
          <fo:block />
        </fo:block-container>
      </fo:static-content>
      <fo:flow flow-name="xsl-region-body">
	<xsl:call-template name="from.big"/>
	<xsl:call-template name="from.window"/>
	<xsl:call-template name="to"/>
	<xsl:call-template name="date"/>
	<xsl:call-template name="subject"/>
        <fo:block-container border-color="black" border-style="solid" border-width="0pt"
            padding="0mm">
          <fo:block text-align="start" line-height="14pt" 
              space-after="5mm" space-before="5mm">
	 <xsl:for-each select="anrede"><xsl:apply-templates/></xsl:for-each>
          </fo:block>
	 <xsl:for-each select="text"><xsl:apply-templates/></xsl:for-each>
          <fo:block space-before.optimum="1em"  margin-bottom="12mm" space-before="14pt" >
	 <xsl:for-each select="grussformel"><xsl:apply-templates/></xsl:for-each>
          </fo:block>
          <fo:block space-before.optimum="1em" margin-bottom="0mm" margin-top="1.5cm" margin-left="2cm" font-weight="normal">
	 <xsl:for-each select="author/personname"><xsl:apply-templates/></xsl:for-each>
          </fo:block>
        </fo:block-container>
      </fo:flow>
    	</fo:page-sequence>	
</xsl:template>

<xsl:template name="from.big">
        <fo:block-container border-color="black" border-style="solid" border-width="0pt"
            height="45mm" top="0cm" left="0cm" padding="0mm" position="absolute">
        <fo:block text-align="end" line-height="14pt" font-family="sans-serif" font-size="11pt">
		<xsl:value-of select="author/personname"/>
	</fo:block>
	 <xsl:for-each select="author/address/*">
		<xsl:choose>
		<xsl:when test="name(.) = 'city'"></xsl:when>
		<xsl:when test="name(.) = 'postalcode'">
          		<fo:block text-align="end" line-height="14pt" font-family="sans-serif" font-size="11pt">
				<xsl:value-of select="."/>
				<xsl:value-of select="' '"/>
				<xsl:value-of select="../city"/>
			</fo:block>
		</xsl:when>
		<xsl:when test="name(.) = 'phone'">
          		<fo:block text-align="end" line-height="14pt" font-family="sans-serif" font-size="11pt">
				Telefon: <xsl:value-of select="."/>
			</fo:block>
		</xsl:when>
		<xsl:when test="name(.) = 'fax'">
          		<fo:block text-align="end" line-height="14pt" font-family="sans-serif" font-size="11pt">
				Fax: <xsl:value-of select="."/>
			</fo:block>
		</xsl:when>
		<xsl:when test="name(.) = 'email'">
          		<fo:block text-align="end" line-height="14pt" font-family="sans-serif" font-size="11pt">
				E-Mail: <xsl:value-of select="."/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
          		<fo:block text-align="end" line-height="14pt" font-family="sans-serif" font-size="11pt">
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:for-each>
        </fo:block-container>
        <!-- ====================================== -->
</xsl:template>

<xsl:template name="from.window">
        <fo:block-container border-color="black" border-style="solid" border-width="0pt"
            space-before="0mm"
            height="5mm" width="85mm" top="0cm" left="0cm" padding="0mm">
          <fo:block text-align="start" line-height="14pt" font-family="sans-serif" font-size="8pt"
                            border-color="black"
                            border-style="solid"
                            border-top-width="0.0pt"
                            border-bottom-width="0.3pt"
                            border-left-width="0pt"
                            border-right-width="0pt"
          >
	 <xsl:value-of select="author/personname"/>, 
	<xsl:value-of select="author/address/street"/>, 
	<xsl:value-of select="author/address/postalcode"/>
	<xsl:value-of select="' '"/>
	<xsl:value-of select="author/address/city"/>
	<xsl:if test="author/address/country">,  <xsl:value-of select="author/address/country"/></xsl:if>
          </fo:block>
        </fo:block-container>
</xsl:template>

<xsl:template name="to">
        <fo:block-container border-color="black" border-style="solid" border-width="0pt"
            height="37mm" width="85mm" padding="0mm">
          <fo:block text-align="start" line-height="14pt" font-family="serif" font-size="11pt"
            padding-top="5mm" padding-top.minimum="0mm"
            >
	 <xsl:for-each select="address/*">
		<xsl:choose>
		<xsl:when test="name(.) = 'city'"></xsl:when>
		<xsl:when test="name(.) = 'postalcode'">
			<fo:block>
				<xsl:value-of select="."/>
				<xsl:value-of select="' '"/>
				<xsl:value-of select="../city"/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:for-each>
          </fo:block>
        </fo:block-container>
</xsl:template>
        
<xsl:template name="date">
	<fo:block-container border-color="black" border-style="solid" border-width="0pt"
            padding="0mm">
          <fo:block text-align="end" line-height="10pt" font-family="sans-serif" font-size="8pt">
	 <xsl:for-each select="date">
			<xsl:apply-templates/>
	</xsl:for-each>
          </fo:block>
        </fo:block-container>
</xsl:template>

<xsl:template name="subject">
        <fo:block-container border-color="black" border-style="solid" border-width="0pt"
            padding="0mm">
          <fo:block text-align="start" line-height="14pt" font-family="sans-serif" font-size="11pt"
            space-after="20pt"
            space-before="10pt"
            >
            <fo:inline font-weight="bold"><xsl:for-each select="betreff"><xsl:apply-templates/></xsl:for-each></fo:inline>
          </fo:block>
        </fo:block-container>
</xsl:template>

<xsl:template name="setup.pagemasters">
  <fo:layout-master-set>
    <!-- blank pages -->
    <fo:simple-page-master master-name="blank"
                           page-width="{$page.width}"
                           page-height="{$page.height}"
                           margin-top="{$page.margin.top}"
                           margin-bottom="{$page.margin.bottom}">
      <xsl:attribute name="margin-{$direction.align.start}">
        <xsl:value-of select="$page.margin.outer"/>
	<xsl:if test="$fop.extensions != 0">
	  <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
        </xsl:if>
      </xsl:attribute>
      <xsl:attribute name="margin-{$direction.align.end}">
        <xsl:value-of select="$page.margin.inner"/>
      </xsl:attribute>
      <xsl:if test="$axf.extensions != 0">
        <xsl:call-template name="axf-page-master-properties">
          <xsl:with-param name="page.master">blank</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <fo:region-body display-align="center"
                      margin-bottom="{$body.margin.bottom}"
                      margin-top="{$body.margin.top}">
        <xsl:if test="$fop.extensions = 0 and $fop1.extensions = 0">
          <xsl:attribute name="region-name">blank-body</xsl:attribute>
        </xsl:if>
      </fo:region-body>
      <fo:region-before region-name="xsl-region-before-blank"
                        extent="{$region.before.extent}"
                        display-align="before"/>
      <fo:region-after region-name="xsl-region-after-blank"
                       extent="{$region.after.extent}"
                        display-align="after"/>
    </fo:simple-page-master>

    <!-- title pages -->
    <fo:simple-page-master master-name="titlepage-first"
                           page-width="{$page.width}"
                           page-height="{$page.height}"
                           margin-top="{$page.margin.top}"
                           margin-bottom="{$page.margin.bottom}">
      <xsl:attribute name="margin-{$direction.align.start}">
        <xsl:value-of select="$page.margin.inner"/>
	<xsl:if test="$fop.extensions != 0">
	  <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
        </xsl:if>
      </xsl:attribute>
      <xsl:attribute name="margin-{$direction.align.end}">
        <xsl:value-of select="$page.margin.outer"/>
      </xsl:attribute>
      <xsl:if test="$axf.extensions != 0">
        <xsl:call-template name="axf-page-master-properties">
          <xsl:with-param name="page.master">titlepage-first</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <fo:region-body margin-bottom="{$body.margin.bottom}"
                      margin-top="{$body.margin.top}"
                      column-gap="{$column.gap.titlepage}"
                      column-count="{$column.count.titlepage}">
      </fo:region-body>
      <fo:region-before region-name="xsl-region-before-first"
                        extent="{$region.before.extent}"
                        display-align="before"/>
      <fo:region-after region-name="xsl-region-after-first"
                       extent="{$region.after.extent}"
                        display-align="after"/>
    </fo:simple-page-master>

    <fo:simple-page-master master-name="titlepage-odd"
                           page-width="{$page.width}"
                           page-height="{$page.height}"
                           margin-top="{$page.margin.top}"
                           margin-bottom="{$page.margin.bottom}">
      <xsl:attribute name="margin-{$direction.align.start}">
        <xsl:value-of select="$page.margin.inner"/>
	<xsl:if test="$fop.extensions != 0">
	  <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
        </xsl:if>
      </xsl:attribute>
      <xsl:attribute name="margin-{$direction.align.end}">
        <xsl:value-of select="$page.margin.outer"/>
      </xsl:attribute>
      <xsl:if test="$axf.extensions != 0">
        <xsl:call-template name="axf-page-master-properties">
          <xsl:with-param name="page.master">titlepage-odd</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <fo:region-body margin-bottom="{$body.margin.bottom}"
                      margin-top="{$body.margin.top}"
                      column-gap="{$column.gap.titlepage}"
                      column-count="{$column.count.titlepage}">
      </fo:region-body>
      <fo:region-before region-name="xsl-region-before-odd"
                        extent="{$region.before.extent}"
                        display-align="before"/>
      <fo:region-after region-name="xsl-region-after-odd"
                       extent="{$region.after.extent}"
                        display-align="after"/>
    </fo:simple-page-master>

    <fo:simple-page-master master-name="titlepage-even"
                           page-width="{$page.width}"
                           page-height="{$page.height}"
                           margin-top="{$page.margin.top}"
                           margin-bottom="{$page.margin.bottom}">
      <xsl:attribute name="margin-{$direction.align.start}">
        <xsl:value-of select="$page.margin.outer"/>
	<xsl:if test="$fop.extensions != 0">
	  <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
        </xsl:if>
      </xsl:attribute>
      <xsl:attribute name="margin-{$direction.align.end}">
        <xsl:value-of select="$page.margin.inner"/>
      </xsl:attribute>
      <xsl:if test="$axf.extensions != 0">
        <xsl:call-template name="axf-page-master-properties">
          <xsl:with-param name="page.master">titlepage-even</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <fo:region-body margin-bottom="{$body.margin.bottom}"
                      margin-top="{$body.margin.top}"
                      column-gap="{$column.gap.titlepage}"
                      column-count="{$column.count.titlepage}">
      </fo:region-body>
      <fo:region-before region-name="xsl-region-before-even"
                        extent="{$region.before.extent}"
                        display-align="before"/>
      <fo:region-after region-name="xsl-region-after-even"
                       extent="{$region.after.extent}"
                        display-align="after"/>
    </fo:simple-page-master>

    <!-- list-of-title pages -->
    <fo:simple-page-master master-name="lot-first"
                           page-width="{$page.width}"
                           page-height="{$page.height}"
                           margin-top="{$page.margin.top}"
                           margin-bottom="{$page.margin.bottom}">
      <xsl:attribute name="margin-{$direction.align.start}">
        <xsl:value-of select="$page.margin.inner"/>
	<xsl:if test="$fop.extensions != 0">
	  <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
        </xsl:if>
      </xsl:attribute>
      <xsl:attribute name="margin-{$direction.align.end}">
        <xsl:value-of select="$page.margin.outer"/>
      </xsl:attribute>
      <xsl:if test="$axf.extensions != 0">
        <xsl:call-template name="axf-page-master-properties">
          <xsl:with-param name="page.master">lot-first</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <fo:region-body margin-bottom="{$body.margin.bottom}"
                      margin-top="{$body.margin.top}"
                      column-gap="{$column.gap.lot}"
                      column-count="{$column.count.lot}">
      </fo:region-body>
      <fo:region-before region-name="xsl-region-before-first"
                        extent="{$region.before.extent}"
                        display-align="before"/>
      <fo:region-after region-name="xsl-region-after-first"
                       extent="{$region.after.extent}"
                       display-align="after"/>
    </fo:simple-page-master>

    <fo:simple-page-master master-name="lot-odd"
                           page-width="{$page.width}"
                           page-height="{$page.height}"
                           margin-top="{$page.margin.top}"
                           margin-bottom="{$page.margin.bottom}">
      <xsl:attribute name="margin-{$direction.align.start}">
        <xsl:value-of select="$page.margin.inner"/>
	<xsl:if test="$fop.extensions != 0">
	  <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
        </xsl:if>
      </xsl:attribute>
      <xsl:attribute name="margin-{$direction.align.end}">
        <xsl:value-of select="$page.margin.outer"/>
      </xsl:attribute>
      <xsl:if test="$axf.extensions != 0">
        <xsl:call-template name="axf-page-master-properties">
          <xsl:with-param name="page.master">lot-odd</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <fo:region-body margin-bottom="{$body.margin.bottom}"
                      margin-top="{$body.margin.top}"
                      column-gap="{$column.gap.lot}"
                      column-count="{$column.count.lot}">
      </fo:region-body>
      <fo:region-before region-name="xsl-region-before-odd"
                        extent="{$region.before.extent}"
                        display-align="before"/>
      <fo:region-after region-name="xsl-region-after-odd"
                       extent="{$region.after.extent}"
                        display-align="after"/>
    </fo:simple-page-master>

    <fo:simple-page-master master-name="lot-even"
                           page-width="{$page.width}"
                           page-height="{$page.height}"
                           margin-top="{$page.margin.top}"
                           margin-bottom="{$page.margin.bottom}">
      <xsl:attribute name="margin-{$direction.align.start}">
        <xsl:value-of select="$page.margin.outer"/>
	<xsl:if test="$fop.extensions != 0">
	  <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
        </xsl:if>
      </xsl:attribute>
      <xsl:attribute name="margin-{$direction.align.end}">
        <xsl:value-of select="$page.margin.inner"/>
      </xsl:attribute>
      <xsl:if test="$axf.extensions != 0">
        <xsl:call-template name="axf-page-master-properties">
          <xsl:with-param name="page.master">lot-even</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <fo:region-body margin-bottom="{$body.margin.bottom}"
                      margin-top="{$body.margin.top}"
                      column-gap="{$column.gap.lot}"
                      column-count="{$column.count.lot}">
      </fo:region-body>
      <fo:region-before region-name="xsl-region-before-even"
                        extent="{$region.before.extent}"
                        display-align="before"/>
      <fo:region-after region-name="xsl-region-after-even"
                       extent="{$region.after.extent}"
                        display-align="after"/>
    </fo:simple-page-master>

    <!-- frontmatter pages -->
    <fo:simple-page-master master-name="front-first"
                           page-width="{$page.width}"
                           page-height="{$page.height}"
                           margin-top="{$page.margin.top}"
                           margin-bottom="{$page.margin.bottom}">
      <xsl:attribute name="margin-{$direction.align.start}">
        <xsl:value-of select="$page.margin.inner"/>
	<xsl:if test="$fop.extensions != 0">
	  <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
        </xsl:if>
      </xsl:attribute>
      <xsl:attribute name="margin-{$direction.align.end}">
        <xsl:value-of select="$page.margin.outer"/>
      </xsl:attribute>
      <xsl:if test="$axf.extensions != 0">
        <xsl:call-template name="axf-page-master-properties">
          <xsl:with-param name="page.master">front-first</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <fo:region-body margin-bottom="{$body.margin.bottom}"
                      margin-top="{$body.margin.top}"
                      column-gap="{$column.gap.front}"
                      column-count="{$column.count.front}">
      </fo:region-body>
      <fo:region-before region-name="xsl-region-before-first"
                        extent="{$region.before.extent}"
                        display-align="before"/>
      <fo:region-after region-name="xsl-region-after-first"
                       extent="{$region.after.extent}"
                        display-align="after"/>
    </fo:simple-page-master>

    <fo:simple-page-master master-name="front-odd"
                           page-width="{$page.width}"
                           page-height="{$page.height}"
                           margin-top="{$page.margin.top}"
                           margin-bottom="{$page.margin.bottom}">
      <xsl:attribute name="margin-{$direction.align.start}">
        <xsl:value-of select="$page.margin.inner"/>
	<xsl:if test="$fop.extensions != 0">
	  <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
        </xsl:if>
      </xsl:attribute>
      <xsl:attribute name="margin-{$direction.align.end}">
        <xsl:value-of select="$page.margin.outer"/>
      </xsl:attribute>
      <xsl:if test="$axf.extensions != 0">
        <xsl:call-template name="axf-page-master-properties">
          <xsl:with-param name="page.master">front-odd</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <fo:region-body margin-bottom="{$body.margin.bottom}"
                      margin-top="{$body.margin.top}"
                      column-gap="{$column.gap.front}"
                      column-count="{$column.count.front}">
      </fo:region-body>
      <fo:region-before region-name="xsl-region-before-odd"
                        extent="{$region.before.extent}"
                        display-align="before"/>
      <fo:region-after region-name="xsl-region-after-odd"
                       extent="{$region.after.extent}"
                        display-align="after"/>
    </fo:simple-page-master>

    <fo:simple-page-master master-name="front-even"
                           page-width="{$page.width}"
                           page-height="{$page.height}"
                           margin-top="{$page.margin.top}"
                           margin-bottom="{$page.margin.bottom}">
      <xsl:attribute name="margin-{$direction.align.start}">
        <xsl:value-of select="$page.margin.outer"/>
	<xsl:if test="$fop.extensions != 0">
	  <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
        </xsl:if>
      </xsl:attribute>
      <xsl:attribute name="margin-{$direction.align.end}">
        <xsl:value-of select="$page.margin.inner"/>
      </xsl:attribute>
      <xsl:if test="$axf.extensions != 0">
        <xsl:call-template name="axf-page-master-properties">
          <xsl:with-param name="page.master">front-even</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <fo:region-body margin-bottom="{$body.margin.bottom}"
                      margin-top="{$body.margin.top}"
                      column-gap="{$column.gap.front}"
                      column-count="{$column.count.front}">
      </fo:region-body>
      <fo:region-before region-name="xsl-region-before-even"
                        extent="{$region.before.extent}"
                        display-align="before"/>
      <fo:region-after region-name="xsl-region-after-even"
                       extent="{$region.after.extent}"
                        display-align="after"/>
    </fo:simple-page-master>

    <!-- body pages -->
    <fo:simple-page-master master-name="body-first"
                           page-width="{$page.width}"
                           page-height="{$page.height}"
                           margin-top="27mm"
                           margin-bottom="20mm">
      <xsl:attribute name="margin-{$direction.align.start}">
        <xsl:value-of select="'10mm'"/>
	<xsl:if test="$fop.extensions != 0">
	  <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
        </xsl:if>
	<xsl:if test="$fop.extensions != 0">
	  <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
        </xsl:if>
      </xsl:attribute>
      <xsl:attribute name="margin-{$direction.align.end}">
        <xsl:value-of select="'15mm'"/>
      </xsl:attribute>
      <xsl:if test="$axf.extensions != 0">
        <xsl:call-template name="axf-page-master-properties">
          <xsl:with-param name="page.master">body-first</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
            <fo:region-body margin-left="10mm" margin-bottom="40mm" />
            <fo:region-start extent="10mm" />
    </fo:simple-page-master>

    <fo:simple-page-master master-name="body-odd"
                           page-width="{$page.width}"
                           page-height="{$page.height}"
                           margin-top="{$page.margin.top}"
                           margin-bottom="{$page.margin.bottom}">
      <xsl:attribute name="margin-{$direction.align.start}">
        <xsl:value-of select="$page.margin.inner"/>
	<xsl:if test="$fop.extensions != 0">
	  <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
        </xsl:if>
      </xsl:attribute>
      <xsl:attribute name="margin-{$direction.align.end}">
        <xsl:value-of select="$page.margin.outer"/>
      </xsl:attribute>
      <xsl:if test="$axf.extensions != 0">
        <xsl:call-template name="axf-page-master-properties">
          <xsl:with-param name="page.master">body-odd</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <fo:region-body margin-bottom="{$body.margin.bottom}"
                      margin-top="{$body.margin.top}"
                      column-gap="{$column.gap.body}"
                      column-count="{$column.count.body}">
      </fo:region-body>
      <fo:region-before region-name="xsl-region-before-odd"
                        extent="{$region.before.extent}"
                        display-align="before"/>
      <fo:region-after region-name="xsl-region-after-odd"
                       extent="{$region.after.extent}"
                       display-align="after"/>
    </fo:simple-page-master>

    <fo:simple-page-master master-name="body-even"
                           page-width="{$page.width}"
                           page-height="{$page.height}"
                           margin-top="{$page.margin.top}"
                           margin-bottom="{$page.margin.bottom}">
      <xsl:attribute name="margin-{$direction.align.start}">
        <xsl:value-of select="$page.margin.outer"/>
	<xsl:if test="$fop.extensions != 0">
	  <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
        </xsl:if>
      </xsl:attribute>
      <xsl:attribute name="margin-{$direction.align.end}">
        <xsl:value-of select="$page.margin.inner"/>
      </xsl:attribute>
      <xsl:if test="$axf.extensions != 0">
        <xsl:call-template name="axf-page-master-properties">
          <xsl:with-param name="page.master">body-even</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <fo:region-body margin-bottom="{$body.margin.bottom}"
                      margin-top="{$body.margin.top}"
                      column-gap="{$column.gap.body}"
                      column-count="{$column.count.body}">
      </fo:region-body>
      <fo:region-before region-name="xsl-region-before-even"
                        extent="{$region.before.extent}"
                        display-align="before"/>
      <fo:region-after region-name="xsl-region-after-even"
                       extent="{$region.after.extent}"
                       display-align="after"/>
    </fo:simple-page-master>

    <!-- backmatter pages -->
    <fo:simple-page-master master-name="back-first"
                           page-width="{$page.width}"
                           page-height="{$page.height}"
                           margin-top="{$page.margin.top}"
                           margin-bottom="{$page.margin.bottom}">
      <xsl:attribute name="margin-{$direction.align.start}">
        <xsl:value-of select="$page.margin.inner"/>
	<xsl:if test="$fop.extensions != 0">
	  <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
        </xsl:if>
      </xsl:attribute>
      <xsl:attribute name="margin-{$direction.align.end}">
        <xsl:value-of select="$page.margin.outer"/>
      </xsl:attribute>
      <xsl:if test="$axf.extensions != 0">
        <xsl:call-template name="axf-page-master-properties">
          <xsl:with-param name="page.master">back-first</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <fo:region-body margin-bottom="{$body.margin.bottom}"
                      margin-top="{$body.margin.top}"
                      column-gap="{$column.gap.back}"
                      column-count="{$column.count.back}">
      </fo:region-body>
      <fo:region-before region-name="xsl-region-before-first"
                        extent="{$region.before.extent}"
                        display-align="before"/>
      <fo:region-after region-name="xsl-region-after-first"
                       extent="{$region.after.extent}"
                       display-align="after"/>
    </fo:simple-page-master>

    <fo:simple-page-master master-name="back-odd"
                           page-width="{$page.width}"
                           page-height="{$page.height}"
                           margin-top="{$page.margin.top}"
                           margin-bottom="{$page.margin.bottom}">
      <xsl:attribute name="margin-{$direction.align.start}">
        <xsl:value-of select="$page.margin.inner"/>
	<xsl:if test="$fop.extensions != 0">
	  <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
        </xsl:if>
      </xsl:attribute>
      <xsl:attribute name="margin-{$direction.align.end}">
        <xsl:value-of select="$page.margin.outer"/>
      </xsl:attribute>
      <xsl:if test="$axf.extensions != 0">
        <xsl:call-template name="axf-page-master-properties">
          <xsl:with-param name="page.master">back-odd</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <fo:region-body margin-bottom="{$body.margin.bottom}"
                      margin-top="{$body.margin.top}"
                      column-gap="{$column.gap.back}"
                      column-count="{$column.count.back}">
      </fo:region-body>
      <fo:region-before region-name="xsl-region-before-odd"
                        extent="{$region.before.extent}"
                        display-align="before"/>
      <fo:region-after region-name="xsl-region-after-odd"
                       extent="{$region.after.extent}"
                       display-align="after"/>
    </fo:simple-page-master>

    <fo:simple-page-master master-name="back-even"
                           page-width="{$page.width}"
                           page-height="{$page.height}"
                           margin-top="{$page.margin.top}"
                           margin-bottom="{$page.margin.bottom}">
      <xsl:attribute name="margin-{$direction.align.start}">
        <xsl:value-of select="$page.margin.outer"/>
	<xsl:if test="$fop.extensions != 0">
	  <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
        </xsl:if>
      </xsl:attribute>
      <xsl:attribute name="margin-{$direction.align.end}">
        <xsl:value-of select="$page.margin.inner"/>
      </xsl:attribute>
      <xsl:if test="$axf.extensions != 0">
        <xsl:call-template name="axf-page-master-properties">
          <xsl:with-param name="page.master">back-even</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <fo:region-body margin-bottom="{$body.margin.bottom}"
                      margin-top="{$body.margin.top}"
                      column-gap="{$column.gap.back}"
                      column-count="{$column.count.back}">
      </fo:region-body>
      <fo:region-before region-name="xsl-region-before-even"
                        extent="{$region.before.extent}"
                        display-align="before"/>
      <fo:region-after region-name="xsl-region-after-even"
                       extent="{$region.after.extent}"
                       display-align="after"/>
    </fo:simple-page-master>

    <!-- index pages -->
    <fo:simple-page-master master-name="index-first"
                           page-width="{$page.width}"
                           page-height="{$page.height}"
                           margin-top="{$page.margin.top}"
                           margin-bottom="{$page.margin.bottom}">
      <xsl:attribute name="margin-{$direction.align.start}">
        <xsl:value-of select="$page.margin.inner"/>
	<xsl:if test="$fop.extensions != 0">
	  <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
        </xsl:if>
      </xsl:attribute>
      <xsl:attribute name="margin-{$direction.align.end}">
        <xsl:value-of select="$page.margin.outer"/>
      </xsl:attribute>
      <xsl:if test="$axf.extensions != 0">
        <xsl:call-template name="axf-page-master-properties">
          <xsl:with-param name="page.master">index-first</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <fo:region-body margin-bottom="{$body.margin.bottom}"
                      margin-top="{$body.margin.top}"
                      column-gap="{$column.gap.index}"
                      column-count="{$column.count.index}">
      </fo:region-body>
      <fo:region-before region-name="xsl-region-before-first"
                        extent="{$region.before.extent}"
                        display-align="before"/>
      <fo:region-after region-name="xsl-region-after-first"
                       extent="{$region.after.extent}"
                       display-align="after"/>
    </fo:simple-page-master>

    <fo:simple-page-master master-name="index-odd"
                           page-width="{$page.width}"
                           page-height="{$page.height}"
                           margin-top="{$page.margin.top}"
                           margin-bottom="{$page.margin.bottom}">
      <xsl:attribute name="margin-{$direction.align.start}">
        <xsl:value-of select="$page.margin.inner"/>
	<xsl:if test="$fop.extensions != 0">
	  <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
        </xsl:if>
      </xsl:attribute>
      <xsl:attribute name="margin-{$direction.align.end}">
        <xsl:value-of select="$page.margin.outer"/>
      </xsl:attribute>
      <xsl:if test="$axf.extensions != 0">
        <xsl:call-template name="axf-page-master-properties">
          <xsl:with-param name="page.master">index-odd</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <fo:region-body margin-bottom="{$body.margin.bottom}"
                      margin-top="{$body.margin.top}"
                      column-gap="{$column.gap.index}"
                      column-count="{$column.count.index}">
      </fo:region-body>
      <fo:region-before region-name="xsl-region-before-odd"
                        extent="{$region.before.extent}"
                        display-align="before"/>
      <fo:region-after region-name="xsl-region-after-odd"
                       extent="{$region.after.extent}"
                       display-align="after"/>
    </fo:simple-page-master>

    <fo:simple-page-master master-name="index-even"
                           page-width="{$page.width}"
                           page-height="{$page.height}"
                           margin-top="{$page.margin.top}"
                           margin-bottom="{$page.margin.bottom}">
      <xsl:attribute name="margin-{$direction.align.start}">
        <xsl:value-of select="$page.margin.outer"/>
	<xsl:if test="$fop.extensions != 0">
	  <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
        </xsl:if>
      </xsl:attribute>
      <xsl:attribute name="margin-{$direction.align.end}">
        <xsl:value-of select="$page.margin.inner"/>
      </xsl:attribute>
      <xsl:if test="$axf.extensions != 0">
        <xsl:call-template name="axf-page-master-properties">
          <xsl:with-param name="page.master">index-even</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <fo:region-body margin-bottom="{$body.margin.bottom}"
                      margin-top="{$body.margin.top}"
                      column-gap="{$column.gap.index}"
                      column-count="{$column.count.index}">
      </fo:region-body>
      <fo:region-before region-name="xsl-region-before-even"
                        extent="{$region.before.extent}"
                        display-align="before"/>
      <fo:region-after region-name="xsl-region-after-even"
                       extent="{$region.after.extent}"
                       display-align="after"/>
    </fo:simple-page-master>

    <xsl:if test="$draft.mode != 'no'">
      <!-- draft blank pages -->
      <fo:simple-page-master master-name="blank-draft"
                             page-width="{$page.width}"
                             page-height="{$page.height}"
                             margin-top="{$page.margin.top}"
                             margin-bottom="{$page.margin.bottom}">
        <xsl:attribute name="margin-{$direction.align.start}">
          <xsl:value-of select="$page.margin.outer"/>
	  <xsl:if test="$fop.extensions != 0">
	    <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
          </xsl:if>
        </xsl:attribute>
        <xsl:attribute name="margin-{$direction.align.end}">
          <xsl:value-of select="$page.margin.inner"/>
        </xsl:attribute>
        <xsl:if test="$axf.extensions != 0">
          <xsl:call-template name="axf-page-master-properties">
            <xsl:with-param name="page.master">blank-draft</xsl:with-param>
          </xsl:call-template>
        </xsl:if>
        <fo:region-body margin-bottom="{$body.margin.bottom}"
                        margin-top="{$body.margin.top}">
          <xsl:if test="$draft.watermark.image != ''">
            <xsl:attribute name="background-image">
              <xsl:call-template name="fo-external-image">
                <xsl:with-param name="filename" select="$draft.watermark.image"/>
              </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="background-attachment">fixed</xsl:attribute>
            <xsl:attribute name="background-repeat">no-repeat</xsl:attribute>
            <xsl:attribute name="background-position-horizontal">center</xsl:attribute>
            <xsl:attribute name="background-position-vertical">center</xsl:attribute>
          </xsl:if>
        </fo:region-body>
        <fo:region-before region-name="xsl-region-before-blank"
                          extent="{$region.before.extent}"
                          display-align="before"/>
        <fo:region-after region-name="xsl-region-after-blank"
                         extent="{$region.after.extent}"
                         display-align="after"/>
      </fo:simple-page-master>

      <!-- draft title pages -->
      <fo:simple-page-master master-name="titlepage-first-draft"
                             page-width="{$page.width}"
                             page-height="{$page.height}"
                             margin-top="{$page.margin.top}"
                             margin-bottom="{$page.margin.bottom}">
        <xsl:attribute name="margin-{$direction.align.start}">
          <xsl:value-of select="$page.margin.inner"/>
	  <xsl:if test="$fop.extensions != 0">
	    <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
          </xsl:if>
        </xsl:attribute>
        <xsl:attribute name="margin-{$direction.align.end}">
          <xsl:value-of select="$page.margin.outer"/>
        </xsl:attribute>
        <xsl:if test="$axf.extensions != 0">
          <xsl:call-template name="axf-page-master-properties">
            <xsl:with-param name="page.master">titlepage-first-draft</xsl:with-param>
          </xsl:call-template>
        </xsl:if>
        <fo:region-body margin-bottom="{$body.margin.bottom}"
                        margin-top="{$body.margin.top}"
                        column-gap="{$column.gap.titlepage}"
                        column-count="{$column.count.titlepage}">
          <xsl:if test="$draft.watermark.image != ''">
            <xsl:attribute name="background-image">
              <xsl:call-template name="fo-external-image">
                <xsl:with-param name="filename" select="$draft.watermark.image"/>
              </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="background-attachment">fixed</xsl:attribute>
            <xsl:attribute name="background-repeat">no-repeat</xsl:attribute>
            <xsl:attribute name="background-position-horizontal">center</xsl:attribute>
            <xsl:attribute name="background-position-vertical">center</xsl:attribute>
          </xsl:if>
        </fo:region-body>
        <fo:region-before region-name="xsl-region-before-first"
                          extent="{$region.before.extent}"
                          display-align="before"/>
        <fo:region-after region-name="xsl-region-after-first"
                         extent="{$region.after.extent}"
                         display-align="after"/>
      </fo:simple-page-master>

      <fo:simple-page-master master-name="titlepage-odd-draft"
                             page-width="{$page.width}"
                             page-height="{$page.height}"
                             margin-top="{$page.margin.top}"
                             margin-bottom="{$page.margin.bottom}">
        <xsl:attribute name="margin-{$direction.align.start}">
          <xsl:value-of select="$page.margin.inner"/>
	  <xsl:if test="$fop.extensions != 0">
	    <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
          </xsl:if>
        </xsl:attribute>
        <xsl:attribute name="margin-{$direction.align.end}">
          <xsl:value-of select="$page.margin.outer"/>
        </xsl:attribute>
        <xsl:if test="$axf.extensions != 0">
          <xsl:call-template name="axf-page-master-properties">
            <xsl:with-param name="page.master">titlepage-odd-draft</xsl:with-param>
          </xsl:call-template>
        </xsl:if>
        <fo:region-body margin-bottom="{$body.margin.bottom}"
                        margin-top="{$body.margin.top}"
                        column-gap="{$column.gap.titlepage}"
                        column-count="{$column.count.titlepage}">
          <xsl:if test="$draft.watermark.image != ''">
            <xsl:attribute name="background-image">
              <xsl:call-template name="fo-external-image">
                <xsl:with-param name="filename" select="$draft.watermark.image"/>
              </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="background-attachment">fixed</xsl:attribute>
            <xsl:attribute name="background-repeat">no-repeat</xsl:attribute>
            <xsl:attribute name="background-position-horizontal">center</xsl:attribute>
            <xsl:attribute name="background-position-vertical">center</xsl:attribute>
          </xsl:if>
        </fo:region-body>
        <fo:region-before region-name="xsl-region-before-odd"
                          extent="{$region.before.extent}"
                          display-align="before"/>
        <fo:region-after region-name="xsl-region-after-odd"
                         extent="{$region.after.extent}"
                         display-align="after"/>
      </fo:simple-page-master>

      <fo:simple-page-master master-name="titlepage-even-draft"
                             page-width="{$page.width}"
                             page-height="{$page.height}"
                             margin-top="{$page.margin.top}"
                             margin-bottom="{$page.margin.bottom}">
        <xsl:attribute name="margin-{$direction.align.start}">
          <xsl:value-of select="$page.margin.outer"/>
	  <xsl:if test="$fop.extensions != 0">
	    <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
          </xsl:if>
        </xsl:attribute>
        <xsl:attribute name="margin-{$direction.align.end}">
          <xsl:value-of select="$page.margin.inner"/>
        </xsl:attribute>
        <xsl:if test="$axf.extensions != 0">
          <xsl:call-template name="axf-page-master-properties">
            <xsl:with-param name="page.master">titlepage-even-draft</xsl:with-param>
          </xsl:call-template>
        </xsl:if>
        <fo:region-body margin-bottom="{$body.margin.bottom}"
                        margin-top="{$body.margin.top}"
                        column-gap="{$column.gap.titlepage}"
                        column-count="{$column.count.titlepage}">
          <xsl:if test="$draft.watermark.image != ''">
            <xsl:attribute name="background-image">
              <xsl:call-template name="fo-external-image">
                <xsl:with-param name="filename" select="$draft.watermark.image"/>
              </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="background-attachment">fixed</xsl:attribute>
            <xsl:attribute name="background-repeat">no-repeat</xsl:attribute>
            <xsl:attribute name="background-position-horizontal">center</xsl:attribute>
            <xsl:attribute name="background-position-vertical">center</xsl:attribute>
          </xsl:if>
        </fo:region-body>
        <fo:region-before region-name="xsl-region-before-even"
                          extent="{$region.before.extent}"
                          display-align="before"/>
        <fo:region-after region-name="xsl-region-after-even"
                         extent="{$region.after.extent}"
                         display-align="after"/>
      </fo:simple-page-master>

      <!-- draft list-of-title pages -->
      <fo:simple-page-master master-name="lot-first-draft"
                             page-width="{$page.width}"
                             page-height="{$page.height}"
                             margin-top="{$page.margin.top}"
                             margin-bottom="{$page.margin.bottom}">
        <xsl:attribute name="margin-{$direction.align.start}">
          <xsl:value-of select="$page.margin.inner"/>
	  <xsl:if test="$fop.extensions != 0">
	    <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
          </xsl:if>
        </xsl:attribute>
        <xsl:attribute name="margin-{$direction.align.end}">
          <xsl:value-of select="$page.margin.outer"/>
        </xsl:attribute>
        <xsl:if test="$axf.extensions != 0">
          <xsl:call-template name="axf-page-master-properties">
            <xsl:with-param name="page.master">lot-first-draft</xsl:with-param>
          </xsl:call-template>
        </xsl:if>
        <fo:region-body margin-bottom="{$body.margin.bottom}"
                        margin-top="{$body.margin.top}"
                        column-gap="{$column.gap.lot}"
                        column-count="{$column.count.lot}">
          <xsl:if test="$draft.watermark.image != ''">
            <xsl:attribute name="background-image">
              <xsl:call-template name="fo-external-image">
                <xsl:with-param name="filename" select="$draft.watermark.image"/>
              </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="background-attachment">fixed</xsl:attribute>
            <xsl:attribute name="background-repeat">no-repeat</xsl:attribute>
            <xsl:attribute name="background-position-horizontal">center</xsl:attribute>
            <xsl:attribute name="background-position-vertical">center</xsl:attribute>
          </xsl:if>
        </fo:region-body>
        <fo:region-before region-name="xsl-region-before-first"
                          extent="{$region.before.extent}"
                          display-align="before"/>
        <fo:region-after region-name="xsl-region-after-first"
                         extent="{$region.after.extent}"
                         display-align="after"/>
      </fo:simple-page-master>

      <fo:simple-page-master master-name="lot-odd-draft"
                             page-width="{$page.width}"
                             page-height="{$page.height}"
                             margin-top="{$page.margin.top}"
                             margin-bottom="{$page.margin.bottom}">
        <xsl:attribute name="margin-{$direction.align.start}">
          <xsl:value-of select="$page.margin.inner"/>
	  <xsl:if test="$fop.extensions != 0">
	    <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
          </xsl:if>
        </xsl:attribute>
        <xsl:attribute name="margin-{$direction.align.end}">
          <xsl:value-of select="$page.margin.outer"/>
        </xsl:attribute>
        <xsl:if test="$axf.extensions != 0">
          <xsl:call-template name="axf-page-master-properties">
            <xsl:with-param name="page.master">lot-odd-draft</xsl:with-param>
          </xsl:call-template>
        </xsl:if>
        <fo:region-body margin-bottom="{$body.margin.bottom}"
                        margin-top="{$body.margin.top}"
                        column-gap="{$column.gap.lot}"
                        column-count="{$column.count.lot}">
          <xsl:if test="$draft.watermark.image != ''">
            <xsl:attribute name="background-image">
              <xsl:call-template name="fo-external-image">
                <xsl:with-param name="filename" select="$draft.watermark.image"/>
              </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="background-attachment">fixed</xsl:attribute>
            <xsl:attribute name="background-repeat">no-repeat</xsl:attribute>
            <xsl:attribute name="background-position-horizontal">center</xsl:attribute>
            <xsl:attribute name="background-position-vertical">center</xsl:attribute>
          </xsl:if>
        </fo:region-body>
        <fo:region-before region-name="xsl-region-before-odd"
                          extent="{$region.before.extent}"
                          display-align="before"/>
        <fo:region-after region-name="xsl-region-after-odd"
                         extent="{$region.after.extent}"
                         display-align="after"/>
      </fo:simple-page-master>

      <fo:simple-page-master master-name="lot-even-draft"
                             page-width="{$page.width}"
                             page-height="{$page.height}"
                             margin-top="{$page.margin.top}"
                             margin-bottom="{$page.margin.bottom}">
        <xsl:attribute name="margin-{$direction.align.start}">
          <xsl:value-of select="$page.margin.outer"/>
	  <xsl:if test="$fop.extensions != 0">
	    <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
          </xsl:if>
        </xsl:attribute>
        <xsl:attribute name="margin-{$direction.align.end}">
          <xsl:value-of select="$page.margin.inner"/>
        </xsl:attribute>
        <xsl:if test="$axf.extensions != 0">
          <xsl:call-template name="axf-page-master-properties">
            <xsl:with-param name="page.master">lot-even-draft</xsl:with-param>
          </xsl:call-template>
        </xsl:if>
        <fo:region-body margin-bottom="{$body.margin.bottom}"
                        margin-top="{$body.margin.top}"
                        column-gap="{$column.gap.lot}"
                        column-count="{$column.count.lot}">
          <xsl:if test="$draft.watermark.image != ''">
            <xsl:attribute name="background-image">
              <xsl:call-template name="fo-external-image">
                <xsl:with-param name="filename" select="$draft.watermark.image"/>
              </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="background-attachment">fixed</xsl:attribute>
            <xsl:attribute name="background-repeat">no-repeat</xsl:attribute>
            <xsl:attribute name="background-position-horizontal">center</xsl:attribute>
            <xsl:attribute name="background-position-vertical">center</xsl:attribute>
          </xsl:if>
        </fo:region-body>
        <fo:region-before region-name="xsl-region-before-even"
                          extent="{$region.before.extent}"
                          display-align="before"/>
        <fo:region-after region-name="xsl-region-after-even"
                         extent="{$region.after.extent}"
                         display-align="after"/>
      </fo:simple-page-master>

      <!-- draft frontmatter pages -->
      <fo:simple-page-master master-name="front-first-draft"
                             page-width="{$page.width}"
                             page-height="{$page.height}"
                             margin-top="{$page.margin.top}"
                             margin-bottom="{$page.margin.bottom}">
        <xsl:attribute name="margin-{$direction.align.start}">
          <xsl:value-of select="$page.margin.inner"/>
	  <xsl:if test="$fop.extensions != 0">
	    <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
          </xsl:if>
        </xsl:attribute>
        <xsl:attribute name="margin-{$direction.align.end}">
          <xsl:value-of select="$page.margin.outer"/>
        </xsl:attribute>
        <xsl:if test="$axf.extensions != 0">
          <xsl:call-template name="axf-page-master-properties">
            <xsl:with-param name="page.master">front-first-draft</xsl:with-param>
          </xsl:call-template>
        </xsl:if>
        <fo:region-body margin-bottom="{$body.margin.bottom}"
                        margin-top="{$body.margin.top}"
                        column-gap="{$column.gap.front}"
                        column-count="{$column.count.front}">
          <xsl:if test="$draft.watermark.image != ''">
            <xsl:attribute name="background-image">
              <xsl:call-template name="fo-external-image">
                <xsl:with-param name="filename" select="$draft.watermark.image"/>
              </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="background-attachment">fixed</xsl:attribute>
            <xsl:attribute name="background-repeat">no-repeat</xsl:attribute>
            <xsl:attribute name="background-position-horizontal">center</xsl:attribute>
            <xsl:attribute name="background-position-vertical">center</xsl:attribute>
          </xsl:if>
        </fo:region-body>
        <fo:region-before region-name="xsl-region-before-first"
                          extent="{$region.before.extent}"
                          display-align="before"/>
        <fo:region-after region-name="xsl-region-after-first"
                         extent="{$region.after.extent}"
                         display-align="after"/>
      </fo:simple-page-master>

      <fo:simple-page-master master-name="front-odd-draft"
                             page-width="{$page.width}"
                             page-height="{$page.height}"
                             margin-top="{$page.margin.top}"
                             margin-bottom="{$page.margin.bottom}">
        <xsl:attribute name="margin-{$direction.align.start}">
          <xsl:value-of select="$page.margin.inner"/>
	  <xsl:if test="$fop.extensions != 0">
	    <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
          </xsl:if>
        </xsl:attribute>
        <xsl:attribute name="margin-{$direction.align.end}">
          <xsl:value-of select="$page.margin.outer"/>
        </xsl:attribute>
        <xsl:if test="$axf.extensions != 0">
          <xsl:call-template name="axf-page-master-properties">
            <xsl:with-param name="page.master">front-odd-draft</xsl:with-param>
          </xsl:call-template>
        </xsl:if>
        <fo:region-body margin-bottom="{$body.margin.bottom}"
                        margin-top="{$body.margin.top}"
                        column-gap="{$column.gap.front}"
                        column-count="{$column.count.front}">
          <xsl:if test="$draft.watermark.image != ''">
            <xsl:attribute name="background-image">
              <xsl:call-template name="fo-external-image">
                <xsl:with-param name="filename" select="$draft.watermark.image"/>
              </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="background-attachment">fixed</xsl:attribute>
            <xsl:attribute name="background-repeat">no-repeat</xsl:attribute>
            <xsl:attribute name="background-position-horizontal">center</xsl:attribute>
            <xsl:attribute name="background-position-vertical">center</xsl:attribute>
          </xsl:if>
        </fo:region-body>
        <fo:region-before region-name="xsl-region-before-odd"
                          extent="{$region.before.extent}"
                          display-align="before"/>
        <fo:region-after region-name="xsl-region-after-odd"
                         extent="{$region.after.extent}"
                         display-align="after"/>
      </fo:simple-page-master>

      <fo:simple-page-master master-name="front-even-draft"
                             page-width="{$page.width}"
                             page-height="{$page.height}"
                             margin-top="{$page.margin.top}"
                             margin-bottom="{$page.margin.bottom}">
        <xsl:attribute name="margin-{$direction.align.start}">
          <xsl:value-of select="$page.margin.outer"/>
	  <xsl:if test="$fop.extensions != 0">
	    <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
          </xsl:if>
        </xsl:attribute>
        <xsl:attribute name="margin-{$direction.align.end}">
          <xsl:value-of select="$page.margin.inner"/>
        </xsl:attribute>
        <xsl:if test="$axf.extensions != 0">
          <xsl:call-template name="axf-page-master-properties">
            <xsl:with-param name="page.master">front-even-draft</xsl:with-param>
          </xsl:call-template>
        </xsl:if>
        <fo:region-body margin-bottom="{$body.margin.bottom}"
                        margin-top="{$body.margin.top}"
                        column-gap="{$column.gap.front}"
                        column-count="{$column.count.front}">
          <xsl:if test="$draft.watermark.image != ''">
            <xsl:attribute name="background-image">
              <xsl:call-template name="fo-external-image">
                <xsl:with-param name="filename" select="$draft.watermark.image"/>
              </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="background-attachment">fixed</xsl:attribute>
            <xsl:attribute name="background-repeat">no-repeat</xsl:attribute>
            <xsl:attribute name="background-position-horizontal">center</xsl:attribute>
            <xsl:attribute name="background-position-vertical">center</xsl:attribute>
          </xsl:if>
        </fo:region-body>
        <fo:region-before region-name="xsl-region-before-even"
                          extent="{$region.before.extent}"
                          display-align="before"/>
        <fo:region-after region-name="xsl-region-after-even"
                         extent="{$region.after.extent}"
                         display-align="after"/>
      </fo:simple-page-master>

      <!-- draft body pages -->
      <fo:simple-page-master master-name="body-first-draft"
                             page-width="{$page.width}"
                             page-height="{$page.height}"
                             margin-top="{$page.margin.top}"
                             margin-bottom="{$page.margin.bottom}">
        <xsl:attribute name="margin-{$direction.align.start}">
          <xsl:value-of select="$page.margin.inner"/>
	  <xsl:if test="$fop.extensions != 0">
	    <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
          </xsl:if>
        </xsl:attribute>
        <xsl:attribute name="margin-{$direction.align.end}">
          <xsl:value-of select="$page.margin.outer"/>
        </xsl:attribute>
        <xsl:if test="$axf.extensions != 0">
          <xsl:call-template name="axf-page-master-properties">
            <xsl:with-param name="page.master">body-first-draft</xsl:with-param>
          </xsl:call-template>
        </xsl:if>
        <fo:region-body margin-bottom="{$body.margin.bottom}"
                        margin-top="{$body.margin.top}"
                        column-gap="{$column.gap.body}"
                        column-count="{$column.count.body}">
          <xsl:if test="$draft.watermark.image != ''">
            <xsl:attribute name="background-image">
              <xsl:call-template name="fo-external-image">
                <xsl:with-param name="filename" select="$draft.watermark.image"/>
              </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="background-attachment">fixed</xsl:attribute>
            <xsl:attribute name="background-repeat">no-repeat</xsl:attribute>
            <xsl:attribute name="background-position-horizontal">center</xsl:attribute>
            <xsl:attribute name="background-position-vertical">center</xsl:attribute>
          </xsl:if>
        </fo:region-body>
        <fo:region-before region-name="xsl-region-before-first"
                          extent="{$region.before.extent}"
                          display-align="before"/>
        <fo:region-after region-name="xsl-region-after-first"
                         extent="{$region.after.extent}"
                         display-align="after"/>
      </fo:simple-page-master>

      <fo:simple-page-master master-name="body-odd-draft"
                             page-width="{$page.width}"
                             page-height="{$page.height}"
                             margin-top="{$page.margin.top}"
                             margin-bottom="{$page.margin.bottom}">
        <xsl:attribute name="margin-{$direction.align.start}">
          <xsl:value-of select="$page.margin.inner"/>
	  <xsl:if test="$fop.extensions != 0">
	    <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
          </xsl:if>
        </xsl:attribute>
        <xsl:attribute name="margin-{$direction.align.end}">
          <xsl:value-of select="$page.margin.outer"/>
        </xsl:attribute>
        <xsl:if test="$axf.extensions != 0">
          <xsl:call-template name="axf-page-master-properties">
            <xsl:with-param name="page.master">body-odd-draft</xsl:with-param>
          </xsl:call-template>
        </xsl:if>
        <fo:region-body margin-bottom="{$body.margin.bottom}"
                        margin-top="{$body.margin.top}"
                        column-gap="{$column.gap.body}"
                        column-count="{$column.count.body}">
          <xsl:if test="$draft.watermark.image != ''">
            <xsl:attribute name="background-image">
              <xsl:call-template name="fo-external-image">
                <xsl:with-param name="filename" select="$draft.watermark.image"/>
              </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="background-attachment">fixed</xsl:attribute>
            <xsl:attribute name="background-repeat">no-repeat</xsl:attribute>
            <xsl:attribute name="background-position-horizontal">center</xsl:attribute>
            <xsl:attribute name="background-position-vertical">center</xsl:attribute>
          </xsl:if>
        </fo:region-body>
        <fo:region-before region-name="xsl-region-before-odd"
                          extent="{$region.before.extent}"
                          display-align="before"/>
        <fo:region-after region-name="xsl-region-after-odd"
                         extent="{$region.after.extent}"
                         display-align="after"/>
      </fo:simple-page-master>

      <fo:simple-page-master master-name="body-even-draft"
                             page-width="{$page.width}"
                             page-height="{$page.height}"
                             margin-top="{$page.margin.top}"
                             margin-bottom="{$page.margin.bottom}">
        <xsl:attribute name="margin-{$direction.align.start}">
          <xsl:value-of select="$page.margin.outer"/>
	  <xsl:if test="$fop.extensions != 0">
	    <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
          </xsl:if>
        </xsl:attribute>
        <xsl:attribute name="margin-{$direction.align.end}">
          <xsl:value-of select="$page.margin.inner"/>
        </xsl:attribute>
        <xsl:if test="$axf.extensions != 0">
          <xsl:call-template name="axf-page-master-properties">
            <xsl:with-param name="page.master">body-even-draft</xsl:with-param>
          </xsl:call-template>
        </xsl:if>
        <fo:region-body margin-bottom="{$body.margin.bottom}"
                        margin-top="{$body.margin.top}"
                        column-gap="{$column.gap.body}"
                        column-count="{$column.count.body}">
          <xsl:if test="$draft.watermark.image != ''">
            <xsl:attribute name="background-image">
              <xsl:call-template name="fo-external-image">
                <xsl:with-param name="filename" select="$draft.watermark.image"/>
              </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="background-attachment">fixed</xsl:attribute>
            <xsl:attribute name="background-repeat">no-repeat</xsl:attribute>
            <xsl:attribute name="background-position-horizontal">center</xsl:attribute>
            <xsl:attribute name="background-position-vertical">center</xsl:attribute>
          </xsl:if>
        </fo:region-body>
        <fo:region-before region-name="xsl-region-before-even"
                          extent="{$region.before.extent}"
                          display-align="before"/>
        <fo:region-after region-name="xsl-region-after-even"
                         extent="{$region.after.extent}"
                         display-align="after"/>
      </fo:simple-page-master>

      <!-- draft backmatter pages -->
      <fo:simple-page-master master-name="back-first-draft"
                             page-width="{$page.width}"
                             page-height="{$page.height}"
                             margin-top="{$page.margin.top}"
                             margin-bottom="{$page.margin.bottom}">
        <xsl:attribute name="margin-{$direction.align.start}">
          <xsl:value-of select="$page.margin.inner"/>
	  <xsl:if test="$fop.extensions != 0">
	    <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
          </xsl:if>
        </xsl:attribute>
        <xsl:attribute name="margin-{$direction.align.end}">
          <xsl:value-of select="$page.margin.outer"/>
        </xsl:attribute>
        <xsl:if test="$axf.extensions != 0">
          <xsl:call-template name="axf-page-master-properties">
            <xsl:with-param name="page.master">back-first-draft</xsl:with-param>
          </xsl:call-template>
        </xsl:if>
        <fo:region-body margin-bottom="{$body.margin.bottom}"
                        margin-top="{$body.margin.top}"
                        column-gap="{$column.gap.back}"
                        column-count="{$column.count.back}">
          <xsl:if test="$draft.watermark.image != ''">
            <xsl:attribute name="background-image">
              <xsl:call-template name="fo-external-image">
                <xsl:with-param name="filename" select="$draft.watermark.image"/>
              </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="background-attachment">fixed</xsl:attribute>
            <xsl:attribute name="background-repeat">no-repeat</xsl:attribute>
            <xsl:attribute name="background-position-horizontal">center</xsl:attribute>
            <xsl:attribute name="background-position-vertical">center</xsl:attribute>
          </xsl:if>
        </fo:region-body>
        <fo:region-before region-name="xsl-region-before-first"
                          extent="{$region.before.extent}"
                          display-align="before"/>
        <fo:region-after region-name="xsl-region-after-first"
                         extent="{$region.after.extent}"
                         display-align="after"/>
      </fo:simple-page-master>

      <fo:simple-page-master master-name="back-odd-draft"
                             page-width="{$page.width}"
                             page-height="{$page.height}"
                             margin-top="{$page.margin.top}"
                             margin-bottom="{$page.margin.bottom}">
        <xsl:attribute name="margin-{$direction.align.start}">
          <xsl:value-of select="$page.margin.inner"/>
	  <xsl:if test="$fop.extensions != 0">
	    <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
          </xsl:if>
        </xsl:attribute>
        <xsl:attribute name="margin-{$direction.align.end}">
          <xsl:value-of select="$page.margin.outer"/>
        </xsl:attribute>
        <xsl:if test="$axf.extensions != 0">
          <xsl:call-template name="axf-page-master-properties">
            <xsl:with-param name="page.master">back-odd-draft</xsl:with-param>
          </xsl:call-template>
        </xsl:if>
        <fo:region-body margin-bottom="{$body.margin.bottom}"
                        margin-top="{$body.margin.top}"
                        column-gap="{$column.gap.back}"
                        column-count="{$column.count.back}">
          <xsl:if test="$draft.watermark.image != ''">
            <xsl:attribute name="background-image">
              <xsl:call-template name="fo-external-image">
                <xsl:with-param name="filename" select="$draft.watermark.image"/>
              </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="background-attachment">fixed</xsl:attribute>
            <xsl:attribute name="background-repeat">no-repeat</xsl:attribute>
            <xsl:attribute name="background-position-horizontal">center</xsl:attribute>
            <xsl:attribute name="background-position-vertical">center</xsl:attribute>
          </xsl:if>
        </fo:region-body>
        <fo:region-before region-name="xsl-region-before-odd"
                          extent="{$region.before.extent}"
                          display-align="before"/>
        <fo:region-after region-name="xsl-region-after-odd"
                         extent="{$region.after.extent}"
                         display-align="after"/>
      </fo:simple-page-master>

      <fo:simple-page-master master-name="back-even-draft"
                             page-width="{$page.width}"
                             page-height="{$page.height}"
                             margin-top="{$page.margin.top}"
                             margin-bottom="{$page.margin.bottom}">
        <xsl:attribute name="margin-{$direction.align.start}">
          <xsl:value-of select="$page.margin.outer"/>
	  <xsl:if test="$fop.extensions != 0">
	    <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
          </xsl:if>
        </xsl:attribute>
        <xsl:attribute name="margin-{$direction.align.end}">
          <xsl:value-of select="$page.margin.inner"/>
        </xsl:attribute>
        <xsl:if test="$axf.extensions != 0">
          <xsl:call-template name="axf-page-master-properties">
            <xsl:with-param name="page.master">back-even-draft</xsl:with-param>
          </xsl:call-template>
        </xsl:if>
        <fo:region-body margin-bottom="{$body.margin.bottom}"
                        margin-top="{$body.margin.top}"
                        column-gap="{$column.gap.back}"
                        column-count="{$column.count.back}">
          <xsl:if test="$draft.watermark.image != ''">
            <xsl:attribute name="background-image">
              <xsl:call-template name="fo-external-image">
                <xsl:with-param name="filename" select="$draft.watermark.image"/>
              </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="background-attachment">fixed</xsl:attribute>
            <xsl:attribute name="background-repeat">no-repeat</xsl:attribute>
            <xsl:attribute name="background-position-horizontal">center</xsl:attribute>
            <xsl:attribute name="background-position-vertical">center</xsl:attribute>
          </xsl:if>
        </fo:region-body>
        <fo:region-before region-name="xsl-region-before-even"
                          extent="{$region.before.extent}"
                          display-align="before"/>
        <fo:region-after region-name="xsl-region-after-even"
                         extent="{$region.after.extent}"
                         display-align="after"/>
      </fo:simple-page-master>

      <!-- draft index pages -->
      <fo:simple-page-master master-name="index-first-draft"
                             page-width="{$page.width}"
                             page-height="{$page.height}"
                             margin-top="{$page.margin.top}"
                             margin-bottom="{$page.margin.bottom}">
        <xsl:attribute name="margin-{$direction.align.start}">
          <xsl:value-of select="$page.margin.inner"/>
	  <xsl:if test="$fop.extensions != 0">
	    <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
          </xsl:if>
        </xsl:attribute>
        <xsl:attribute name="margin-{$direction.align.end}">
          <xsl:value-of select="$page.margin.outer"/>
        </xsl:attribute>
        <xsl:if test="$axf.extensions != 0">
          <xsl:call-template name="axf-page-master-properties">
            <xsl:with-param name="page.master">index-first-draft</xsl:with-param>
          </xsl:call-template>
        </xsl:if>
        <fo:region-body margin-bottom="{$body.margin.bottom}"
                        margin-top="{$body.margin.top}"
                        column-gap="{$column.gap.index}"
                        column-count="{$column.count.index}">
          <xsl:if test="$draft.watermark.image != ''">
            <xsl:attribute name="background-image">
              <xsl:call-template name="fo-external-image">
                <xsl:with-param name="filename" select="$draft.watermark.image"/>
              </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="background-attachment">fixed</xsl:attribute>
            <xsl:attribute name="background-repeat">no-repeat</xsl:attribute>
            <xsl:attribute name="background-position-horizontal">center</xsl:attribute>
            <xsl:attribute name="background-position-vertical">center</xsl:attribute>
          </xsl:if>
        </fo:region-body>
        <fo:region-before region-name="xsl-region-before-first"
                          extent="{$region.before.extent}"
                          display-align="before"/>
        <fo:region-after region-name="xsl-region-after-first"
                         extent="{$region.after.extent}"
                         display-align="after"/>
      </fo:simple-page-master>

      <fo:simple-page-master master-name="index-odd-draft"
                             page-width="{$page.width}"
                             page-height="{$page.height}"
                             margin-top="{$page.margin.top}"
                             margin-bottom="{$page.margin.bottom}">
        <xsl:attribute name="margin-{$direction.align.start}">
          <xsl:value-of select="$page.margin.inner"/>
	  <xsl:if test="$fop.extensions != 0">
	    <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
          </xsl:if>
        </xsl:attribute>
        <xsl:attribute name="margin-{$direction.align.end}">
          <xsl:value-of select="$page.margin.outer"/>
        </xsl:attribute>
        <xsl:if test="$axf.extensions != 0">
          <xsl:call-template name="axf-page-master-properties">
            <xsl:with-param name="page.master">index-odd-draft</xsl:with-param>
          </xsl:call-template>
        </xsl:if>
        <fo:region-body margin-bottom="{$body.margin.bottom}"
                        margin-top="{$body.margin.top}"
                        column-gap="{$column.gap.index}"
                        column-count="{$column.count.index}">
          <xsl:if test="$draft.watermark.image != ''">
            <xsl:attribute name="background-image">
              <xsl:call-template name="fo-external-image">
                <xsl:with-param name="filename" select="$draft.watermark.image"/>
              </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="background-attachment">fixed</xsl:attribute>
            <xsl:attribute name="background-repeat">no-repeat</xsl:attribute>
            <xsl:attribute name="background-position-horizontal">center</xsl:attribute>
            <xsl:attribute name="background-position-vertical">center</xsl:attribute>
          </xsl:if>
        </fo:region-body>
        <fo:region-before region-name="xsl-region-before-odd"
                          extent="{$region.before.extent}"
                          display-align="before"/>
        <fo:region-after region-name="xsl-region-after-odd"
                         extent="{$region.after.extent}"
                         display-align="after"/>
      </fo:simple-page-master>

      <fo:simple-page-master master-name="index-even-draft"
                             page-width="{$page.width}"
                             page-height="{$page.height}"
                             margin-top="{$page.margin.top}"
                             margin-bottom="{$page.margin.bottom}">
        <xsl:attribute name="margin-{$direction.align.start}">
          <xsl:value-of select="$page.margin.outer"/>
	  <xsl:if test="$fop.extensions != 0">
	    <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
          </xsl:if>
        </xsl:attribute>
        <xsl:attribute name="margin-{$direction.align.end}">
          <xsl:value-of select="$page.margin.inner"/>
        </xsl:attribute>
        <xsl:if test="$axf.extensions != 0">
          <xsl:call-template name="axf-page-master-properties">
            <xsl:with-param name="page.master">index-even-draft</xsl:with-param>
          </xsl:call-template>
        </xsl:if>
        <fo:region-body margin-bottom="{$body.margin.bottom}"
                        margin-top="{$body.margin.top}"
                        column-gap="{$column.gap.index}"
                        column-count="{$column.count.index}">
          <xsl:if test="$draft.watermark.image != ''">
            <xsl:attribute name="background-image">
              <xsl:call-template name="fo-external-image">
                <xsl:with-param name="filename" select="$draft.watermark.image"/>
              </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="background-attachment">fixed</xsl:attribute>
            <xsl:attribute name="background-repeat">no-repeat</xsl:attribute>
            <xsl:attribute name="background-position-horizontal">center</xsl:attribute>
            <xsl:attribute name="background-position-vertical">center</xsl:attribute>
          </xsl:if>
        </fo:region-body>
        <fo:region-before region-name="xsl-region-before-even"
                          extent="{$region.before.extent}"
                          display-align="before"/>
        <fo:region-after region-name="xsl-region-after-even"
                         extent="{$region.after.extent}"
                         display-align="after"/>
      </fo:simple-page-master>
    </xsl:if>

    <!-- setup for title page(s) -->
    <fo:page-sequence-master master-name="titlepage">
      <fo:repeatable-page-master-alternatives>
        <fo:conditional-page-master-reference master-reference="blank"
                                              blank-or-not-blank="blank"/>
        <fo:conditional-page-master-reference master-reference="titlepage-first"
                                              page-position="first"/>
        <fo:conditional-page-master-reference master-reference="titlepage-odd"
                                              odd-or-even="odd"/>
        <fo:conditional-page-master-reference 
                                              odd-or-even="even">
          <xsl:attribute name="master-reference">
            <xsl:choose>
              <xsl:when test="$double.sided != 0">titlepage-even</xsl:when>
              <xsl:otherwise>titlepage-odd</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
        </fo:conditional-page-master-reference>
      </fo:repeatable-page-master-alternatives>
    </fo:page-sequence-master>

    <!-- setup for lots -->
    <fo:page-sequence-master master-name="lot">
      <fo:repeatable-page-master-alternatives>
        <fo:conditional-page-master-reference master-reference="blank"
                                              blank-or-not-blank="blank"/>
        <fo:conditional-page-master-reference master-reference="lot-first"
                                              page-position="first"/>
        <fo:conditional-page-master-reference master-reference="lot-odd"
                                              odd-or-even="odd"/>
        <fo:conditional-page-master-reference 
                                              odd-or-even="even">
          <xsl:attribute name="master-reference">
            <xsl:choose>
              <xsl:when test="$double.sided != 0">lot-even</xsl:when>
              <xsl:otherwise>lot-odd</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
        </fo:conditional-page-master-reference>
      </fo:repeatable-page-master-alternatives>
    </fo:page-sequence-master>

    <!-- setup front matter -->
    <fo:page-sequence-master master-name="front">
      <fo:repeatable-page-master-alternatives>
        <fo:conditional-page-master-reference master-reference="blank"
                                              blank-or-not-blank="blank"/>
        <fo:conditional-page-master-reference master-reference="front-first"
                                              page-position="first"/>
        <fo:conditional-page-master-reference master-reference="front-odd"
                                              odd-or-even="odd"/>
        <fo:conditional-page-master-reference 
                                              odd-or-even="even">
          <xsl:attribute name="master-reference">
            <xsl:choose>
              <xsl:when test="$double.sided != 0">front-even</xsl:when>
              <xsl:otherwise>front-odd</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
        </fo:conditional-page-master-reference>
      </fo:repeatable-page-master-alternatives>
    </fo:page-sequence-master>

    <!-- setup for body pages -->
    <fo:page-sequence-master master-name="body">
      <fo:repeatable-page-master-alternatives>
        <fo:conditional-page-master-reference master-reference="blank"
                                              blank-or-not-blank="blank"/>
        <fo:conditional-page-master-reference master-reference="body-first"
                                              page-position="first"/>
        <fo:conditional-page-master-reference master-reference="body-odd"
                                              odd-or-even="odd"/>
        <fo:conditional-page-master-reference 
                                              odd-or-even="even">
          <xsl:attribute name="master-reference">
            <xsl:choose>
              <xsl:when test="$double.sided != 0">body-even</xsl:when>
              <xsl:otherwise>body-odd</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
        </fo:conditional-page-master-reference>
      </fo:repeatable-page-master-alternatives>
    </fo:page-sequence-master>

    <!-- setup back matter -->
    <fo:page-sequence-master master-name="back">
      <fo:repeatable-page-master-alternatives>
        <fo:conditional-page-master-reference master-reference="blank"
                                              blank-or-not-blank="blank"/>
        <fo:conditional-page-master-reference master-reference="back-first"
                                              page-position="first"/>
        <fo:conditional-page-master-reference master-reference="back-odd"
                                              odd-or-even="odd"/>
        <fo:conditional-page-master-reference 
                                              odd-or-even="even">
          <xsl:attribute name="master-reference">
            <xsl:choose>
              <xsl:when test="$double.sided != 0">back-even</xsl:when>
              <xsl:otherwise>back-odd</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
        </fo:conditional-page-master-reference>
      </fo:repeatable-page-master-alternatives>
    </fo:page-sequence-master>

    <!-- setup back matter -->
    <fo:page-sequence-master master-name="index">
      <fo:repeatable-page-master-alternatives>
        <fo:conditional-page-master-reference master-reference="blank"
                                              blank-or-not-blank="blank"/>
        <fo:conditional-page-master-reference master-reference="index-first"
                                              page-position="first"/>
        <fo:conditional-page-master-reference master-reference="index-odd"
                                              odd-or-even="odd"/>
        <fo:conditional-page-master-reference 
                                              odd-or-even="even">
          <xsl:attribute name="master-reference">
            <xsl:choose>
              <xsl:when test="$double.sided != 0">index-even</xsl:when>
              <xsl:otherwise>index-odd</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
        </fo:conditional-page-master-reference>
      </fo:repeatable-page-master-alternatives>
    </fo:page-sequence-master>

    <xsl:if test="$draft.mode != 'no'">
      <!-- setup for draft title page(s) -->
      <fo:page-sequence-master master-name="titlepage-draft">
        <fo:repeatable-page-master-alternatives>
          <fo:conditional-page-master-reference master-reference="blank-draft"
                                                blank-or-not-blank="blank"/>
          <fo:conditional-page-master-reference master-reference="titlepage-first-draft"
                                                page-position="first"/>
          <fo:conditional-page-master-reference master-reference="titlepage-odd-draft"
                                                odd-or-even="odd"/>
          <fo:conditional-page-master-reference 
                                                odd-or-even="even">
            <xsl:attribute name="master-reference">
              <xsl:choose>
                <xsl:when test="$double.sided != 0">titlepage-even-draft</xsl:when>
                <xsl:otherwise>titlepage-odd-draft</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
          </fo:conditional-page-master-reference>
        </fo:repeatable-page-master-alternatives>
      </fo:page-sequence-master>

      <!-- setup for draft lots -->
      <fo:page-sequence-master master-name="lot-draft">
        <fo:repeatable-page-master-alternatives>
          <fo:conditional-page-master-reference master-reference="blank-draft"
                                                blank-or-not-blank="blank"/>
          <fo:conditional-page-master-reference master-reference="lot-first-draft"
                                                page-position="first"/>
          <fo:conditional-page-master-reference master-reference="lot-odd-draft"
                                                odd-or-even="odd"/>
          <fo:conditional-page-master-reference 
                                                odd-or-even="even">
            <xsl:attribute name="master-reference">
              <xsl:choose>
                <xsl:when test="$double.sided != 0">lot-even-draft</xsl:when>
                <xsl:otherwise>lot-odd-draft</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
          </fo:conditional-page-master-reference>
        </fo:repeatable-page-master-alternatives>
      </fo:page-sequence-master>

      <!-- setup draft front matter -->
      <fo:page-sequence-master master-name="front-draft">
        <fo:repeatable-page-master-alternatives>
          <fo:conditional-page-master-reference master-reference="blank-draft"
                                                blank-or-not-blank="blank"/>
          <fo:conditional-page-master-reference master-reference="front-first-draft"
                                                page-position="first"/>
          <fo:conditional-page-master-reference master-reference="front-odd-draft"
                                                odd-or-even="odd"/>
          <fo:conditional-page-master-reference 
                                                odd-or-even="even">
            <xsl:attribute name="master-reference">
              <xsl:choose>
                <xsl:when test="$double.sided != 0">front-even-draft</xsl:when>
                <xsl:otherwise>front-odd-draft</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
          </fo:conditional-page-master-reference>
        </fo:repeatable-page-master-alternatives>
      </fo:page-sequence-master>

      <!-- setup for draft body pages -->
      <fo:page-sequence-master master-name="body-draft">
        <fo:repeatable-page-master-alternatives>
          <fo:conditional-page-master-reference master-reference="blank-draft"
                                                blank-or-not-blank="blank"/>
          <fo:conditional-page-master-reference master-reference="body-first-draft"
                                                page-position="first"/>
          <fo:conditional-page-master-reference master-reference="body-odd-draft"
                                                odd-or-even="odd"/>
          <fo:conditional-page-master-reference 
                                                odd-or-even="even">
            <xsl:attribute name="master-reference">
              <xsl:choose>
                <xsl:when test="$double.sided != 0">body-even-draft</xsl:when>
                <xsl:otherwise>body-odd-draft</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
          </fo:conditional-page-master-reference>
        </fo:repeatable-page-master-alternatives>
      </fo:page-sequence-master>

      <!-- setup draft back matter -->
      <fo:page-sequence-master master-name="back-draft">
        <fo:repeatable-page-master-alternatives>
          <fo:conditional-page-master-reference master-reference="blank-draft"
                                                blank-or-not-blank="blank"/>
          <fo:conditional-page-master-reference master-reference="back-first-draft"
                                                page-position="first"/>
          <fo:conditional-page-master-reference master-reference="back-odd-draft"
                                                odd-or-even="odd"/>
          <fo:conditional-page-master-reference 
                                                odd-or-even="even">
            <xsl:attribute name="master-reference">
              <xsl:choose>
                <xsl:when test="$double.sided != 0">back-even-draft</xsl:when>
                <xsl:otherwise>back-odd-draft</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
          </fo:conditional-page-master-reference>
        </fo:repeatable-page-master-alternatives>
      </fo:page-sequence-master>

      <!-- setup draft index pages -->
      <fo:page-sequence-master master-name="index-draft">
        <fo:repeatable-page-master-alternatives>
          <fo:conditional-page-master-reference master-reference="blank-draft"
                                                blank-or-not-blank="blank"/>
          <fo:conditional-page-master-reference master-reference="index-first-draft"
                                                page-position="first"/>
          <fo:conditional-page-master-reference master-reference="index-odd-draft"
                                                odd-or-even="odd"/>
          <fo:conditional-page-master-reference 
                                                odd-or-even="even">
            <xsl:attribute name="master-reference">
              <xsl:choose>
                <xsl:when test="$double.sided != 0">index-even-draft</xsl:when>
                <xsl:otherwise>index-odd-draft</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
          </fo:conditional-page-master-reference>
        </fo:repeatable-page-master-alternatives>
      </fo:page-sequence-master>
    </xsl:if>

    <xsl:call-template name="user.pagemasters"/>

    </fo:layout-master-set>
</xsl:template>

</xsl:stylesheet>

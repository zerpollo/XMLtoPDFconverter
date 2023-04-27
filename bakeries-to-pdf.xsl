<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version="1.0">
    <xsl:output encoding="UTF-8" indent="yes" method="xml" standalone="no" omit-xml-declaration="no"/>
    <xsl:template match="/">
        <fo:root language="EN">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4-portrait" page-height="297mm"
                                       page-width="290mm" margin-top="5mm"
                                       margin-bottom="5mm" margin-left="5mm"
                                       margin-right="5mm">
                    <fo:region-body margin-top="25mm" margin-bottom="20mm"/>
                    <fo:region-before region-name="xsl-region-before" extent="25mm" display-align="before"
                                      precedence="true"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="A4-portrait">

                <fo:flow flow-name="xsl-region-body" border-collapse="collapse" reference-orientation="0">
                    <fo:block vertical-align="top" text-align="center">
<!--                        <fo:instream-foreign-object src="countries.svg">-->
                               <!--  inline SVG here -->
<!--                        </fo:instream-foreign-object>-->
                        <fo:external-graphic src="bakerysvg.svg" content-width="50%">

                        </fo:external-graphic>
                    </fo:block>
                    <fo:block text-align="center">
                        <fo:table table-layout="fixed" width="95%" font-size="10pt"
                                  border-color="grey" border-width="0.1mm"
                                  border-style="solid" text-align="center"
                                  display-align="center" space-after="5mm">
                            <fo:table-column column-width="proportional-column-width(50)"/>
                            <fo:table-column column-width="proportional-column-width(50)"/>
                            <fo:table-column column-width="proportional-column-width(50)"/>
                            <fo:table-column column-width="proportional-column-width(20)"/>
                            <fo:table-column column-width="proportional-column-width(30)"/>
                            <fo:table-body font-size="95%">
                                <fo:table-row height="8mm" border-color="grey"
                                              border-width="0.1mm" border-style="solid"
                                              text-align="start" display-align="center"
                                              space-after="5mm">
                                    <fo:table-cell>
                                        <fo:block>ID</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block>First name</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block>Last name</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block>Phone number</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <xsl:for-each select="Bakery/customers/customer">
                                    <fo:table-row text-align="start">
                                        <fo:table-cell>
                                            <fo:block>
                                                <xsl:value-of select="customer_id"/>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell>
                                            <fo:block>
                                                <xsl:value-of select="first_name"/>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell>
                                            <fo:block>
                                                <xsl:value-of select="last_name"/>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell>
                                            <fo:block>
                                                <xsl:value-of select="phone_number"/>
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </xsl:for-each>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>
                    <fo:block id="end-of-document">
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>

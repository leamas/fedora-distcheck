<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output omit-xml-declaration="yes" indent="yes"/>

    <!-- The identity transform: copy everything. -->
    <xsl:template match="@* | node()">
        <xsl:copy>
             <xsl:apply-templates select="@* | node()" />
        </xsl:copy>
    </xsl:template>

    <!-- severity='W' -> 'Warning' -->
    <xsl:template match="analysis/results/issue[@severity='W']/@severity">
        <xsl:attribute name="severity">Warning</xsl:attribute>
    </xsl:template>

    <!-- severity='E' -> 'Error' -->
    <xsl:template match="analysis/results/issue[@severity='E']/@severity">
        <xsl:attribute name="severity">Error</xsl:attribute>
    </xsl:template>

    <!-- Add a [rpmlint] prefix to test-id' -->
    <xsl:template match="analysis/results/issue/@test-id">
        <xsl:attribute name="test-id">
            <xsl:text disable-output-escaping="yes">[rpmlint]: </xsl:text>
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>

    <!--Things matching these templates are excluded. -->
    <xsl:template match="//issue[@test-id='invalid-url']"/>
    <xsl:template match="//issue[@test-id='hardcoded-library-path']"/>
    <xsl:template match="//issue[contains(notes, 'bogus date in %changelog')]"/>


</xsl:stylesheet>

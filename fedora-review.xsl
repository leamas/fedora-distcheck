<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output omit-xml-declaration="yes" indent="yes"/>

    <!-- The identity transform: copy everything. -->
    <xsl:template match="@* | node()">
        <xsl:copy>
             <xsl:apply-templates select="@* | node()" />
        </xsl:copy>
    </xsl:template>

    <!-- Add a [fedora-review] prefix to test-id' -->
    <xsl:template match="analysis/results/issue/@test-id">
        <xsl:attribute name="test-id">
            <xsl:text
                disable-output-escaping="yes">[fedora-review]: </xsl:text>
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>

    <!--Things matching these templates are excluded. -->
    <xsl:template match="//issue[@test-id='CheckBuildInMock']"/>


</xsl:stylesheet>

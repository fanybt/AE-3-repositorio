<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <instituto>
            <nombre>
                <xsl:attribute name="web">
                    <xsl:value-of select="/ite/@web"/>
                </xsl:attribute>
                <xsl:value-of select="/ite/@nombre"/>
            </nombre>
            <empresa>
                <nombre><xsl:value-of select="/ite/empresa"/></nombre>
                <telefono><xsl:value-of select="/ite/telefono"/></telefono>
                <profesorado>
                    <xsl:for-each select="/ite/profesores">
                        <profesor>
                            <xsl:attribute name="identificador">
                                <xsl:value-of select="profesor[1]/id"/>
                            </xsl:attribute>
                            <nombre><xsl:value-of select="profesor[1]/nombre"/></nombre>
                        </profesor>
                        <profesor>
                            <xsl:attribute name="identificador">
                                <xsl:value-of select="profesor[2]/id"/>
                            </xsl:attribute>
                            <nombre><xsl:value-of select="profesor[2]/nombre"/></nombre>
                        </profesor>
                        <profesor>
                            <xsl:attribute name="identificador">
                                <xsl:value-of select="profesor[3]/id"/>
                            </xsl:attribute>
                            <nombre><xsl:value-of select="profesor[3]/nombre"/></nombre>
                        </profesor>
                    </xsl:for-each>
                </profesorado>
                <directora>
                    <nombre><xsl:value-of select="/ite/director/nombre"/></nombre>
                    <lugar><xsl:value-of select="/ite/director/despacho"/></lugar>
                </directora>
                <jefe_estudios>
                    <nombre><xsl:value-of select="/ite/jefe_estudios/nombre"/></nombre>
                    <lugar><xsl:value-of select="/ite/jefe_estudios/despacho"/></lugar>
                </jefe_estudios>
                <estudios>
                    <xsl:for-each select="/ite/ciclos">
                        <ciclo_formativo>
                            <xsl:attribute name="identificador">
                                <xsl:value-of select="ciclo[1]/@id"/>
                            </xsl:attribute>
                            <nombre><xsl:value-of select="ciclo[1]/nombre"/></nombre>
                            <tipo_grado><xsl:value-of select="ciclo[1]/grado"/></tipo_grado>
                            <año><xsl:value-of select="ciclo[1]/decretoTitulo"/></año>
                        </ciclo_formativo>
                        <ciclo_formativo>
                            <xsl:attribute name="identificador">
                                <xsl:value-of select="ciclo[2]/@id"/>
                            </xsl:attribute>
                            <nombre><xsl:value-of select="ciclo[2]/nombre"/></nombre>
                            <tipo_grado><xsl:value-of select="ciclo[2]/grado"/></tipo_grado>
                            <año><xsl:value-of select="ciclo[2]/decretoTitulo"/></año>
                        </ciclo_formativo>
                        <ciclo_formativo>
                            <xsl:attribute name="identificador">
                                <xsl:value-of select="ciclo[3]/@id"/>
                            </xsl:attribute>
                            <nombre><xsl:value-of select="ciclo[3]/nombre"/></nombre>
                            <tipo_grado><xsl:value-of select="ciclo[3]/grado"/></tipo_grado>
                            <año><xsl:value-of select="ciclo[3]/decretoTitulo"/></año>
                        </ciclo_formativo>
                    </xsl:for-each>
                </estudios>
            </empresa>
        </instituto>
    </xsl:template>
</xsl:stylesheet>
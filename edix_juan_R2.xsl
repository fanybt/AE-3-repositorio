<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">

        <instituto_edix>
            <nombre>

                <xsl:value-of select="ite/@nombre"/>

            </nombre>

            <web_instituto>
                <xsl:value-of select="ite/@web"/>
            </web_instituto>


            <empresa>
                <nombre>
                    <xsl:value-of select="/ite/empresa"/>
                </nombre>
                <telefono>
                    <xsl:value-of select="/ite/telefono"/>
                </telefono>
            </empresa>

            <profesores>
                <xsl:for-each select="ite/profesores/profesor">
                    <profesor>
                        <xsl:attribute name="id">
                            <xsl:value-of select="id"/>
                        </xsl:attribute>
                        <nombre>
                            <xsl:value-of select="nombre"/>
                        </nombre>
                    </profesor>

                </xsl:for-each>
            </profesores>

            <directora>

                <xsl:attribute name="Despacho">
                    <xsl:value-of select="ite/director/despacho"/>
                </xsl:attribute>

                <nombre>
                    <xsl:value-of select="/ite/director/nombre"/>
                </nombre>
            </directora>



            <jefe_estudios>

                <xsl:attribute name="Despacho">
                    <xsl:value-of select="ite/jefe_estudios/despacho"/>
                </xsl:attribute>

                <nombre>
                    <xsl:value-of select="/ite/jefe_estudios/nombre"/>
                </nombre>
            </jefe_estudios>

            <estudios_oficiales>
                <xsl:for-each select="ite/ciclos/ciclo">

                    <ciclo_formativo>

                        <Abreviatura_nombre>
                            <xsl:value-of select="@id"/>_
                            <xsl:value-of select="nombre"/>
                        </Abreviatura_nombre>

                        <Grado>
                            <xsl:value-of select="grado"/>
                        </Grado>
                        <Año_Decreto>
                            <xsl:value-of select="decretoTitulo"/>
                        </Año_Decreto>
                    </ciclo_formativo>
                </xsl:for-each>
            </estudios_oficiales>

        </instituto_edix>


    </xsl:template>

</xsl:stylesheet>

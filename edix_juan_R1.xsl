<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">

        <html>

            <head>
                <title>Instituto Tecnológico Edix</title>
                <link rel="stylesheet" href="edix_juan_R1.css" />
            </head>

            <body>

                <h1>
                    <xsl:value-of select="ite/@nombre"></xsl:value-of>
                </h1>



                <h3>Información de interés:</h3>

                <ul>
                    <li>
                    Enlace al instituto: <a href="{ite/@web}"> CLICK AQUÍ </a>
                    </li>

                    <li>
                    Empresa del instituto: <xsl:value-of select="ite/empresa"/>
                    </li>

                    <li>
                    Telefono de contacto: <xsl:value-of select="ite/telefono"/>
                    </li>
                </ul>

                <table>

                    <h4>Profesores:</h4>

                    <thead>

                        <tr>
                            <th>NOMBRE</th>
                            <th>ID</th>
                        </tr>

                    </thead>

                    <tbody>
                        <xsl:for-each select="ite/profesores/profesor">
                            <tr>
                                <td>
                                    <xsl:value-of select="nombre"/>
                                </td>
                                <td>
                                    <xsl:value-of select="id"/>
                                </td>
                            </tr>

                        </xsl:for-each>
                    </tbody>

                </table>

                <h4>Director y jefe de estudios</h4>
                <ul>

                    <li>Nombre del director: <xsl:value-of select="ite/director/nombre"/>
                    <br/>
                    Despacho del director: <xsl:value-of select="ite/director/despacho"/>
                </li>
                <li>Nombre del jefe de Estudios: <xsl:value-of select="ite/jefe_estudios/nombre"/>
                <br/>
                    Despacho del jefe de Estudios: <xsl:value-of select="ite/jefe_estudios/despacho"/>
            </li>
        </ul>

        <table>

            <h4>Ciclos que impartimos:</h4>
            <thead>
                <tr>
                    <th>Ciclo</th>
                    <th>
                        nombre
                    </th>
                    <th>
                        grado
                    </th>
                    <th>
                        decretoTitulo
                    </th>
                </tr>
            </thead>

            <tbody>
            
            <xsl:for-each select="ite/ciclos/ciclo">
            
            <tr>
            <td><xsl:value-of select="@id"/></td>
            <td><xsl:value-of select="nombre"/></td>
            <td><xsl:value-of select="grado"/></td>
            <td><xsl:value-of select="decretoTitulo"/></td>
            </tr>
            
            </xsl:for-each>
            </tbody>
        </table>
           
            





























    </body>

</html>

</xsl:template>

</xsl:stylesheet>
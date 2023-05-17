<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Instituto Tecnológico Edix</title>
                <link rel="stylesheet" href="instituto_vanesa1.css" />
            </head>
            <body>
                <h1><xsl:value-of select="//@nombre"></xsl:value-of></h1>
                <!-- ENLACE -->
                <p><a href="{/ite/@web}" target="_blank"><xsl:value-of select="//@web"/></a></p>
                <h2><xsl:value-of select="/ite/empresa"/></h2>
                <p class="telefono">Teléfono: <xsl:value-of select="/ite/telefono"/></p>
                
                <!-- TABLA CON PROFESORES -->
                <table>
                    <caption><h4>Profesorado</h4></caption>
                    <thead>
                        <tr>
                            <th>NOMBRE</th>
                            <th>ID</th>
                        </tr>                        
                    </thead>
                    <tbody>
                        <xsl:for-each select="/ite/profesores">
                            <tr>
                                <td><xsl:value-of select="profesor[1]/nombre"/></td>
                                <td><xsl:value-of select="profesor[1]/id"/></td>
                            </tr>
                            <tr>
                                <td><xsl:value-of select="profesor[2]/nombre"/></td>
                                <td><xsl:value-of select="profesor[2]/id"/></td>
                            </tr>
                            <tr>
                                <td><xsl:value-of select="profesor[3]/nombre"/></td>
                                <td><xsl:value-of select="profesor[3]/id"/></td>
                            </tr>
                            <tr>
                                <td><xsl:value-of select="profesor[4]/nombre"/></td>
                                <td><xsl:value-of select="profesor[4]/id"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>

                <!-- LISTA DESORDENADA -->
                <h4>Directora</h4>
                <ul>
                    <li>NOMBRE: <xsl:value-of select="/ite/director/nombre"/></li>
                    <li>DESPACHO: <xsl:value-of select="/ite/director/despacho"/></li>
                </ul>
                <h4>Jefe de estudios</h4>
                <ul>
                    <li>NOMBRE: <xsl:value-of select="/ite/jefe_estudios/nombre"/></li>
                    <li>DESPACHO: <xsl:value-of select="/ite/jefe_estudios/despacho"/></li>
                </ul>
                
                <!-- TABLA CON CICLOS -->
                <table>
                    <caption><h4>Ciclos</h4></caption>
                    <xsl:for-each select="ite/ciclos">
                        <thead>
                            <tr>
                                <th></th>
                                <th><xsl:value-of select="ciclo[1]/@id"/></th>
                                <th><xsl:value-of select="ciclo[2]/@id"/></th>
                                <th><xsl:value-of select="ciclo[last()]/@id"/></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>NOMBRE</td><!-- LOS 3 SON ENLACES -->
                                <td><a href="https://unirfp.unir.net/ingenieria/fp-grado-asir/" target="_blank"><xsl:value-of select="ciclo[1]/nombre"/></a></td>
                                <td><a href="https://unirfp.unir.net/ingenieria/fp-grado-daw-desarrollo-de-aplicaciones-web/" target="_blank"><xsl:value-of select="ciclo[2]/nombre"/></a></td>
                                <td><a href="https://unirfp.unir.net/ingenieria/fp-grado-desarrollo-aplicaciones-multiplataforma-dam/" target="_blank"><xsl:value-of select="ciclo[last()]/nombre"/></a></td>
                            </tr>
                            <tr>
                                <td>GRADO</td>
                                <td><xsl:value-of select="ciclo[1]/grado"/></td>
                                <td><xsl:value-of select="ciclo[2]/grado"/></td>
                                <td><xsl:value-of select="ciclo[last()]/grado"/></td>
                            </tr>
                            <tr>
                                <td>DECRETO TÍTULO</td>
                                <td><xsl:value-of select="ciclo[1]/decretoTitulo/@año"/></td>
                                <td><xsl:value-of select="ciclo[2]/decretoTitulo/@año"/></td>
                                <td><xsl:value-of select="ciclo[last()]/decretoTitulo/@año"/></td>
                            </tr>
                        </tbody>
                    </xsl:for-each>
                </table>

                <!-- FORMULARIO -->
                <h4>FORMULARIO</h4>
                <form action="procesarPeticion.jsp" method="get">
                    <fieldset>
                        <div id="datos">
                            <legend>Datos personales:</legend>
                            <label for="nombre">Nombre: </label>
                            <input id="nombre" type="text" name="nombre" placeholder="Escribe tu nombre" /><br/>
                            <label for="apellidos">Apellidos: </label>
                            <input id="apellidos" type="text" name="apellidos" placeholder="Escribe tus apellidos"/><br/>
                            <label for="edad">Edad: </label>
                            <input id="edad" type="number" name="edad" placeholder="Escribe tu edad" /><br/>
                            <label for="email">Email: </label>
                            <input id="email" type="email" name="email" placeholder="Escribe tu email" required="required"/><br/>
                            <label for="telefono">Teléfono: </label>
                            <input id="telefono" type="tel" name="telefono" placeholder="Escribe tu teléfono"></input>
                        </div>

                        <hr/>
                        
                        <label for="estudios_finalizados">Estudios finalizados: </label><br/>
                        <input type="radio" name="estudios_finalizados" value="B" />Bachillerato<br />
                        <input type="radio" name="estudios_finalizados" value="L" />Licenciatura<br />
                        <input type="radio" name="estudios_finalizados" value="D" />Diplomatura<br />
                        <input type="radio" name="estudios_finalizados" value="C" />Ciclo<br />

                        <label for="grado">¿Qué grado te interesa?</label><br/>
                        <input type="checkbox" name="grado" value="asir" />Administración de Sistemas Informáticos en Red<br/>
                        <input type="checkbox" name="grado" value="daw" />Desarrollo de Aplicaciones Web<br/>
                        <input type="checkbox" name="grado" value="dam" />Desarrollo de Aplicaciones Multiplataforma<br/>
                        
                        <label for="observaciones">Observaciones:</label><br/>
                        <textarea name="observaciones"></textarea><br/>

                        <input type="submit" value="Enviar datos"></input>
                        <input type="reset" value="Limpiar formulario"></input>
                    </fieldset>
                </form>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
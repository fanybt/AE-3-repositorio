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
                        <td>
                            <xsl:value-of select="@id"/>
                        </td>
                        <td>
                            <xsl:value-of select="nombre"/>
                        </td>
                        <td>
                            <xsl:value-of select="grado"/>
                        </td>
                        <td>
                            <xsl:value-of select="decretoTitulo"/>
                        </td>
                    </tr>

                </xsl:for-each>
            </tbody>
        </table>


        <h4 id="formulario">FORMULARIO</h4>
        <form action="procesarPeticion.jsp" method="get">
            <fieldset>

                <legend>Datos de inscripción:</legend>
                <label for="nombre">Nombre: </label>
                <input id="nombre" type="text" name="nombre" placeholder="Escriba su nombre" />
                <br/>

                <label for="apellidos">Apellidos: </label>
                <input id="apellidos" type="text" name="apellidos" placeholder="Escriba sus apellidos"/>
                <br/>

                <label for="edad">Edad: </label>
                <input id="edad" type="number" min="0" max="120" step="1" name="edad" />
                <br/>

                <label for="email">Email: </label>
                <input id="email" type="email" name="email" placeholder="Email de contacto:" />
                <br/>

                <label for="telefono">Teléfono: </label>
                <input id="telefono" type="tel" name="telefono" placeholder="Escriba su teléfono"></input>



                <br/>
                <br/>

                <label for="grado">Grado al que te gustaria apuntarte:</label>
                <br/>
                <input type="checkbox" name="grado" value="asir" />
                <xsl:value-of select="ite/ciclos/ciclo[1]/nombre"/>
                <br/>
                <input type="checkbox" name="grado" value="daw" />
                <xsl:value-of select="ite/ciclos/ciclo[2]/nombre"/>
                <br/>
                <input type="checkbox" name="grado" value="dam" />
                <xsl:value-of select="ite/ciclos/ciclo[3]/nombre"/>
                <br/>

                <hr/>

                <label for="observaciones">Información Adicional:</label>
                <br/>
                <textarea style="resize: none;" rows="8" cols="120" name="observaciones" placeholder="Escriba aquí cualquier información relevante"></textarea>
                <br/>

                <input type="submit" value="Enviar datos"></input>
                <input type="reset" value="Limpiar formulario"></input>

            </fieldset>
        </form>

    </body>

</html>

</xsl:template>

</xsl:stylesheet>
                       

                        

            

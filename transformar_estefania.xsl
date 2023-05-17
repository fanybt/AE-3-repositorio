<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
        <head>
          <meta charset="UTF-8"/>
          <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
          <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
          <title>Proeduca</title>
          <link rel="stylesheet" href="style_estefania.css"/>
      </head>
      <body>
        <h1>Empresa <xsl:value-of select="/ite/empresa"/></h1>
        <div id="tablas">
          <div id="tabla_empresa">
            <h2>Datos de la empresa</h2>
            <table border="1">
              <tr>
                <th>Empresa</th>
                <th>Teléfono</th>
                <th>Director</th>
                <th>Jefe de estudios</th>
              </tr>
              <tr>
                <td><xsl:value-of select="/ite/empresa"/></td>
                <td><xsl:value-of select="/ite/telefono"/></td>
                <td><xsl:value-of select="/ite/director/nombre"/></td>
                <td><xsl:value-of select="/ite/jefe_estudios/nombre"/></td>
              </tr>
            </table>
          </div>
          
          <div id="tabla_profesores">
            <h2>Datos de los profesores</h2>
            <table border="1">
              <tr>
                <th>ID</th>
                <th>Nombre</th>
              </tr>
              <xsl:for-each select="/ite/profesores/profesor">
                <tr>
                  <td><xsl:value-of select="id"/></td>
                  <td><xsl:value-of select="nombre"/></td>
                </tr>
              </xsl:for-each>
            </table>
          </div>
          
          <div id="tabla_ciclos">
            <h2>Datos de los ciclos</h2>
            <table border="1">
              <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Grado</th>
                <th>Año del decreto del título</th>
              </tr>
              <xsl:for-each select="/ite/ciclos/ciclo">
                <tr>
                  <td><xsl:value-of select="@id"/></td>
                  <td><xsl:value-of select="nombre"/></td>
                  <td><xsl:value-of select="grado"/></td>
                  <td><xsl:value-of select="decretoTitulo/@año"/></td>
                </tr>
              </xsl:for-each>
            </table>
          </div>
        </div>
        <hr/>
        <div id="enlaces">
          <h2>Enlaces</h2>
          <a href="https://institutotecnologico.edix.com" target="_blank">Edix</a>
          <a href="https://google.es" target="_blank">Google</a>
          <a href="https://github.com" target="_blank">Github</a>
        </div>
        
        <hr/>
        
        <h2>Listas</h2>
        
        <div id="listas">
          <div id="datos_empresa">
          <h3>Datos de la empresa</h3>
          
          <ul>
            <li>Nombre: <xsl:value-of select="/ite/empresa"/></li>
            <li>Centro: <xsl:value-of select="/ite/@nombre"/></li>
            <li>Teléfono: <xsl:value-of select="/ite/telefono"/></li>
            <li>Director:</li>
              <ul>
                <li>Nombre: <xsl:value-of select="/ite/director/nombre"/></li>
                <li>Despacho: <xsl:value-of select="/ite/director/despacho"/></li>
              </ul>
            <li>Jefe de estudios:</li>
              <ul>
                <li>Nombre: <xsl:value-of select="/ite/jefe_estudios/nombre"/></li>
                <li>Despacho: <xsl:value-of select="/ite/jefe_estudios/despacho"/></li>
              </ul>
            </ul>
          </div>
          
          <div id="datos_profesores">
            <h3>Profesores</h3>
          
            <ol>
              <xsl:for-each select="/ite/profesores/profesor">
                <li><xsl:value-of select="nombre"/></li>
              </xsl:for-each>
            </ol>
          </div>
        </div>
        
        <hr/>
        
        <div id="formulario">
        
        <h2>Formulario</h2>
        <p>Contacta con Proeduca a través de este formulario para solicitar información de los grados superiores:</p>

        <form action="">
          <label for="nombre">Nombre: </label>
          <input type="text" name="nombre" placeholder="Pedro González" />
          <br/>
          <label for="email">Email: </label>
          <input type="email" name="email" id="email" placeholder="ejemplo@gmail.com" />
          <br/>
          <label for="grados">Grado de interés: </label>
          <select name="grados" id="grados">
              <xsl:for-each select="/ite/ciclos/ciclo">
                <option><xsl:value-of select="@id"/></option>
              </xsl:for-each>
          </select>
          <br/>
          <label for="mensale">Escribe tu mensaje: </label>
          <br/>
          <textarea name="mensaje" id="mensaje" cols="30" rows="10">Hola, estoy interesado en concretar una cita.</textarea>
          <br/>
          <button type="submit">Enviar</button>
        </form>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
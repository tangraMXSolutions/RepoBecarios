<%-- 
    Document   : tpagina
    Created on : 29/12/2015, 10:29:30 AM
    Author     : omarsorianoz
--%>
<%@page import="constantes.Pages" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="src/js/JSmenu.js" type="text/javascript"></script>
<script>
    validaNavegador();
</script>
<%@page session="true" %>
<%
    request.setCharacterEncoding("UTF8");
    String mensaje = (String) ((request.getAttribute("mensaje") != null) ? request.getAttribute("mensaje") : "");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!–[if lt IE 7]>
        <link rel=”stylesheet” href=”css/explo.css” type=”text/css” />
        <![endif]–>
        <link href="src/css/stilo.css" rel="stylesheet" type="text/css"/>
        <title>WMS</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div id="padrao" >
            <form id="frmLogin" method="post" action="ServiceTracker" >
                <table>
                    <tr><td><label class="texto">Usuario:</label></td><td><input type="text" name="txtUsuario" width="80%;"></td></tr>
                    <tr><td><label class="texto">Contraseña:</label></td><td><input type="text" name="txtPassword" width="80%;"></td></tr>
                    <tr><td colspan="2"><input id="submit" type="submit" value="Login"></td></tr>
                    <tr><td colspan="2"><label id="lblMensaje" class="error"><%=mensaje%></label></td></tr>
                </table>
                <input type="hidden" name="accion" id="accion" value="LOGIN" />
                <input type="hidden" name="version" id="version" value="3" />

            </form>
        </div>
        <table style="width:100%;background-color: black;">
            <tr>
                <td>
            <center>
                <label class="tituloFooter">
                    TangraMX Services TI
                </label>
            </center>
        </td>
        <td>
        <center>
            <label class="tituloFooter">
                SmartWMS
            </label>
        </center>
    </td>

</tr>        
</table>    

</body>
</html>

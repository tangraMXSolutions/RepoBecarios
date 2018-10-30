<%-- 
    Document   : tpagina
    Created on : 29/12/2015, 10:29:30 AM
    Author     : omarsorianoz
--%>

<%@page import="constantes.Pages"%>
<%@page import="pojos.core.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="src/js/JSmenu.js" type="text/javascript"></script>
<%@page session="true" %>
<%
    String mensaje = (String) ((request.getAttribute("mensaje") != null) ? request.getAttribute("mensaje") : "");
    Usuario user = new Usuario();
    if (request.getSession().getAttribute("usuario") == null) {
        RequestDispatcher send = request.getRequestDispatcher("index.jsp");
        send.forward(request, response);
    } else {
        user = ((Usuario) request.getSession().getAttribute("usuario"));
    }
    String usuario
            = ((user.getUsuario() != null) ? user.getUsuario() : "") + "/"
            + ((user.getNombre() != null) ? user.getNombre() : "") + " "
            + ((user.getApellidoPaterno() != null) ? user.getApellidoPaterno() : "") + " "
            + ((user.getApellidoPaterno() != null) ? user.getApellidoPaterno() : "");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="src/css/stilo.css" rel="stylesheet" type="text/css"/>

        <title>WMS</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <form id="frmMenuActivos" method="post" name="frmMenuMaquila" action="ServiceTracker">
            <div id="container">

                <center>
                    <table style="margin: 1px;padding: 1px;width: 100%;" border="0" align="left">
                        <tr>
                            <td>
                               <center> <a href="#"><img src="src/images/ic_surtido.jpg" onclick="surtidoEtapa1Maquila('frmMenuMaquila');"/>
                                    <br>
                                    <label class="textoPequenoMenus">Surtir</label></a></center>
                            </td>
                            <td>
                                <center><a href="#"><img src="src/images/ic_cerrar_maquila.jpg" onclick="asociarMaquila('frmMenuMaquila')"/>
                                    <br>
                                    <label class="textoPequenoMenus">Cerrar</label></a></center>
                            </td>
                            <!--<td colspan="3">
                                <a href="#"><img src="src/images/ic_iniciarmaquila.jpg" onclick="iniciarMaquila('frmMenuMaquila')"/>
                                    <br/>
                                    <label class="textoPequenoMenus">Iniciar Maquila</label></a></td>
                            <td>
                                <a href="#"><img src="src/images/ic_cierremaquila.jpg" onclick="cerrarMaquila('frmMenuMaquila')"/>
                                    <br/>
                                    <label class="textoPequenoMenus">Cerrar Maquila</label></a></td>-->

                        </tr>
                        <tr>
                            <td> <center><a href="menu_principal.jsp" ><img src="src/images/ic_menu.jpg"/><br><label class="textoPequenoMenus">Menu</label></a></center></td> 
                            <td> <center></center></td> 
                        </tr>

                    </table>
                </center>
            </div>
        </form>
        <jsp:include page="footer.jsp" />

    </body>
</html>

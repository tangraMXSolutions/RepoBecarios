<%-- 
    Document   : menu_traspasos
    Created on : 25/01/2016, 01:28:07 PM
    Author     : PC
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
            <form id="frmMenuTraspaso" method="post" name="frmMenuTraspaso" action="ServiceTracker">
                    <table algin="left" style="margin: 1px;padding: 1px; width: 100%;">
                        <!--<tr>
                            <td><a href="#"><img src="src/images/ic_traspaso_almacen.jpg" onclick="traspasoUbicacion('frmMenuTraspaso')"/><br><label class="textoPequenoMenus">Ubicacion</label></a></td>
                        <td><a href="#"><img src="src/images/ic_traspaso_pieza.jpg" onclick="traspasoPiezas('frmMenuTraspaso')"/><br><label class="textoPequenoMenus">Piezas</label></a></td>
                        <td><a href="#"><img src="src/images/ic_traspaso_activo.jpg" onclick="traspasoMarbete('frmMenuTraspaso');"/><br><label class="textoPequenoMenus">Marbete</label></a></td>
                        </tr>
                        -->
                        <tr>
                            <td>
                                <center><a href="#"><img src="src/images/ic_traspaso_pieza.jpg" onclick="traspasoPiezas('frmMenuTraspaso')"/>
                                    <br/>
                                    <label class="textoPequenoMenus">Piezas</label></a></center>
                            </td>
                            <td>
                                <center><a href="#"><img src="src/images/ic_traspaso_tarima.jpg" onclick="traspasoTarima('frmMenuTraspaso');"/>
                                    <br>
                                    <label class="textoPequenoMenus">Tarima</label>
                                </a></center>
                            </td>
                        </tr>
                        <tr>
                            
                            <td algin="left">
                                <center><a href="menu_principal.jsp"><img src="src/images/ic_menu.jpg" /><br><label class="textoPequenoMenus">Menu</label></a></center>
                            </td> 
                            <td>
                                <center><a href="#"><img src="src/images/ic_salir.jpg" onclick="abandonarSistema('frmMenuTraspaso');"/><br><label class="textoPequenoMenus">Salir</label></a></center>
                            </td>
                        </tr>
                        
                    </table>
            </form>
    </body>
</html>

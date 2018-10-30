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
            <form id="frmMenuPrincipal" method="post" name="frmMenuPrincipal" action="ServiceTracker">
                    <table style="width: 100%;">
                        <tr>
                        <td><center><a href="menu_activos.jsp"><img src="src/images/ic_inventario.jpg"/><br><label class="textoPequenoMenus">Inventario</label></a></center></td>
                        <td><center><a href="menu_recibos.jsp"><img src="src/images/ic_recibo.jpg"/><br><label class="textoPequenoMenus">Recibos</label></a></center></td>
                        <td><center><a href="#"><img src="src/images/ic_acomodo.jpg" onclick="etapaAcomodo('frmMenuPrincipal');"/><br><label class="textoPequenoMenus">Acomodo</label></a></center></td>
                        </tr>
                        <tr>
                        <td><center><a href="#"><img src="src/images/ic_surtido.jpg" onclick="surtidoEtapa1('frmMenuPrincipal');"/><br><label class="textoPequenoMenus">Surtido</label></a></center></td>
                        <td><center><a href="menu_traspasos.jsp"><img src="src/images/ic_traspaso.jpg"/><br><label class="textoPequenoMenus">Traspasos</label></a></center></td>
                        <td><center><a href="menu_maquila.jsp"><img src="src/images/ic_maquila.jpg" /><br><label class="textoPequenoMenus">Maquila</label></a></center></td>
                        </tr>
                            <tr>
                        <td><center><a href="complemento_codigos.jsp"><img src="src/images/ic_detalle_compra.jpg?txtPrimera=1"/><br><label class="textoPequenoMenus">Códigos</label></a></center></td>        
                        <td><center><a href="#"><img src="src/images/ic_salir.jpg" onclick="abandonarSistema('frmMenuPrincipal');"/><br><label class="textoPequenoMenus">Salir</label></a></center></td>
        
                        </tr>
                    </table>
            </form>
    </body>
    <jsp:include page="footer.jsp" />
</html>

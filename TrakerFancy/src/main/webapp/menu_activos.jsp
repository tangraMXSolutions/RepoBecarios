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
        <form id="frmMenuActivos" method="post" name="frmMenuActivos" action="ServiceTracker">
            <div id="container">

                <center>
                    
                    
                    
                    
                    <table style="margin: 1px;padding: 1px;width: 100%;">
                        <tr>
                            <td><center>
                                    <a href="#"><img src="src/images/ic_inventario.jpg"  onclick=" inventarioActivos('frmMenuActivos');" />
                                        <br>
                                        <label class="textoPequenoMenus">Inventario</label>
                                    </a></center>
                            </td>
                            <td><center>
                                    <a href="#"><img src="src/images/ic_inv_localidad.jpg" onclick="inventarioExistencia('frmMenuActivos')"/>
                                    <br/>
                                    <label class="textoPequenoMenus">Inv.Localidad</label>
                                    </a></center>
                            </td>
                            <td><center>
                                    <a href="#">
                                        <img src="src/images/ic_inv_sku.jpg" onclick="inventarioExistenciaSKU('frmMenuActivos')"/>
                                    <br/>
                                    <label class="textoPequenoMenus">Inv.SKU</label></a></center>
                            </td>
                                    
                        </tr>
                        <tr>
                            
                            <td>
                                <center><img src="src/images/ic_salir.jpg"  onclick="abandonarSistema('frmMenuActivos');"/><br><label class="textoPequenoMenus">Salir</label></center>
                            </td>                                            
                            <td>
                                <center>
                                <a href="menu_principal.jsp" ><img src="src/images/ic_menu.jpg"/><br><label class="textoPequenoMenus">Menu</label></a>
                                </center>
                            </td>
                            <td>
                                <center>
                                
                                </center>
                            </td>
                        </tr>

                    </table>
                </center>
            </div>
        </form>
         <jsp:include page="footer.jsp" />   
            
    </body>
</html>

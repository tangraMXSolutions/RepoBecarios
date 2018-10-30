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


<jsp:include page="header__.jsp" />
<form  id="frmMenuRecibidos" method="post" name="frmMenuRecibos" action="ServiceTracker">

    <div class="container">
        <img src=""/>
        <div class="table-responsive">          
            <table class="table table-condensed">
                <tbody>
                    <tr>
                        <td><a href="#"><img src="src/images/responsive/ic_recibo_x.png" alt="Recibo"  onclick="reciboOrdenCompra('frmMenuRecibos');"  /><br><label class="textoPequenoMenus">Orden de Compra</label></a></td>
                        <td><a href="#"><img src="src/images/responsive/ic_surtido_x.png" alt="Surtido" onclick="reciboCompraConsulta('frmMenuRecibos');"   /><br><label class="textoPequenoMenus">Detalle Origen de Compra</label></a></td>
                    </tr>
                                        <tr>
                                            <td><a href="menu_principal__.jsp"><img src="src/images/responsive/ic_menu_x.png" alt="Recibo"/><br><label class="textoPequenoMenus">Menú</label></a></td>
                        <td><a href="#"><img src="src/images/responsive/ic_salir_x.png" onclick="abandonarSistema('frmMenuRecibos');" alt="Surtido"/><br><label class="textoPequenoMenus">Salir</label></a></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>


</form>
<jsp:include page="footer__.jsp" />
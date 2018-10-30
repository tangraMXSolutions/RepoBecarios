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
<form id="frmMenuPrincipal" method="post" name="frmMenuPrincipal" action="ServiceTracker">

    <div class="container">
        <img src=""/>
        <div class="table-responsive">          
            <table class="table table-condensed">
                <tbody>
                    <tr>
                        <td><a href="menu_recibos__.jsp"><img src="src/images/responsive/ic_recibo_x.png" alt="Recibo"/><br><label class="textoPequenoMenus">Recibo</label></a></td>
                        <td></td>
                        <td><a href="#"><img onclick="surtidoEtapa1('frmMenuPrincipal');" src="src/images/responsive/ic_surtido_x.png" alt="Surtido"/><br><label class="textoPequenoMenus">Surtido</label></a></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><a href="#"><img onclick="etapaAcomodo('frmMenuPrincipal');" src="src/images/responsive/ic_acomodo_x.png" alt="Acomodo"/><br><label class="textoPequenoMenus">Acomodo</label></a></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><a href="menu_traspasos__.jsp"><img src="src/images/responsive/ic_traspaso_x.png" alt="Traspaso"/><br><label class="textoPequenoMenus">Traspaso</label></a></td>
                        <td></td>
                        <td><a href="menu_maquila.jsp"><img src="src/images/responsive/ic_maquila_x.png" alt="Maquila"/><br><label class="textoPequenoMenus">Maquila</label></a></td>
                    </tr>
                    <tr>
                        <td><a href="menu_activos.jsp"><img src="src/images/responsive/ic_inventario_x.png" alt="Inventario"/><br><label class="textoPequenoMenus">Inventario</label></a></td>
                        <td></td>
                        <td><a href="complemento_codigos.jsp"><img src="src/images/responsive/ic_codigos_x.png" alt="Codigo"/><br><label class="textoPequenoMenus">Códigos</label></a></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><a href="#"><img onclick="abandonarSistema('frmMenuPrincipal');" src="src/images/responsive/ic_salir_x.png" alt="Salir"/><br><label class="textoPequenoMenus">Salir</label></a></td>
                        <td></td>
                    </tr>
                    
                </tbody>
            </table>
        </div>
    </div>


</form>
<jsp:include page="footer__.jsp" />


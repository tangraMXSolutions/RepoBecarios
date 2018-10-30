<%-- 
    Document   : tpagina
    Created on : 29/12/2015, 10:29:30 AM
    Author     : omarsorianoz
--%>
<%@page import="pojos.core.InventarioPosicion"%>
<%@page import="pojos.core.ListadoPosicion"%>
<%@page import="form.FormInventarioPosicion"%>
<%@page import="form.FormInventario"%>
<%@page import="pojos.core.ListadoCalidad"%>
<%@page import="constantes.Pages"%>
<%@page import="pojos.core.ListadoArea"%>
<%@page import="pojos.core.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="src/js/JSmenu.js" type="text/javascript"></script>
<%@page session="true"%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);

    String mensaje = (String) ((request.getAttribute("mensaje") != null) ? request.getAttribute("mensaje") : "");
    Usuario user = new Usuario();
    FormInventarioPosicion formInventario = new FormInventarioPosicion("");
    if (request.getSession().getAttribute("usuario") == null) {
        RequestDispatcher send = request.getRequestDispatcher("index.jsp");
        send.forward(request, response);
    } else {
        user = ((Usuario) request.getSession().getAttribute("usuario"));
    }
    if (request.getSession().getAttribute("formInventario") != null) {

        formInventario = ((FormInventarioPosicion) request.getSession().getAttribute("formInventario"));
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
        <meta HTTP-EQUIV=Expires CONTENT="0">
        <meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="src/css/stilo.css" rel="stylesheet" type="text/css"/>
        <script src="src/js/JSmenu.js" type="text/javascript"></script>
        <title>WMS</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <form id="frmInventarioActivos" method="post" name="frmInventarioActivos" action="ServiceTracker">
            <table style="margin: 1px;padding: 1px;width: 10%;">
                <tr><td algin="left" colspan="2"><a style="z-index: 10;" href="menu_principal.jsp"><img src="src/images/ic_menu.jpg" /></a></td> </tr>
                <tr><td colspan="2"><label id="lblMensaje" class="error"><%=mensaje%></label></td></tr>
                <tr><td colspan="2"><label>Posicion:</label> <input  type="text" id="elpn" name="elpn" onchange="document.forms[0].submit()"></td></tr>


                <input type="hidden" name="accion" id="accion" value="INVENTARIO_EXISTENCIA" />



            </table>


            <%
                if (request.getSession().getAttribute("listaInventario") != null) {
                    ListadoPosicion ListadoPosicion = (ListadoPosicion) request.getSession().getAttribute("listaInventario");
                    if (ListadoPosicion.getListCalidad().size() > 0) {
            %>
            <label class="bien"><%=(String) ((formInventario.getPosicion() != "") ? "Productos encontrados en la Localidad: " + formInventario.getPosicion() : "")%></label>
            <table style="margin: 2px;padding: 4px;width: 50%;">
                <thead><tr><td>SKU</td>
                        <td>Producto</td>
                        <td>Cantidad</td>
                        <td>Localidad</td>
                    </tr></thead>



                <%
                    for (InventarioPosicion listado : ListadoPosicion.getListCalidad()) {%>
                <tr>
                    <td><%=listado.getProducto().getSku()%></td>
                    <td><%=listado.getProducto().getDescripcionCorta()%></td>
                    <td><%=listado.getCantidad()%></td>
                    <td><%=listado.getLocalidad()%></td>
                </tr>
                <% }%></table>
                <%
                } else {%>
            <label class="error"><%=(String) ((formInventario.getPosicion() != "") ? " No Hay Productos encontrados en la Localidad: " + formInventario.getPosicion() : "")%></label>
            <%}
                    request.getSession().setAttribute("listaInventario", null);
                }

            %>

        </form>


        <script>

            document.getElementById('elpn').focus();

        </script>
        <jsp:include page="footer.jsp" />
    </body>
</html>

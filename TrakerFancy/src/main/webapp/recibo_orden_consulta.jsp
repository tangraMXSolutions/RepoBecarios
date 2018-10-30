<%-- 
    Document   : tpagina
    Created on : 29/12/2015, 10:29:30 AM
    Author     : omarsorianoz
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojos.core.RecepcionDeProducto"%>
<%@page import="form.FormOrdenCompra"%>
<%@page import="pojos.core.ListadoDocumento"%>
<%@page import="form.FormInventario"%>
<%@page import="pojos.core.ListadoCalidad"%>
<%@page import="constantes.Pages"%>
<%@page import="pojos.core.ListadoArea"%>
<%@page import="pojos.core.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="src/js/JSmenu.js" type="text/javascript"></script>
<%@page session="true"%>
<%
    String mensaje = (String) ((request.getAttribute("mensaje") != null) ? request.getAttribute("mensaje") : "");
    Usuario user = new Usuario();
    ArrayList<RecepcionDeProducto> listaRecepcionProducto = (request.getAttribute("listaRecepcionProducto") != null
            ? (ArrayList<RecepcionDeProducto>) request.getAttribute("listaRecepcionProducto") : new ArrayList<RecepcionDeProducto>());
    FormOrdenCompra formOrdenCompra = new FormOrdenCompra("", "", "", "", "-1", "", "", 0, 1, "");
    if (request.getSession().getAttribute("usuario") == null) {
        RequestDispatcher send = request.getRequestDispatcher("index.jsp");
        send.forward(request, response);
    } else {
        user = ((Usuario) request.getSession().getAttribute("usuario"));
    }
    if (request.getSession().getAttribute("formOrdenCompra") == null) {
        RequestDispatcher send = request.getRequestDispatcher("index.jsp");
        send.forward(request, response);
    } else {
        formOrdenCompra = ((FormOrdenCompra) request.getSession().getAttribute("formOrdenCompra"));
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
        <script src="src/js/JSmenu.js" type="text/javascript"></script>
        <title>WMS</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <form id="frmReciboOrdenCompra" method="post" name="frmReciboOrdenCompra" action="ServiceTracker">
            <table style="margin: 1px;padding: 1px;width: 10%;">
                <tr><td colspan="2"><label id="lblMensaje" class="error"><%=mensaje%></label></td></tr>
                <tr>
                    <td algin="left"><label class="textoPequenoMenu">Documento:</label></td>
                    <td>
                        <select id='ListaDocumento' name='ListaDocumento' style="z-index: 0;" onchange="selectValorCombo(this, 'cbDocumento');reciboCompraConsultaDetalle('frmReciboOrdenCompra');return false" >
                            <option value="-1">Seleccione Documento</option>
                            <%
                                if (request.getSession().getAttribute("listaDocumento") != null) {
                                    ListadoDocumento listadoDocumento = (ListadoDocumento) request.getSession().getAttribute("listaDocumento");

                                    for (int i = 0; i < listadoDocumento.getListDocumento().size(); i++) {
                                        String descripcion = listadoDocumento.getListDocumento().get(i).getDescripcion();
                                        String identificador = String.valueOf(listadoDocumento.getListDocumento().get(i).getIdentificador());
                                        if (formOrdenCompra.getDocumento() != null && !formOrdenCompra.getDocumento().equals("-1") && formOrdenCompra.getDocumento().equals(identificador.toString())) {
                            %>
                            <option selected value="<%=identificador%>"><%=descripcion%></option>
                            <%
                            } else {
                            %>
                            <option value="<%=identificador%>"><%=descripcion%></option>
                            <%
                                        }
                                    }
                                }
                            %>
                        </select>
                    <td>
                </tr>
            </table>
            <% if (listaRecepcionProducto.size() > 0) { %>
            <table style="margin: 2px;padding: 4px;width: 90%;">
                <tr>
                    <td>
                        LPN
                    </td> <td>
                        SKU
                    </td>
                    <td>
                        CANTIDAD
                    </td>

                </tr>
                <%for (int contador = 0; listaRecepcionProducto.size() > contador; contador++) {%>
                <tr>
                    <td>
                        <%= listaRecepcionProducto.get(contador).getLPN() %>
                    </td>
                    <td>
                        <%= listaRecepcionProducto.get(contador).getSku() %>
                    </td>
                    <td>
                        <%= listaRecepcionProducto.get(contador).getCantidad() %>
                    </td>
                </tr>
                <% }%>
            </table>
            <% }%>
            <input type="hidden" id="cbDocumento" name="cbDocumento" value="<%=formOrdenCompra.getDocumento()%>" />
        </form>
        <table>
            <tr>
                <td algin="left"><a style="z-index: 9;" href="menu_principal.jsp"><img src="src/images/ic_menu.jpg" /></a></td> 
        </table>

<jsp:include page="footer.jsp" />
    </body>
</html>

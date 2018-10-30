<%-- 
    Document   : tpagina
    Created on : 29/12/2015, 10:29:30 AM
    Author     : omarsorianoz
--%>

<%@page import="constantes.Pages"%>
<%@page import="pojos.core.ListadoPedido"%>
<%@page import="pojos.core.ListadoDocumento"%>
<%@page import="pojos.core.ListadoCalidad"%>
<%@page import="pojos.core.ListadoArea"%>
<%@page import="pojos.core.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <script src="src/js/JSmenu.js" type="text/javascript"></script>
        <title>WMS</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <form id="frmSurtidoEtapa1" method="post" name="frmSurtidoEtapa1" action="ServiceTracker">
            <table style="margin: 1px;padding: 1px;width: 10%;">
                <tr>
                    <td align="left"><label class="textoPequenoMenu">Pedido:</label>
                        <select style="z-index: 0;" onchange="selectValorComboSurtidoEtapa1(this, 'cbPedido', 'frmSurtidoEtapa1');" >
                            <option value="-1">Seleccione Pedido</option>
                            <%
                                if (request.getAttribute("listaPedido") != null) {
                                    ListadoPedido listaPedido = (ListadoPedido) request.getAttribute("listaPedido");
                                    if (listaPedido != null && listaPedido.getListPedidos()!=null) {
                                        for (int i = 0; i < listaPedido.getListPedidos().size(); i++) {
                                            String descripcion = listaPedido.getListPedidos().get(i).getDescripcion();
                                            String identificador = String.valueOf(listaPedido.getListPedidos().get(i).getIdentificador());

                            %>
                            <option value="<%=identificador%>"><%=identificador + " - " + descripcion%></option>
                            <%
                                        }
                                    } else {
                                        mensaje = "No existen Pedidos Pendientes";
                                    }
                                }
                            %>
                        </select> </td>
                </tr>
                <tr><td colspan="2"><label id="lblMensaje" class="error"><%=mensaje%></label></td></tr>
                <tr>
                    <td colspan="2" align="left"><a href="menu_principal.jsp" ><img src="src/images/ic_menu.jpg"/><br><label class="textoPequenoMenu">Menu</label></a></td>
                </tr>

            </table>
            <input type="hidden" name="accion" id="accion" value="SURTIDO_ETAPA1" />
            <input type="hidden" id="cbPedido" name="cbPedido"  value="-1" />
            <input type="hidden" id="txtPedido" name="txtPedido" value="" />
        </form>
                <jsp:include page="footer.jsp" />
    </body>
</html>

<%-- 
    Document   : tpagina
    Created on : 29/12/2015, 10:29:30 AM
    Author     : omarsorianoz
--%>
<%@page import="form.FormInventario"%>
<%@page import="pojos.core.ListadoCalidad"%>
<%@page import="constantes.Pages"%>
<%@page import="pojos.core.ListadoArea"%>
<%@page import="pojos.core.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);

    String mensaje = (String) ((request.getAttribute("mensaje") != null) ? request.getAttribute("mensaje") : "");
    Usuario user = new Usuario();
    FormInventario formInventario = new FormInventario("", "", "", "", "", "-1", "", "", 0, 1, 0, "");
    if (request.getSession().getAttribute("usuario") == null) {
        RequestDispatcher send = request.getRequestDispatcher("index.jsp");
        send.forward(request, response);
    } else {
        user = ((Usuario) request.getSession().getAttribute("usuario"));
    }
    if (request.getSession().getAttribute("formInventario") == null) {
        RequestDispatcher send = request.getRequestDispatcher("index.jsp");
        send.forward(request, response);
    } else {
        formInventario = ((FormInventario) request.getSession().getAttribute("formInventario"));
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
        <script src="src/js/JSespecializacion.js" type="text/javascript"></script>
        <title>WMS</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <form id="frmInventarioActivos" method="post" name="frmInventarioActivos" action="ServiceTracker">
            <table style="margin: 1px;padding: 1px;width: 10%;">
                <tr><td colspan="2"><label id="lblMensaje" class="error"><%=mensaje%></label></td></tr>
                <tr>
                    <td algin="left"><label class="textoPequenoMenu">
                            <%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".Inventario.Etiqueta1") == null) ? "Referencia" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".Inventario.Etiqueta1")%>
                            :</label></td>
                            <td align="left"><input value="<%=formInventario.getReferencia()%>" style="z-index: 0;" id="txtReferencia" name="txtReferencia"/></td>                        
                </tr> 
                <tr>
                    <td algin="left"><label class="textoPequenoMenu">
                            <%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".Inventario.Etiqueta2") == null) ? "Localidad" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".Inventario.Etiqueta2")%>
                            :
                        </label></td><td align="left"><input value="<%=formInventario.getLocalidad()%>" style="z-index: 1;" id="txtLocalidad" name="txtLocalidad"/></td>                        
                </tr>
                <tr>
                    <td algin="left"><label class="textoPequenoMenu">
                            <%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".Inventario.Etiqueta3") == null) ? "LPN" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".Inventario.Etiqueta3")%>
                            :</label></td><td align="left"><input value="<%=formInventario.getLpn()%>" style="z-index: 2;" id="txtLpn" name="txtLpn"/></td>                        
                </tr>
                <tr>
                    <td algin="left"><label class="textoPequenoMenu">
                            <%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".Inventario.Etiqueta4") == null) ? "Producto" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".Inventario.Etiqueta4")%>
                            :</label></td><td align="left"><input value="<%=formInventario.getProducto()%>" style="z-index: 3;" id="txtProducto" name="txtProducto"/></td>                        
                </tr>
                <tr>
                    <td algin="left"><label class="textoPequenoMenu">
                            <%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".Inventario.Etiqueta8") == null) ? "Iniciativa" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".Inventario.Etiqueta8")%>
                            :</label></td><td align="left"><input value="<%=formInventario.getMarbete()%>" style="z-index: 7;" id="txtMarbete" name="txtMarbete"/></td>                        
                </tr>

                <tr>
                    <td algin="left"><label class="textoPequenoMenu">
                            <%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".Inventario.Etiqueta6") == null) ? "Calidad" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".Inventario.Etiqueta6")%>
                            :</label></td>
                    <td>
                        <select style="z-index: 5;" id="lstCalidad" name="lstCalidad" onchange="selectValorCombo(this, 'cbCalidad');" >
                            <option value="-1">Seleccione Opción</option>
                            <%
                                if (request.getSession().getAttribute("listaCalidad") != null) {
                                    ListadoCalidad listadoCalidad = (ListadoCalidad) request.getSession().getAttribute("listaCalidad");

                                    for (int i = 0; i < listadoCalidad.getListCalidad().size(); i++) {
                                        String descripcion = listadoCalidad.getListCalidad().get(i).getDescripcion();
                                        String identificador = String.valueOf(listadoCalidad.getListCalidad().get(i).getIdentificador());
                                        if (formInventario.getCalidad() != null && !formInventario.getCalidad().equals("-1") && formInventario.getCalidad().equals(identificador.toString())) {
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
                <tr>
                    <td algin="left"><label class="textoPequenoMenu">
                            <%=((pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".Inventario.Etiqueta7") == null) ? "Marca" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".Inventario.Etiqueta7"))%>
                            :</label></td><td align="left">
                        <input value="<%=formInventario.getAnada()%>"
                               <%=((pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".Inventario.Etiqueta7.EventosJS") == null) ? "" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".Inventario.Etiqueta7.EventosJS"))%>
                               style="z-index: 6;" id="txtAnada" name="txtAnada"/></td>                        
                </tr>
                <tr>
                    <td algin="left"><label class="textoPequenoMenu">
                            <%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".Inventario.Etiqueta5") == null) ? "Cantidad" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".Inventario.Etiqueta5")%>
                            :</label></td><td align="left"><input value="<%=formInventario.getCantidad()%>" style="z-index: 4;" id="txtCantidad" name="txtCantidad"/></td>                        
                </tr>   
                <tr>
                    <td algin="left"><label class="textoPequenoMenu">
                            <%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".Inventario.Etiqueta9") == null) ? "Vigencia" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".Inventario.Etiqueta9")%>
                            :</label></td><td align="left"><input value="<%=formInventario.getVigencia()%>" style="z-index: 8;" id="txtVigencia" name="txtVigencia"/></td>                        
                </tr>
                <tr>
                    <td algin="left"><label class="textoPequenoMenu">
                            <%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".Inventario.Etiqueta10") == null) ? "Fiscal" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".Inventario.Etiqueta10")%>
                            :</label></td><td align="left"><input  type="checkbox" style="z-index: 9;" <%=(formInventario.getFiscal() == 1) ? "checked" : " "%>  onclick="setFiscalCheck(this);" id="chkFiscal" name="chkFiscal"/></td>                        
                </tr>

                <tr>
                    <td algin="left"><a style="z-index: 10;" href="menu_principal.jsp"><img src="src/images/ic_menu.jpg" /></a></td> 
                    <!--<td align="center"><input style="z-index: 9;width: 100%;" id="submit" type="submit" value="REGISTRAR"></td>-->                        
                    <td algin="left"><input  style="z-index: 9;" id="submit" type="submit" onclick="registrarInventario('frmInventarioActivos');return false;" value="REGISTRAR"></td>                        

                </tr>
                <input type="hidden" name="accion" id="accion" value="REGISTRAR_INVENTARIO_ACTIVOS" />
                <input type="hidden" id="cbCalidad" name="cbCalidad" id="accion" value="<%=formInventario.getCalidad()%>" />
                <input type="hidden" id="txtFiscal" name="txtFiscal" id="accion" value="<%=formInventario.getFiscal()%>" />
                <input type="hidden" id="txtPrimera" name="txtPrimera" value="<%=formInventario.getPrimera()%>" />
                <input type="hidden" id="txtGuardar" name="txtGuardar" value="<%=formInventario.getGuardar()%>" />

            </table>
        </form>

        <script>
            if (document.getElementById('txtPrimera').value == '1') {
                document.getElementById('txtReferencia').focus();
            } else {
                document.getElementById('txtLocalidad').focus();
            }
        </script>
        <jsp:include page="footer.jsp" />
    </body>
</html>

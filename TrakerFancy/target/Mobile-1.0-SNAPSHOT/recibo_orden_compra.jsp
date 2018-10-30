<%-- 
    Document   : tpagina
    Created on : 29/12/2015, 10:29:30 AM
    Author     : omarsorianoz
--%>
<%@page import="form.FormOrdenCompra"%>
<%@page import="pojos.core.ListadoDocumento"%>
<%@page import="form.FormInventario"%>
<%@page import="pojos.core.ListadoCalidad"%>
<%@page import="constantes.Pages"%>
<%@page import="pojos.core.ListadoArea"%>
<%@page import="pojos.core.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="src/js/JSmenu.js" type="text/javascript"></script>
<script src="src/js/JSespecializacion.js" type="text/javascript"></script>
<%@page session="true"%>
<%
    String mensaje = (String) ((request.getAttribute("mensaje") != null) ? request.getAttribute("mensaje") : "");
    Usuario user = new Usuario();
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
                            <td algin="left"><label class="textoPequenoMenu">
                        
                                    <%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta10") == null) ? "Documento:" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta10")+" :"%>
                        </label></td>
                    <td>
                        <select id='ListaDocumento' name='ListaDocumento' style="z-index: 0;" onchange="selectValorCombo(this, 'cbDocumento');" >
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
                <tr>
                    <td algin="left"><label class="textoPequenoMenu">
                            <%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta1") == null) ? "LPN" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta1")%>
                            :</label></td><td align="left"><input value="<%=formOrdenCompra.getLpn()%>" style="z-index: 1;" id="txtLpn" name="txtLpn"/></td>                        
                </tr>
                <tr>
                    <td algin="left"><label class="textoPequenoMenu">
                            <%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta2") == null) ? "Producto" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta2")%>
                            :</label></td><td align="left"><input value="<%=formOrdenCompra.getProducto()%>" style="z-index: 2;" id="txtProducto" name="txtProducto"/></td>                        
                </tr>

                
                <tr >
                    <td algin="left"><label class="textoPequenoMenu">
                            <%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta3") == null) ? "Cantidad" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta3")%>
                            :</label></td><td align="left"><input value="<%=formOrdenCompra.getCantidad()%>" style="z-index: 3;" id="txtCantidad" name="txtCantidad"/></td>                        
                </tr>  
                <tr>
                    <td algin="left"><label class="textoPequenoMenu">
                            <%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta4") == null) ? "Calidad" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta4")%>
                            :</label></td>
                    <td>
                        <select style="z-index: 4;" id="ListaCalidad" name="ListaCalidad" onchange="selectValorCombo(this, 'cbCalidad');" >
                            <option value="-1">
                                Seleccione Calidad</option>
                                <%
                                    if (request.getSession().getAttribute("listaCalidad") != null) {
                                        ListadoCalidad listadoCalidad = (ListadoCalidad) request.getSession().getAttribute("listaCalidad");

                                        for (int i = 0; i < listadoCalidad.getListCalidad().size(); i++) {
                                            String descripcion = listadoCalidad.getListCalidad().get(i).getDescripcion();
                                            String identificador = String.valueOf(listadoCalidad.getListCalidad().get(i).getIdentificador());
                                            if (formOrdenCompra.getCalidad() != null && !formOrdenCompra.getCalidad().equals("-1") && formOrdenCompra.getCalidad().equals(identificador.toString())) {
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
                <tr style="display:<%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta5.Display") == null) ? "compact" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta5.Display")%>" >
                    <td algin="left"><label class="textoPequenoMenu">
                            <%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta5") == null) ? "Marca" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta5")%>
                            :</label></td><td align="left"><input value="<%=formOrdenCompra.getAnada()%>"
                            <%=((pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta5.EventosJS") == null) ? "" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta5.EventosJS"))%>                            
                                                          style="z-index: 5;" id="txtAnada" name="txtAnada"/></td>                        
                </tr>
                <tr style="display:<%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta6.Display") == null) ? "compact" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta6.Display")%>" >
                    <td algin="left"><label class="textoPequenoMenu">
                            <%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta6") == null) ? "Iniciativa" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta6")%>       
                            :</label></td><td align="left"><input value="<%=formOrdenCompra.getMarbete()%>" style="z-index: 6;" id="txtMarbete" name="txtMarbete"/></td>                        
                </tr>
                <tr style="display:<%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta7.Display") == null) ? "compact" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta7.Display")%>" >
                    <td algin="left"><label class="textoPequenoMenu">
                            <%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta7") == null) ? "Vigencia" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta7")%>
                            :</label></td><td align="left"><input value="<%=formOrdenCompra.getVigencia()%>" style="z-index: 7;" id="txtVigencia" name="txtVigencia"/></td>                        
                </tr>
                <tr style="display:<%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta8.Display") == null) ? "compact" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta8.Display")%>" >
                    <td algin="left"><label class="textoPequenoMenu">
                            <%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta8") == null) ? "Fiscal" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta8")%>
                            :</label></td><td align="left"><input  type="checkbox" style="z-index: 8;" <%=(formOrdenCompra.getFiscal() == 1) ? "checked" : " "%>  onclick="setFiscalCheck(this);" id="chkFiscal" name="chkFiscal"/></td>                        
                </tr>

                <tr>
                    <td algin="left"><a style="z-index: 9;" href="menu_principal.jsp"><img src="src/images/ic_menu.jpg" /></a></td> 
                    <td algin="left"><input style="z-index: 8;" id="submit" type="submit" value="REGISTRAR"></td>                        

                </tr>
                <input type="hidden" name="accion" id="accion" value="REGISTRO_RECIBO_ORDEN_DE_COMPRA" />
                <input type="hidden" id="cbCalidad" name="cbCalidad" value="<%=formOrdenCompra.getCalidad()%>" />
                <input type="hidden" id="cbDocumento" name="cbDocumento" value="<%=formOrdenCompra.getDocumento()%>" />
                <input type="hidden" id="txtFiscal" name="txtFiscal" value="<%=formOrdenCompra.getFiscal()%>" />
                <input type="hidden" id="txtPrimera" name="txtPrimera" value="<%=formOrdenCompra.getPrimera()%>" />

            </table>
        </form>

        <script>
            if (document.getElementById('txtPrimera').value == '1') {
                document.getElementById('ListaDocumento').focus();
            } else {
                document.getElementById('txtLpn').focus();
            }
        </script>
        <jsp:include page="footer.jsp" />
    </body>
</html>

<%@page import="pojos.core.ListadoCalidad"%>
<%@page import="pojos.core.ListadoDocumento"%>
<%@page import="form.FormOrdenCompra"%>
<%@page import="constantes.Pages"%>
<%@page import="pojos.core.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="src/js/JSmenu.js" type="text/javascript"></script>
<%@page session="true" %>
<%
    String mensaje = (String) ((request.getAttribute("mensaje") != null) ? request.getAttribute("mensaje") : "");
    Usuario user = new Usuario();
    FormOrdenCompra formOrdenCompra = new FormOrdenCompra("", "", "", "", "-1", "", "", 0, 1, "");
    if (request.getSession().getAttribute("usuario") == null) {
        RequestDispatcher send = request.getRequestDispatcher("index__.jsp");
        send.forward(request, response);
    } else {
        user = ((Usuario) request.getSession().getAttribute("usuario"));
    }
    if (request.getSession().getAttribute("formOrdenCompra") == null) {
        RequestDispatcher send = request.getRequestDispatcher("index__.jsp");
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
<jsp:include page="header__.jsp" />
<form  id="frmReciboOrdenCompra" method="post" name="frmReciboOrdenCompra" action="ServiceTracker">


    <div class="form-group">
        <div class="col-sm-12" class="select">
            <select id='ListaDocumento' name='ListaDocumento'  class="form-control" onchange="selectValorCombo(this, 'cbDocumento');" >
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

        </div>
    </div>



    <div class="wrap-input100 validate-input">
        <input class="input100" type="text" name="txtLpn" id="txtLpn" placeholder=" <%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta1") == null) ? "LPN" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta1")%>">
        <span class="focus-input100-1"></span>
        <span class="focus-input100-2"></span>
    </div>

    <div class="wrap-input100 rs1 validate-input">
        <input class="input100" type="text" name="txtProducto" id="txtProducto" placeholder="<%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta2") == null) ? "Producto" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta2")%>">
        <span class="focus-input100-1"></span>
        <span class="focus-input100-2"></span>
    </div>
    <div class="wrap-input100 rs1 validate-input">
        <input class="input100" type="text" name="txtCantidad" id="txtProducto" placeholder="<%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta3") == null) ? "Cantidad" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta3")%>">
        <span class="focus-input100-1"></span>
        <span class="focus-input100-2"></span>
    </div>
    <div class="form-group">
        <div class="col-sm-12" class="select">
            <select id="ListaCalidad"  class="form-control"  name="ListaCalidad" onchange="selectValorCombo(this, 'cbCalidad');" >
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

        </div>
    </div>

    <div class="wrap-input100 rs1 validate-input">
        <input class="input100" type="text" name="txtAnada" id="txtAnada" placeholder="<%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta5") == null) ? "Marca" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta5")%>">
        <span class="focus-input100-1"></span>
        <span class="focus-input100-2"></span>
    </div>  
    <div class="wrap-input100 rs1 validate-input">
        <input class="input100" type="text" name="txtMarbete" id="txtMarbete" placeholder="<%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta6") == null) ? "Iniciativa" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta6")%>">
        <span class="focus-input100-1"></span>
        <span class="focus-input100-2"></span>
    </div>  
    <div class="wrap-input100 rs1 validate-input">
        <input class="input100" type="text" name="txtVigencia" id="txtVigencia" placeholder="<%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta7") == null) ? "Vigencia" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta7")%>">
        <span class="focus-input100-1"></span>
        <span class="focus-input100-2"></span>
    </div>  
    <div class="col-md-12">
        <input type="checkbox" data-group-cls="btn btn-group-justified" onclick="setFiscalCheck(this);" id="chkFiscal" name="chkFiscal"> <%=(pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta8") == null) ? "Fiscal" : pageContext.getServletContext().getInitParameter(pageContext.getServletContext().getInitParameter("Cliente") + ".OC.Etiqueta8")%>      
    </div>
     <div class="table-responsive">          
            <table class="table table-condensed">
                <tbody>
                    <tr>
                        
                        <td><div class="container-login100-form-btn m-t-20">
        <button type="submit" class="login100-form-btn">
            Registrar
        </button>
    </div></td>
    <td><a href="menu_principal__.jsp"><img src="src/images/responsive/ic_menu_x.png" alt="Menú"  onclick="reciboOrdenCompra('frmMenuRecibos');"  /><br><label class="textoPequenoMenus">Menú</label></a></td>
                    </tr>
                </tbody>
            </table>
     </div>
    
    

    <div class="text-center p-t-45 p-b-4">
        <span class="txt1">
            <label id="lblMensaje" class="error"><%=mensaje%></label>
        </span>					
    </div>
    <input type="hidden" name="accion" id="accion" value="REGISTRO_RECIBO_ORDEN_DE_COMPRA" />
    <input type="hidden" id="cbCalidad" name="cbCalidad" value="<%=formOrdenCompra.getCalidad()%>" />
    <input type="hidden" id="cbDocumento" name="cbDocumento" value="<%=formOrdenCompra.getDocumento()%>" />
    <input type="hidden" id="txtFiscal" name="txtFiscal" value="<%=formOrdenCompra.getFiscal()%>" />
    <input type="hidden" id="txtPrimera" name="txtPrimera" value="<%=formOrdenCompra.getPrimera()%>" />


</form>
<jsp:include page="footer__.jsp" />

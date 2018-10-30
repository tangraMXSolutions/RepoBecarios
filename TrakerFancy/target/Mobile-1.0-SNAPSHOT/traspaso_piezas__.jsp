
<%@page import="pojos.core.ListadoCalidad"%>
<%@page import="constantes.Pages"%>
<%@page import="pojos.core.Usuario"%>
<%@page import="form.FormPiezas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="src/js/JSmenu.js" type="text/javascript"></script>
<%@page session="true"%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);

    String mensaje = (String) ((request.getAttribute("mensaje") != null) ? request.getAttribute("mensaje") : "");
    Usuario user = new Usuario();
    FormPiezas formPiezas = new FormPiezas("", "", "", "-1", "", "", 0);
    if (request.getSession().getAttribute("usuario") == null) {
        RequestDispatcher send = request.getRequestDispatcher("index.jsp");
        send.forward(request, response);
    } else {
        user = ((Usuario) request.getSession().getAttribute("usuario"));
    }
    if (request.getSession().getAttribute("formPiezas") == null) {
        RequestDispatcher send = request.getRequestDispatcher("index.jsp");
        send.forward(request, response);
    } else {
        formPiezas = ((FormPiezas) request.getSession().getAttribute("formPiezas"));
    }
    String usuario
            = ((user.getUsuario() != null) ? user.getUsuario() : "") + "/"
            + ((user.getNombre() != null) ? user.getNombre() : "") + " "
            + ((user.getApellidoPaterno() != null) ? user.getApellidoPaterno() : "") + " "
            + ((user.getApellidoPaterno() != null) ? user.getApellidoPaterno() : "");
%>

<jsp:include page="header__.jsp" />



<form class="login100-form validate-form" id="frmPiezas" method="post" name="frmPiezas" action="ServiceTracker">




    <div class="wrap-input100 validate-input">
        <input class="input100" type="text" name="txtLocalidadorigen" value="<%=formPiezas.getLocalidadorigen()%>"  id="txtLocalidadorigen" placeholder="Localidad origen">
        <span class="focus-input100-1"></span>
        <span class="focus-input100-2"></span>
    </div>

    <div class="wrap-input100 validate-input">
        <input class="input100" type="text" name="txtLpnorigen" value="<%=formPiezas.getLpnorigen()%>"  id="txtLpnorigen" placeholder="LPN origen">
        <span class="focus-input100-1"></span>
        <span class="focus-input100-2"></span>
    </div>

    <div class="wrap-input100 validate-input">
        <input class="input100" type="text" name="txtProducto" value="<%=formPiezas.getProducto()%>"  id="txtProducto" placeholder="Producto">
        <span class="focus-input100-1"></span>
        <span class="focus-input100-2"></span>
    </div>
    <div class="wrap-input100 validate-input">
        <input class="input100" type="text" name="txtCantidad" value="<%=formPiezas.getCantidad()%>"  id="txtCantidad" placeholder="Cantidad">
        <span class="focus-input100-1"></span>
        <span class="focus-input100-2"></span>
    </div>
    <div class="wrap-input100 validate-input">
        <input class="input100" type="text" name="txtLocalidaddestino" value="<%=formPiezas.getLocalidaddestino()%>"  id="txtLocalidaddestino" placeholder="Localidad destino">
        <span class="focus-input100-1"></span>
        <span class="focus-input100-2"></span>
    </div>
    <div class="wrap-input100 validate-input">
        <input class="input100" type="text" name="txtLpndestino" value="<%=formPiezas.getLpndestino()%>"  id="txtLpndestino" placeholder="LPN destino">
        <span class="focus-input100-1"></span>
        <span class="focus-input100-2"></span>
    </div>

    <div class="form-group">
        <label for="selectCalidad" class="col-sm-12 control-label">.::.</label>
        <div class="col-sm-12" class="select">
            <select id="selectCalidad" class="form-control" onchange="selectValorCombo(this, 'cbCalidad');" >
                <option value="-1">Seleccione Calidad</option>
                <%
                    if (request.getSession().getAttribute("listaCalidad") != null) {
                        ListadoCalidad listadoCalidad = (ListadoCalidad) request.getSession().getAttribute("listaCalidad");

                        for (int i = 0; i < listadoCalidad.getListCalidad().size(); i++) {
                            String descripcion = listadoCalidad.getListCalidad().get(i).getDescripcion();
                            String identificador = String.valueOf(listadoCalidad.getListCalidad().get(i).getIdentificador());
                            if (formPiezas.getCalidad() != null && !formPiezas.getCalidad().equals("-1") && formPiezas.getCalidad().equals(identificador.toString())) {
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



    <div class="table-responsive">          
        <table class="table table-condensed">
            <tbody>
                <tr>

                    <td><div class="container-login100-form-btn m-t-20">
                            <button onclick="registrarPiezas('frmPiezas');return false;"  type="submit" class="login100-form-btn">
                                Registrar
                            </button>
                        </div></td>
                    <td><a href="menu_principal__.jsp"><img src="src/images/responsive/ic_menu_x.png" alt="Menú"  onclick="reciboOrdenCompra('frmMenuRecibos');"  /><br><label class="textoPequenoMenus">Menú</label></a></td>
                </tr>
            </tbody>
        </table>
    </div>




    <input type="hidden" name="accion" id="accion" value="INGRESAR" />
    <input type="hidden" id="cbCliente" name="cbCliente" id="accion" value="-1" />



    <div class="text-center p-t-45 p-b-4">
        <span class="txt1">
            <label id="lblMensaje" class="error"><%=mensaje%></label>
        </span>


    </div>
    <input type="hidden" name="accion" id="accion" value="REGISTRAR_TRASPASO_PIEZAS" />
    <input type="hidden" id="txtGuardar" name="txtGuardar" value="<%=formPiezas.getGuardar()%>" />
    <input type="hidden" id="cbCalidad" name="cbCalidad" value="<%=formPiezas.getCalidad()%>" />


</form>
<script>
    if (document.getElementById('txtPrimera').value == '1') {
        document.getElementById('txtReferencia').focus();
    } else {
        document.getElementById('txtLocalidad').focus();
    }
</script>

<jsp:include page="footer__.jsp" />



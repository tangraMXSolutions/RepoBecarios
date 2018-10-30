<%-- 
    Document   : tpagina
    Created on : 29/12/2015, 10:29:30 AM
    Author     : omarsorianoz
--%>

<%@page import="form.FormSusrtidoEtapa3"%>
<%@page import="constantes.Pages"%>
<%@page import="pojos.elemento.ElementoPendienteDeSurtir"%>
<%@page import="pojos.core.ListadoPedido"%>
<%@page import="pojos.core.ListadoDocumento"%>
<%@page import="pojos.core.ListadoCalidad"%>
<%@page import="pojos.core.ListadoArea"%>
<%@page import="pojos.core.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="src/js/JSmenu.js" type="text/javascript"></script>
<%@page session="true" %>
<%
    FormSusrtidoEtapa3 formSusrtidoEtapa3= new FormSusrtidoEtapa3("","","","");
    if(request.getAttribute("formSusrtidoEtapa3")!=null){
        formSusrtidoEtapa3=(FormSusrtidoEtapa3)request.getAttribute("formSusrtidoEtapa3");
    }
    
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
    String identificador="";
    String idLocalidad="";
    String localidad="";
    String lpn="";
    String producto="";
    String sku="";
    String ean="";
    String upc="";
    String cantidadSurtir="0";
    if(request.getSession().getAttribute("elementoPendienteDeSurtir")!=null){
    ElementoPendienteDeSurtir elementoPendienteDeSurtir=(ElementoPendienteDeSurtir)request.getSession().getAttribute("elementoPendienteDeSurtir");
    cantidadSurtir=String.valueOf(elementoPendienteDeSurtir.getCantidadASurtir());
     identificador=elementoPendienteDeSurtir.getIdentificador().toString();
     idLocalidad=String.valueOf(elementoPendienteDeSurtir.getLocalidad().getIdentificador());
     lpn=elementoPendienteDeSurtir.getLpn().getDescripcion();
     sku=elementoPendienteDeSurtir.getProducto().getSku();
     ean=elementoPendienteDeSurtir.getProducto().getEAN13();
     upc=elementoPendienteDeSurtir.getProducto().getUPC128();
     producto=elementoPendienteDeSurtir.getProducto().getSku()+" - "+elementoPendienteDeSurtir.getProducto().getDescripcion();
     localidad = elementoPendienteDeSurtir.getLocalidad().getPasillo().getDescripcion() + "-" +
                                    elementoPendienteDeSurtir.getLocalidad().getLado().getDescripcion() + "-" +
                                    elementoPendienteDeSurtir.getLocalidad().getPosicionX() + "-" +
                                    elementoPendienteDeSurtir.getLocalidad().getPosicionY() +
                                    ((elementoPendienteDeSurtir.getLocalidad().getPosicionZ() == 0) ? "" : "-" + String.valueOf(elementoPendienteDeSurtir.getLocalidad().getPosicionZ()));
    }
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
        <form id="frmSurtidoEtapa3Maquila" method="post" name="frmSurtidoEtapa3Maquila" action="ServiceTracker" >
            <div id="container">
                    <table style="margin: 1px;padding: 1px;width: 10%;">
                        <tr><td colspan="2"><label id="lblMensaje" class="error"><%=mensaje%></label></td></tr>
                        <tr>
                            <td align="left"><label class="textoPequenoMenu">Pedido:</label></td>
                            <td align="left"><label class="texto"><%=identificador%></label></td>
                            
                        </tr>
                        <tr>
                            <td align="left"><label class="textoPequenoMenu">LPN:</label></td>
                            <td align="left"><label class="texto"><%=lpn%></label></td>
                            
                        </tr>
                        <tr>
                            <td align="right"><label class="textoPequenoMenu">Localidad:</label></td>
                            <td align="left"><label class="texto"><%=localidad%></label></td>
                            
                        </tr>
                        <tr>
                            <td align="left"><label class="textoPequenoMenu">Confirmar Producto:</label></td>
                            <td align="left"><label class="texto"><%=producto%></label></td>
                            
                        </tr>
                        <tr>
                            <td align="left"><label class="textoPequenoMenu">Conf. Producto:</label></td><td align="left"><input style="z-index: 0;" value="<%=formSusrtidoEtapa3.getProducto()%>" id="txtProducto" name="txtProducto"/></td>                        
                        </tr>
                         <tr>
                            <td align="left"><label class="textoPequenoMenu">Cantidad Surtir:</label></td>
                            <td align="left"><label class="texto"><%=cantidadSurtir%></label></td>
                            
                        </tr>
                        <tr>
                            <td align="left"><label class="textoPequenoMenu">Cantidad:</label></td><td align="left"><input style="z-index: 1;" value="<%=formSusrtidoEtapa3.getCantidad()%>" id="txtCantidad" name="txtCantidad"/></td>                        
                        </tr>
                        
                         <tr>
                            <td align="left"><a href="menu_principal.jsp"><img src="src/images/ic_menu.jpg" /></a></td> 
                            <td align="left"><input style="z-index: 2; " id="submit" type="submit" value="CONTINUAR" ></td>                        

                        </tr>
                        
                    </table>
                            <input type="hidden" name="idLocalidad" id="idLocalidad" value="<%=idLocalidad%>" />
                            <input type="hidden" name="idSku" id="idSku" value="<%=sku%>" />
                            <input type="hidden" name="idEan" id="idEan" value="<%=ean%>" />
                            <input type="hidden" name="idUpc" id="idUpc" value="<%=upc%>" />
                            <input type="hidden" name="accion" id="accion" value="CONTINUAR_SURTIDO_ETAPA2_MAQUILA" />
                        
            </div>
        </form>

<jsp:include page="footer.jsp" />
    </body>
</html>

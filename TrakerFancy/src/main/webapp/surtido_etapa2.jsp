<%-- 
    Document   : tpagina
    Created on : 29/12/2015, 10:29:30 AM
    Author     : omarsorianoz
--%>

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
    if(request.getAttribute("elementoPendienteDeSurtir")!=null){
    
    ElementoPendienteDeSurtir elementoPendienteDeSurtir=(ElementoPendienteDeSurtir)request.getAttribute("elementoPendienteDeSurtir");
     identificador=elementoPendienteDeSurtir.getIdentificador().toString();
     identificador=((String[])request.getSession().getAttribute("numeros"))[1];
     idLocalidad=String.valueOf(elementoPendienteDeSurtir.getLocalidad().getIdentificador());
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
        <form id="frmSurtidoEtapa2" method="post" name="frmSurtidoEtapa2" action="ServiceTracker" >
            <div id="container">

                    <table style="margin: 1px;padding: 1px;width: 10%;">
                        <tr>
                            <td align="left"><label class="textoPequenoMenu">Pedido:</label></td><td align="left"><b><label class="texto"><%=identificador%></label></b></td>
                            
                        </tr>
                        <tr>
                            <td align="left"><label class="textoPequenoMenu">Localidad:</label></td><td align="left"><label class="texto"><%=localidad%></label></td>
                            
                        </tr>
                        <tr>
                            <td align="left"><label class="textoPequenoMenu">Conf. Localidad:</label></td><td align="left"><input style="z-index: 0;" id="txtLocalidad" name="txtLocalidad"/></td>                        
                        </tr>
                        <tr><td colspan="2"><label id="lblMensaje" class="error"><%=mensaje%></label></td></tr>
                         <tr>
                            <td align="left"><a href="menu_principal.jsp"><img src="src/images/ic_menu.jpg" /></a></td> 
                            <td align="left"><input style="z-index: 1;" id="submit" type="submit" value="CONTINUAR" ></td>                        

                        </tr>
                        
                    </table>
                            <input type="hidden" name="idLocalidad" id="idLocalidad" value="<%=idLocalidad%>" />
                            <input type="hidden" name="accion" id="accion" value="CONTINUAR_SURTIDO_ETAPA1" />                      
            </div>
        </form>
                            <jsp:include page="footer.jsp" />
    </body>
</html>

<%-- 
    Document   : traspaso_marbete
    Created on : 25/01/2016, 01:36:22 PM
    Author     : PC
--%>

<%@page import="form.FormMarbete"%>
<%@page import="pojos.core.Usuario"%>
<%@page import="constantes.Pages"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="src/js/JSmenu.js" type="text/javascript"></script>
<%@page session="true"%>
<%
    response.setHeader("Cache-Control","no-cache"); 
    response.setHeader("Pragma","no-cache"); 
    response.setDateHeader ("Expires", -1); 

    String mensaje = (String) ((request.getAttribute("mensaje") != null) ? request.getAttribute("mensaje") : "");
    Usuario user = new Usuario();
    FormMarbete formMarbete = new FormMarbete("","","","-1","","","",0);
    if (request.getSession().getAttribute("usuario") == null) {
        RequestDispatcher send = request.getRequestDispatcher("index.jsp");
        send.forward(request, response);
    } else {
        user = ((Usuario) request.getSession().getAttribute("usuario"));
    }
      if (request.getSession().getAttribute("formMarbete") == null) {
        RequestDispatcher send = request.getRequestDispatcher("index.jsp");
        send.forward(request, response);
    } else {
        formMarbete = ((FormMarbete) request.getSession().getAttribute("formMarbete"));
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
        <form id="frmMarbete" method="post" name="frmMarbete" action="ServiceTracker">
                    <table style="margin: 1px;padding: 1px;width: 10%;">
                        <tr><td colspan="2"><label id="lblMensaje" class="error"><%=mensaje%></label></td></tr>
                        <tr>
                            <td algin="left"><label class="textoPequenoMenu">Localidad origen:</label></td><td align="left"><input value="<%=formMarbete.getLocalidadorigen()%>" style="z-index: 0;" id="txtLocalidadorigen" name="txtLocalidadorigen"/></td>                        
                        </tr>
                        <tr>
                            <td algin="left"><label class="textoPequenoMenu">LPN origen:</label></td><td align="left"><input value="<%=formMarbete.getLpnorigen()%>" style="z-index: 1;" id="txtLpnorigen" name="txtLpnorigen"/></td>                        
                        </tr>
                        <tr>
                            <td algin="left"><label class="textoPequenoMenu">Producto:</label></td><td align="left"><input value="<%=formMarbete.getProducto()%>" style="z-index: 2;" id="txtProducto" name="txtProducto"/></td>                        
                        </tr>
                        <tr>
                            <td algin="left"><label class="textoPequenoMenu">Cantidad:</label></td><td align="left"><input value="<%=formMarbete.getCantidad()%>" style="z-index: 3;" id="txtCantidad" name="txtCantidad"/></td>                        
                        </tr>
                        <tr>
                            <td algin="left"><label class="textoPequenoMenu">Marbete:</label></td><td align="left"><input value="<%=formMarbete.getMarbete()%>" style="z-index: 4;" id="txtMarbete" name="txtMarbete"/></td>                        
                        </tr> 
                        <tr>
                            <td algin="left"><label class="textoPequenoMenu">Localidad destino:</label></td><td align="left"><input value="<%=formMarbete.getLocalidaddestino()%>" style="z-index: 5;" id="txtLocalidadDestino" name="txtLocalidaddestino"/></td>                        
                        </tr>
                        <tr>
                            <td algin="left"><label class="textoPequenoMenu">LPN destino:</label></td><td align="left"><input value="<%=formMarbete.getLpndestino()%>" style="z-index: 6;" id="txtLpndestino" name="txtLpndestino"/></td>                        
                        </tr>
                        
                        <tr>
                            <td algin="left"><a style="z-index: 8;" href="menu_principal.jsp"><img src="src/images/ic_menu.jpg" /><br><label class="textoPequenoMenu">Menu</label></a></center></td> 
                            <!--<td align="center"><input style="z-index: 9;width: 100%;" id="submit" type="submit" value="REGISTRAR"></td>-->                        
                            <td algin="left"><input  style="z-index: 7;" id="submit" type="submit" onclick="registrarMarbete('frmMarbete');return false;" value="REGISTRAR"></td>                        

                        </tr>
                        <input type="hidden" name="accion" id="accion" value="REGISTRAR_TRASPASO_MARBETE" />
                        <input type="hidden" id="txtGuardar" name="txtGuardar" value="<%=formMarbete.getGuardar()%>" />

                    </table>
        </form>

                        <script>
                            if(document.getElementById('txtPrimera').value=='1'){
                                document.getElementById('txtReferencia').focus();
                            }else{
                                document.getElementById('txtLocalidad').focus();
                            }
                        </script>
                        <jsp:include page="footer.jsp" />
    </body>
</html>


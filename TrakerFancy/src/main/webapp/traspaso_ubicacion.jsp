<%-- 
    Document   : traspaso_ubicacion
    Created on : 25/01/2016, 01:35:37 PM
    Author     : PC
--%>

<%@page import="form.FormUbicacion"%>
<%@page import="constantes.Pages"%>
<%@page import="pojos.core.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="src/js/JSmenu.js" type="text/javascript"></script>
<%@page session="true"%>
<%
    response.setHeader("Cache-Control","no-cache"); 
    response.setHeader("Pragma","no-cache"); 
    response.setDateHeader ("Expires", -1); 

    String mensaje = (String) ((request.getAttribute("mensaje") != null) ? request.getAttribute("mensaje") : "");
    Usuario user = new Usuario();
    FormUbicacion  formUbicacion = new FormUbicacion ("","",0);
    
    if (request.getSession().getAttribute("usuario") == null) {
        RequestDispatcher send = request.getRequestDispatcher("index.jsp");
        send.forward(request, response);
    } else {
        user = ((Usuario) request.getSession().getAttribute("usuario"));
    }
      if (request.getSession().getAttribute("formUbicacion") == null) {
        RequestDispatcher send = request.getRequestDispatcher("index.jsp");
        send.forward(request, response);
    } else {
        formUbicacion = ((FormUbicacion) request.getSession().getAttribute("formUbicacion"));
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
       
        <title>WMS</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
            <form id="frmUbicacion" method="post" name="frmUbicacion" action="ServiceTracker">
                    <table style="margin: 1px;padding: 1px;width: 10%;">
                        <tr><td colspan="2"><label id="lblMensaje" class="error"><%=mensaje%></label></td></tr>
                        <tr>
                            <td algin="left"><label class="textoPequenoMenu">Localidad Origen:</label></td><td align="left"><input value="<%=formUbicacion.getOrigen() %>" style="z-index: 0;" id="txtOrigen" name="txtOrigen"/></td>                        
                        </tr> 
                        <tr>
                            <td algin="left"><label class="textoPequenoMenu">Localidad destino:</label></td><td align="left"><input value="<%=formUbicacion.getDestino() %>" style="z-index: 1;" id="txtDestino" name="txtDestino"/></td>                        
                        </tr>
                        <tr>
                            <td algin="left"><a style="z-index: 4;" href="menu_principal.jsp"><img src="src/images/ic_menu.jpg" /><br><label class="textoPequenoMenu">Menu</label></a></center></td>
                            <!--<td align="center"><input style="z-index: 9;width: 100%;" id="submit" type="submit" value="REGISTRAR"></td>-->                        
                            <td algin="left"><input  style="z-index: 3;" id="submit" type="submit" onclick="registrarUbicacion('frmUbicacion');return false;" value="REGISTRAR"></td>                        

                        </tr>
                        <input type="hidden" name="accion" id="accion" value="REGISTRAR_TRASPASO_UBICACION" />
                        <input type="hidden" id="txtGuardar" name="txtGuardar" value="<%=formUbicacion.getGuardar()%>" />

                    </table>
        </form>
                        <jsp:include page="footer.jsp" />
    </body>
</html>

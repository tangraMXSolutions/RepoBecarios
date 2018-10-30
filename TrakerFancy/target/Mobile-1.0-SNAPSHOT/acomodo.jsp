<%-- 
    Document   : tpagina
    Created on : 29/12/2015, 10:29:30 AM
    Author     : omarsorianoz
--%>
<%@page import="form.FormAcomodo"%>
<%@page import="form.FormInventario"%>
<%@page import="pojos.core.ListadoCalidad"%>
<%@page import="constantes.Pages"%>
<%@page import="pojos.core.ListadoArea"%>
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
    FormAcomodo formAcomodo= new FormAcomodo("","","");
    if (request.getSession().getAttribute("usuario") == null) {
        RequestDispatcher send = request.getRequestDispatcher("index.jsp");
        send.forward(request, response);
    } else {
        user = ((Usuario) request.getSession().getAttribute("usuario"));
    }
      if (request.getSession().getAttribute("formAcomodo") == null) {
        RequestDispatcher send = request.getRequestDispatcher("index.jsp");
        send.forward(request, response);
    } else {
        formAcomodo = ((FormAcomodo) request.getSession().getAttribute("formAcomodo"));
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
        <form id="frmAcomodo" method="post" name="frmAcomodo" action="ServiceTracker">
            <div id="container">

                    <table aling="left" style="margin: 2px;padding: 4px;width: 70%;">
                        <tr><td colspan="2"><label id="lblMensaje" class="error"><%=mensaje%></label></td></tr>
                        <tr>
                            <td align="left"><label class="textoPequenoMenu">LPN:</label></td><td align="left"><input value="<%=formAcomodo.getLpn()%>" style="z-index: 0;" id="txtLpn" name="txtLpn"/></td>                        
                        </tr> 
                        <tr>
                            <td align="left"><label class="textoPequenoMenu">Conf.Localidad:</label></td><td align="left"><input value="<%=formAcomodo.getLocalidad()%>" style="z-index: 1;" id="txtLocalidad" name="txtLocalidad"/></td>                        
                        </tr>                        
                        <tr style="display: none;">
                            <td align="left"><label class="textoPequenoMenu">No.Piezas:</label></td><td align="left"><input value="<%=formAcomodo.getNumeroPiezas()%>" style="z-index: 2;" id="txtNumeroPiezas" name="txtNumeroPiezas"/></td>                        
                        </tr>                        
                        <tr>
                            <td align="left"><a style="z-index: 3;" href="menu_principal.jsp"><img src="src/images/ic_menu.jpg" /></a></td> 
                            <!--<td align="center"><input style="z-index: 9;width: 100%;" id="submit" type="submit" value="REGISTRAR"></td>-->                        
                            <td align="left"><input  style="z-index: 2;" id="submit" type="submit"  value="REGISTRAR"></td>                        

                        </tr>
                        <input type="hidden" name="accion" id="accion" value="REGISTRAR_ACOMODO" />
                       

                    </table>
            </div>
        </form>                    
    </body>
</html>

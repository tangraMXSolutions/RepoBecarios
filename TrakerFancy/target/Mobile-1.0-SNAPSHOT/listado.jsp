<%-- 
    Document   : listado
    Created on : 13/01/2016, 03:52:55 PM
    Author     : PC
--%>

<%@page import="pojos.core.ListadoArea"%>
<%@page import="pojos.core.Usuario"%>
<%@page import="constantes.Pages"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <form id="frmListado" method="post" name="frmListado" action="ServiceTracker">
            <div id="padrao">

                <center>
                    <table style="margin: 1px;padding: 1px;width: 10%;">
                        <tr>
                            <td align="left"><label class="textoPequenoMenu">Cliente:</label>
                                <select onchange="selectComboCliente(this,'cbCliente');" >
                                <option value="-1">Seleccione Cliente</option>
                            <%
                            if(user.getClientesPermitidos() !=null){                                
                                for(int i=0;i<user.getClientesPermitidos().size();i++){
                                    String descripcion=user.getClientesPermitidos().get(i).getNombreComercial();
                                    String identificador=String.valueOf(user.getClientesPermitidos().get(i).getIdentificador());
                                            
                                %>
                                <option value="<%=identificador%>"><%=descripcion%></option>
                                <%
                                }
                            }
                            %>
                            </select>
                            </td>
                        </tr>
                        <tr><td><label id="lblMensaje" class="error"><%=mensaje%></label></td></tr>
                    </table>                    
                        <input type="hidden" name="accion" id="accion" value="INGRESAR" />
                        <input type="hidden" id="cbCliente" name="cbCliente" id="accion" value="-1" />
                </center>
            </div>
        </form>

                        <jsp:include page="footer.jsp" />
    </body>
</html>

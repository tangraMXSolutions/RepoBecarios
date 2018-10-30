<%-- 
    Document   : header
    Created on : 29/08/2016, 03:37:30 AM
    Author     : Omar
--%>

<%@page import="pojos.core.Usuario"%>
<%@page import="constantes.Pages"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String formulario = (String) ((request.getAttribute("formulario") != null) ? request.getAttribute("formulario") : "Smart WMS Móvil");
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
<footer id="footer">
    <table style="width:100%;background-color: black;">
        <tr>
            <td>
                <center>
                <label class="tituloFooter">
                <%=usuario%>
                </label>
                </center>
            </td>
            <td>
                <center>
                <label class="tituloFooter">
                <%=formulario%>
                </label>
                </center>
            </td>
            
        </tr>        
    </table>    
</footer>

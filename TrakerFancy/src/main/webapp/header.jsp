<%-- 
    Document   : header
    Created on : 29/08/2016, 03:37:30 AM
    Author     : Omar
--%>

<%@page import="constantes.Pages"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header id="header">
    <table style="background-color:#F6F5F6; width: 100%;">
        <tr>
            <td rowspan="2" align="left">                
                
                <img src="src/images/ic_logos.jpg"/>
                
            </td>
            <td   align="left">
                <label class="titulo">
                    <%=pageContext.getServletContext().getInitParameter("Titulo")%>
                </label>
            </td>
        </tr>
        <tr>
            <td   align="left">
                <label class="subTitulo"><%=pageContext.getServletContext().getInitParameter("Subtitulo")%></label>
            </td>
        </tr>
    </table>
    
</header>

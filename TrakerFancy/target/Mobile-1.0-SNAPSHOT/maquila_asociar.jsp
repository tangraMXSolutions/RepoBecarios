<%-- 
    Document   : traspaso_tarima
    Created on : 25/01/2016, 01:36:07 PM
    Author     : PC
--%>

<%@page import="pojos.core.Respuesta"%>
<%@page import="form.FormMaquila"%>
<%@page import="pojos.core.ListadoMaquila"%>
<%@page import="pojos.core.Usuario"%>
<%@page import="constantes.Pages"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="src/js/JSmenu.js" type="text/javascript"></script>
<%@page session="true"%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);
    FormMaquila formMaquila = new FormMaquila();
    String mensaje = (String) ((request.getAttribute("mensaje") != null) ? request.getAttribute("mensaje") : "");
    Usuario user = new Usuario();
    Respuesta oRespuesta = (Respuesta) ((request.getAttribute("respuesta")!=null)? request.getAttribute("respuesta"): new Respuesta());
    
    if(request.getSession().getAttribute("formMaquila") !=null){
    formMaquila = (FormMaquila) request.getSession().getAttribute("formMaquila");
    }

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
        <meta HTTP-EQUIV=Expires CONTENT="0">
        <meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="src/css/stilo.css" rel="stylesheet" type="text/css"/>
        <script src="src/js/JSmenu.js" type="text/javascript"></script>
        <title>WMS</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <form id="frmAsociacionMaquila" method="post" name="frmAsociaconMaquila" action="ServiceTracker">

            <table style="margin: 1px;padding: 1px;width: 10%;">
                <tr><td colspan="2"><label id="lblMensaje" class="error"><%= oRespuesta.ExisteError() ? oRespuesta.getMensaje(): ""%></label></td></tr>
                <tr> 
                <tr>
                    <td algin="left"><label class="textoPequenoMenu">Documento maquila:</label></td>
                    <td>
                        <select style="z-index: 5;" onchange="selectValorCombo(this, 'idDocumento');" >
                            <option value="-1">Seleccione Maquila</option>
                            <%
                                if (formMaquila.getListaDocumentosMaquila().size() >0) {
                                    for (int i = 0; i < formMaquila.getListaDocumentosMaquila().size(); i++) {
                                        String descripcion = formMaquila.getListaDocumentosMaquila().get(i).getDocumentoMaquila();
                                        int identificador  = formMaquila.getListaDocumentosMaquila().get(i).getIdentificador();
                            %>
                            <option value="<%=identificador%>"><%=descripcion%></option>
                            <%
                                    }

                                }
                            %>

                </tr>
                <tr>
                    <td align="left">LPN a asignar:</td>
                    <td align="left"><input value="<%=formMaquila.getLpn().getTarima().getDescripcion()%>" id="txtLpnAsignar" name="txtLpnAsignar"/>
                    </td>
                </tr>

                <td algin="left"><a style="z-index: 7;" href="menu_principal.jsp"><img src="src/images/ic_menu.jpg" /><br><label class="textoPequenoMenu">Menu</label></a></center></td> 
                <td algin="left"><input  style="z-index: 6;" id="submit" type="submit" onclick="asociarMaquilaRegistro('frmAsociacionMaquila');return false;" value="REGISTRAR"></td>       
            </table>
                      <label class="bien"><%= !oRespuesta.ExisteError() ? oRespuesta.getMensaje():"" %></label>
            <input type="hidden" id="idDocumento" name="idDocumento" value="<%=formMaquila.getIdentificadorDocumento() %>" />
        </form>
        <jsp:include page="footer.jsp" />
    </body>

</html>
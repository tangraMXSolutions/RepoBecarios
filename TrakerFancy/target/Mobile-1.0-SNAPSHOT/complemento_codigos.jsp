<%-- 
    Document   : tpagina
    Created on : 29/12/2015, 10:29:30 AM
    Author     : omarsorianoz
--%>
<%@page import="form.FormCodigo"%>
<%@page import="form.FormInventario"%>
<%@page import="pojos.core.ListadoCalidad"%>
<%@page import="constantes.Pages"%>
<%@page import="pojos.core.ListadoArea"%>
<%@page import="pojos.core.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);

    String mensaje = (String) ((request.getAttribute("mensaje") != null) ? request.getAttribute("mensaje") : "");
    Usuario user = new Usuario();

    FormCodigo formCodigo = new FormCodigo("", "", "", "","");
    if (request.getSession().getAttribute("usuario") == null) {
        RequestDispatcher send = request.getRequestDispatcher("index.jsp");
        send.forward(request, response);
    } else {
        user = ((Usuario) request.getSession().getAttribute("usuario"));
    }
    /*
    if (request.getAttribute("formComplementoCodigo") == null) {
        RequestDispatcher send = request.getRequestDispatcher("index.jsp");
        send.forward(request, response);
    } else {
        formCodigo = ((FormCodigo) request.getAttribute("formComplementoCodigo"));
    }*/
    if(request.getAttribute("formComplementoCodigo")!=null){
        formCodigo = ((FormCodigo) request.getAttribute("formComplementoCodigo"));
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

        <form id="frmCodigo" method="post" name="frmCodigo" action="ServiceTracker">

            <table style="margin: 1px;padding: 1px;width: 10%;">
                <tr><td colspan="2"><label id="lblMensaje" class="error"><%=mensaje%></label></td></tr>
                <tr>
                    <td align="left">
                        <label class="textoPequenoMenu">SKU/Clave:</label></td>
                    <td align="left"><input value="<%=formCodigo.getSku()%>" style="z-index: 0;" id="txtSkuClave" onblur="buscarProducto();" name="txtSkuClave"/></td>                        
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <input width="100%"  readonly="true" value="<%=formCodigo.getDescripcion()%>" style="z-index: 0;width: 100%;border: 0px;font-size: 8px;" id="txtDescripcion" name="txtDescripcion"/>                        
                    </td>                        
                </tr>
                <tr>
                    <td align="left">
                        <label class="textoPequenoMenu">Ean:</label></td>
                    <td align="left"><input value="<%=formCodigo.getEan()%>" style="z-index: 1;" id="txtEan" name="txtEan"/></td>                        
                </tr> 
                <tr>
                    <td align="left">
                        <label class="textoPequenoMenu">Upc:</label></td>
                    <td align="left"><input value="<%=formCodigo.getUpc()%>" style="z-index: 2;" id="txtUpc" name="txtUpc"/></td>                        
                </tr> 
                <tr>
                    <td align="left">
                        <label class="textoPequenoMenu">Otro:</label></td>
                    <td align="left"><input value="<%=formCodigo.getCodigoDeBarra()%>" style="z-index: 3;" id="txtCodigoDeBarra" name="txtCodigoDeBarra"/></td>                        
                </tr> 
                <tr>
                    <td align="left"><a style="z-index: 10;" href="menu_principal.jsp"><img src="src/images/ic_menu.jpg" /></a></td> 
                    <td align="left">
                    <input  style="z-index: 4;" type="submit" onclick="registrarComplementoCodigo('frmCodigo');return false;" value="REGISTRAR"></td>                        
                </tr>                
            </table>
                 <input type="hidden" name="accion" id="accion" value="COMPLEMENTO_CODIGO" />
                <input type="hidden" id="txtPrimera" name="txtPrimera" value="<%=formCodigo.getExiste()%>"/>
                <input type="hidden" id="txtExisto" name="txtExisto"/>
        </form>
        <script>
            function buscarProducto() {
                document.getElementById("frmCodigo").action = "ServiceTracker?accion=BUSCAR_COMPLEMENTO_CODIGO";    
                document.getElementById("frmCodigo").submit();
            }
        </script>

    </body>
</html>
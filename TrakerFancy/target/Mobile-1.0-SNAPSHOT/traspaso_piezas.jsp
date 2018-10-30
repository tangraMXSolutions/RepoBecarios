<%-- 
    Document   : traspaso_piezas
    Created on : 25/01/2016, 01:36:36 PM
    Author     : PC
--%>

<%@page import="pojos.core.ListadoCalidad"%>
<%@page import="constantes.Pages"%>
<%@page import="pojos.core.Usuario"%>
<%@page import="form.FormPiezas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="src/js/JSmenu.js" type="text/javascript"></script>
<%@page session="true"%>
<%
    response.setHeader("Cache-Control","no-cache"); 
    response.setHeader("Pragma","no-cache"); 
    response.setDateHeader ("Expires", -1); 

    String mensaje = (String) ((request.getAttribute("mensaje") != null) ? request.getAttribute("mensaje") : "");
    Usuario user = new Usuario();
    FormPiezas formPiezas= new FormPiezas("","","","-1","","",0);
    if (request.getSession().getAttribute("usuario") == null) {
        RequestDispatcher send = request.getRequestDispatcher("index.jsp");
        send.forward(request, response);
    } else {
        user = ((Usuario) request.getSession().getAttribute("usuario"));
    }
      if (request.getSession().getAttribute("formPiezas") == null) {
        RequestDispatcher send = request.getRequestDispatcher("index.jsp");
        send.forward(request, response);
    } else {
        formPiezas = ((FormPiezas) request.getSession().getAttribute("formPiezas"));
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
        <form id="frmPiezas" method="post" name="frmPiezas" action="ServiceTracker">
                    <table style="margin: 1px;padding: 1px;width: 10%;">
                        <tr><td colspan="2"><label id="lblMensaje" class="error"><%=mensaje%></label></td></tr>
                        <tr>
                            <td algin="left"><label class="textoPequenoMenu">Localidad origen:</label></td><td align="left"><input value="<%=formPiezas.getLocalidadorigen() %>" style="z-index: 0;" id="txtLocalidadorigen" name="txtLocalidadorigen"/></td>                        
                        </tr>
                        <tr>
                            <td algin="left"><label class="textoPequenoMenu">LPN origen:</label></td><td align="left"><input value="<%=formPiezas.getLpnorigen() %>" style="z-index: 1;" id="txtLpnorigen" name="txtLpnorigen"/></td>                        
                        </tr>
                        <tr>
                            <td algin="left"><label class="textoPequenoMenu">Producto:</label></td><td align="left"><input value="<%=formPiezas.getProducto()%>" style="z-index: 2;" id="txtProductoe" name="txtProducto"/></td>                        
                        </tr>
                        <tr>
                            <td algin="left"><label class="textoPequenoMenu">Cantidad:</label></td><td align="left"><input value="<%=formPiezas.getCantidad()%>" style="z-index: 3;" id="txtCantidad" name="txtCantidad"/></td>                        
                        </tr>  
                        <tr>
                            <td algin="left"><label class="textoPequenoMenu">Localidad destino:</label></td><td align="left"><input value="<%=formPiezas.getLocalidaddestino() %>" style="z-index: 4;" id="txtLocalidadDestino" name="txtLocalidaddestino"/></td>                        
                        </tr>
                        <tr>
                            <td algin="left"><label class="textoPequenoMenu">LPN destino:</label></td><td align="left"><input value="<%=formPiezas.getLpndestino() %>" style="z-index: 5;" id="txtLpndestino" name="txtLpndestino"/></td>                        
                        </tr>
                         <tr>
                            <td algin="left"><label class="textoPequenoMenu">Calidad:</label></td>
                            <td>
                                <select style="z-index: 5;" onchange="selectValorCombo(this,'cbCalidad');" >
                                <option value="-1">Seleccione Calidad</option>
                            <%
                            if(request.getSession().getAttribute("listaCalidad")!=null){
                                ListadoCalidad listadoCalidad= (ListadoCalidad)request.getSession().getAttribute("listaCalidad");
                                
                                for(int i=0;i<listadoCalidad.getListCalidad().size();i++){
                                    String descripcion=listadoCalidad.getListCalidad().get(i).getDescripcion();
                                    String identificador=String.valueOf(listadoCalidad.getListCalidad().get(i).getIdentificador());
                                  if(formPiezas.getCalidad()!=null && !formPiezas.getCalidad().equals("-1") && formPiezas.getCalidad().equals(identificador.toString()))   
                                  {
                                %>
                                <option selected value="<%=identificador%>"><%=descripcion%></option>
                                <%
                                  }else{
                                      %>
                                      <option value="<%=identificador%>"><%=descripcion%></option>
                                <%
                                  }
                                }
                            }
                            %>
                            </select>
                            <td>
                            
                        </tr>
                        <tr>
                            <td algin="left"><a style="z-index: 7;" href="menu_principal.jsp"><img src="src/images/ic_menu.jpg" /><br><label class="textoPequenoMenu">Menu</label></a></center></td> 
                            <!--<td align="center"><input style="z-index: 9;width: 100%;" id="submit" type="submit" value="REGISTRAR"></td>-->                        
                            <td algin="left"><input  style="z-index: 6;" id="submit" type="submit" onclick="registrarPiezas('frmPiezas');return false;" value="REGISTRAR"></td>                        

                        </tr>
                        <input type="hidden" name="accion" id="accion" value="REGISTRAR_TRASPASO_PIEZAS" />
                        <input type="hidden" id="txtGuardar" name="txtGuardar" value="<%=formPiezas.getGuardar()%>" />
                        <input type="hidden" id="cbCalidad" name="cbCalidad" value="<%=formPiezas.getCalidad()%>" />

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

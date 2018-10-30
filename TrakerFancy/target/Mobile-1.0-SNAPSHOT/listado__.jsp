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

<jsp:include page="header__.jsp" />



<form class="login100-form validate-form" id="frmListado" method="post" name="frmListado" action="ServiceTracker">
					
					
					
					

					
                            <div class="form-group">
                                    <label for="selectCliente" class="col-sm-12 control-label">.::.</label>
                                    <div class="col-sm-12" class="select">
                                        		<select id="selectCliente" class="form-control" onchange="selectComboCliente(this,'cbCliente');" >
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
                            
                                    </div>
                            </div>
                             <input type="hidden" name="accion" id="accion" value="INGRESAR" />
                        <input type="hidden" id="cbCliente" name="cbCliente" id="accion" value="-1" />

					

					<div class="text-center p-t-45 p-b-4">
						<span class="txt1">
							<label id="lblMensaje" class="error"><%=mensaje%></label>
						</span>

					
					</div>

					
					
				</form>

<jsp:include page="footer__.jsp" />


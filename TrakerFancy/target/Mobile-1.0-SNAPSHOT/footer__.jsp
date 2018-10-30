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

<div class="text-center">
    <span class="txt1">
        <%=usuario%>
    </span>
    <span class="txt2">
        <%=formulario%>
    </span>
    
</div>

</div>
</div>
</div>



<!--===============================================================================================-->
<script src="src/responsive/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="src/responsive/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="src/responsive/vendor/bootstrap/js/popper.js"></script>
<script src="src/responsive/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="src/responsive/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="src/responsive/vendor/daterangepicker/moment.min.js"></script>
<script src="src/responsive/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="src/responsive/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="src/responsive/js/main.js"></script>

</body>
</html>
<%@page import="constantes.Pages" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="src/js/JSmenu.js" type="text/javascript"></script>
<%@page session="true" %>
<%
    request.setCharacterEncoding("UTF8");
    String mensaje = (String) ((request.getAttribute("mensaje") != null) ? request.getAttribute("mensaje") : "");
%>
<html lang="en">
<head>
	<title>SmartWMS</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="src/responsive/images/icons/favicon.ico"/>
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="src/responsive/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="src/responsive/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="src/responsive/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="src/responsive/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="src/responsive/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="src/responsive/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="src/responsive/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="src/responsive/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="src/responsive/css/util.css">
	<link rel="stylesheet" type="text/css" href="src/responsive/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50">
			<span class="login100-form-title p-b-33">
                            <img src="src/images/ic_logos.jpg"/>
						SmartWMS
					</span>
					
					
					
				<form id="frmLogin" method="post" action="ServiceTracker" class="login100-form validate-form">
					
					
					
                                            <div class="wrap-input100 validate-input">
						<input class="input100" type="text" name="txtUsuario" id="txtUsuario" placeholder="Usuario">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>

					<div class="wrap-input100 rs1 validate-input" data-validate="Contraseña requerida">
						<input class="input100" type="password" name="txtPassword" id="txtPassword" placeholder="Contraseña">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>

					<div class="container-login100-form-btn m-t-20">
                                            <button type="submit" class="login100-form-btn">
							Ingresar
						</button>
					</div>

					<div class="text-center p-t-45 p-b-4">
						<span class="txt1">
							<label id="lblMensaje" class="error"><%=mensaje%></label>
						</span>					
					</div>
                                        <input type="hidden" name="accion" id="accion" value="LOGIN" />   
                                        <input type="hidden" name="version" id="version" value="7" />
					
					
				</form>
				<div class="text-center">
						<span class="txt1">
							TangraMX Services TI
						</span>
						<!--<a href="#" class="txt2 hov1">
							Sign up
						</a>-->
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
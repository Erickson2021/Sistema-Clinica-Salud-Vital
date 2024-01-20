<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/registrarUsuario.css">
</head>
<body>

<p style="color: red;" >${mensaje } </p>
<p style="color: green;" >${men } </p>
	<div class="box">
		<form action="ingresar?opcion=registrar" method="post" >
			<h2>REGISTRARSE</h2>
			
			
			<div class="inputBox">
				<input type="text"  id="nombre" name="txtnombre" required="required">
				<span>NOMBRE</span>
				<i></i>
			</div>
			<div class="inputBox">
				<input type="text"  id="apellido" name="txtapellido" required="required">
				<span>APELLIDO</span>
				<i></i>
			</div>
			<div class="inputBox">
				<input type="text"  id="usuario" name="txtusuario" required="required" maxlength="10">
				<span>USUARIO</span>
				<i></i>
			</div>
			<div class="inputBox">
				<input type="password"  id="clave" name="txtclave" required="required" maxlength="10">
				<span>Password</span>
				<i></i>
			</div>
			<br>
			<div class="boton">
			<button class="btn1" name="" value=""> Registrar</button>
				
				<a href="login.jsp" class="btn2">Regresar</a>
		</div>
		</form>
	</div>
</body>
</html>
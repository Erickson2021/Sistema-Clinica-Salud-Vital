<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/login.css">
</head>
<body>

<p style="color: red;" >${mensaje } </p>

<div class="box">
		<form action="ingresar?opcion=log" method="post" autocomplete="off">
			<h2>Iniciar sesión</h2>
			<div class="inputBox">
				<input type="text"  id="txtcorreo" name="txtcorreo" required="required">
				<span>Usuario</span>
				<i></i>
			</div>
			<div class="inputBox">
				<input type="password"  id="txtclave" name="txtclave" required="required">
				<span>Password</span>
				<i></i>
			</div>
			<div class="links">
				<a href="#">Olvidaste tu contraseña ?</a>
				<a href="RegistrarUsuario.jsp">Crear cuenta</a>
			</div>
			<input  type="submit" value="Login">
		</form>
		
		
		
	</div>

  <script 
  type = "módulo" src = "https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js" > </script>  
  <script  
  nomodule  src = "https://unpkg .com/ionicons@5.5.2/dist/ionicons/ionicons.js" > </script>
</body>
</html>
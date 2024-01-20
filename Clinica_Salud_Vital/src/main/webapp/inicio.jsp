<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="beans.UsuarioDTO" %>
<%
UsuarioDTO u = (UsuarioDTO) request.getSession().getAttribute("usu");
if (u ==null) {
	request.getRequestDispatcher("login.jsp").forward(request, response);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/inicio.css">
<style>
	body {
	background: url("img/inicio.jpg") no-repeat;
}
</style>

</head>
<body>

 <div id="sidmenu" class="menu-collapsed">
        <!-- HEADER -->   
        <div id="header">
            <div id="title"><span>Bienvenido</span></div>
            <div id="menu-btn">
                <div  class="btn-hamburger"></div>
                <div  class="btn-hamburger"></div>
                <div  class="btn-hamburger"></div> 
            </div>
        </div>
        <!-- PROFILE -->
        <div id="profile">
            <div id="photo"><img src="img/usuario.png" alt=""></div>

            <div id="name"><span> ${usu.nombre } </span></div>
        </div>

        <!-- ITEMS -->
        <div id="menu-items">
            <div class="item">
                <a href="inicio.jsp">
                    <div class="icon"><img src="img/casa.png" alt=""></div>
                    <div class="title">INICIO<span></span></div>
                </a>
            </div>
            
            <div class="item separator"></div>

            <div class="item">
                <a href="registrar_pacientes.jsp">
                    <div class="icon"><img src="img/paciente.png" alt=""></div>
                    <div class="title">Registrar Paciente<span></span></div>
                </a>
            </div>
            
            <div class="item">
                <a href="registrar_empleado.jsp">
                    <div class="icon"><img src="img/medico.png" alt=""></div>
                    <div class="title">Registrar Doctores<span></span></div>
                </a>
            </div>
            
            
            <div class="item">
                <a href="registrarCita.jsp">
                    <div class="icon"><img src="img/cita.png" alt=""></div>
                    <div class="title">Registrar Citas<span></span></div>
                    
                </a>
            </div>
           
            <div class="item">
                <a href="BuscarCita.jsp">
                    <div class="icon"><img src="img/buscar.png" alt=""></div>
                    <div class="title">Buscar Cita<span></span></div>
                </a>
            </div>
            <div class="item separator"></div>
            <div class="item">
                <a href="ServeletCerrar">
                    <div class="icon"><img src="img/cerrar.png" alt=""></div>
                    <div class="title">Cerrar sesion<span></span></div>
                </a>
            </div>
        </div>
    </div>

    <script>
        const btn = document.querySelector('#menu-btn');
        const menu = document.querySelector('#sidmenu');
        btn.addEventListener('click', e  =>{    
        menu.classList.toggle("menu-expanded");
        menu.classList.toggle("menu-collapsed");

        document.querySelector('body').classList.toggle('body-expanded');
        } );
    </script>
</body>
</html>
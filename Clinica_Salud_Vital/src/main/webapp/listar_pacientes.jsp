
<%@page import="utils.MysqlDBConexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="beans.PacienteDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CLINICA SALUD - Listado</title>
<style>
 .buscar{
 	display: flex;
 }
 .form{
 	display: flex;
 	padding-left: 740px;
 }
</style>
<link rel="stylesheet" href="css/inicio.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
 rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
 
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
 
 <!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
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

	<%
		List<PacienteDTO> data = (List<PacienteDTO>) request.getAttribute("data");
		String tipo_men = (String) request.getAttribute("tipo_men");
		String mensaje = (String) request.getAttribute("mensaje");
	%>
	
	
	<div class="container">
		<h2 class="text-center">LISTADO DE PACIENTES</h2>
		<hr>
		<div class="container buscar">
		<a href="registrar_pacientes.jsp" class="btn btn-success">Nuevo</a>
	
		</div>	
		<br>
		<% 
			if(tipo_men != null){
		%>
		<div class="alert alert-<%= tipo_men %> alert-dismissible fade show" role="alert">
		  <%= mensaje %>
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
		<% 
			}
		%>
		<table class="table table-striped">
			<thead class="table-dark">
			
				<tr>
					<th class="text-center">CODIGO</th>
					<th>DNI</th>
					<th>NOMBRES</th>
					<th>AP. PATERNO</th>
					<th>AP. MATERNO</th>
					<th>GENERO</th>
					<th>EDAD</th>
					<th>TELEFONO</th>
					<th>DIRECCION</th>
					<th class="text-center" colspan="2">ACCIONES</th>
				</tr>
			</thead>
			<tbody>
				<% 
					if(data != null){
						for(PacienteDTO obj : data){	
				%>
				<tr>
					<td class="text-center"><%= obj.getCodigo() %></td>
					<td><%= obj.getDni() %></td> 
					<td><%= obj.getNombres() %></td>
					<td><%= obj.getApPaterno() %></td>
					<td><%= obj.getApMaterno() %></td>
					<td><%= obj.getGenero().getNombre() %></td>
					<td><%= obj.getEdad() %></td>
					<td><%= obj.getTelefono() %></td>
					<td><%= obj.getDireccion() %></td>

					<td class="text-end">  
						<a class="btn btn-warning btn-sm" href="ServeletPacientes?tipo=buscar&cod=<%= obj.getCodigo() %>"><i class="bi bi-pencil-square"></i></a>
					</td>
					<td class="text-start">
						<a class="btn btn-danger btn-sm" href="ServeletPacientes?tipo=eliminar&cod=<%= obj.getCodigo() %>"><i class="bi bi-trash3"></i></a>
					</td>
				</tr>
				<% 
						}
					}
				%>
			</tbody>
		</table>
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
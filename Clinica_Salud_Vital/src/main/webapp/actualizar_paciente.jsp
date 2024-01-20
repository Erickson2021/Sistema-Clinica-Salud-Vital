<%@page import="beans.PacienteDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CLINICA SALUD - Actualización pacientes</title>
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

    <script>
        const btn = document.querySelector('#menu-btn');
        const menu = document.querySelector('#sidmenu');
        btn.addEventListener('click', e  =>{    
        menu.classList.toggle("menu-expanded");
        menu.classList.toggle("menu-collapsed");

        document.querySelector('body').classList.toggle('body-expanded');
        } );
    </script>
	<% PacienteDTO p = (PacienteDTO) request.getAttribute("paciente"); %>
	<div class="container">
		<h2 class="text-center">ACTUALIZACIÓN DE PACIENTES</h2>
		<hr>
		<div class="row justify-content-center">
			<form action="ServeletPacientes" method="post" class="col-10 col-sm-8 col-md-6 col-xl-4">
			<input type="hidden" name="txt_cod" value="<%= p.getCodigo() %>">
			<div class="mb-3 row">
			     <label for="txt_dni" class="col-sm-4 col-form-label">DOCUMENTO DE IDENTIDAD</label>
			    <div class="col-sm-8">
			      <input type="text"  title="El dni debe ser de 8 dígitos"
			      class="form-control" id="txt_dni" name="txt_dni" required value="<%= p.getDni() %>">
			    </div>
			</div>
			<div class="mb-3 row">
			    <label for="txt_nom" class="col-sm-4 col-form-label">NOMBRES</label>
			    <div class="col-sm-8">
			      <input type="text" pattern="^[A-Za-zÁ-Úá-úÄ-Üä-ü ]{2,20}$" title="El nombre debe ser de 2 a 20 letras"
			      class="form-control" id="txt_nom" name="txt_nom" required value="<%= p.getNombres() %>">
			    </div>
			</div>
			<div class="mb-3 row">
			    <label for="txt_pat" class="col-sm-4 col-form-label">APELLIDO PATERNO</label>
			    <div class="col-sm-8">
			      <input type="text" pattern="^[A-Za-zÁ-Úá-úÄ-Üä-ü ]{2,20}$" title="El Apellido Paterno debe ser de 2 a 20 letras"
			      class="form-control" id="txt_pat" name="txt_pat" required value="<%= p.getApPaterno() %>">
			    </div>
			</div>
			<div class="mb-3 row">
			    <label for="txt_mat" class="col-sm-4 col-form-label">APELLIDO MATERNO</label>
			    <div class="col-sm-8">
			      <input type="text" pattern="^[A-Za-zÁ-Úá-úÄ-Üä-ü ]{2,20}$" title="El Apellido Materno debe ser de 2 a 20 letras"
			      class="form-control" id="txt_mat" name="txt_mat" required value="<%= p.getApMaterno() %>">
			    </div>
			</div>
			<div class="mb-3 row">
			    <label for="cbo_sexo" class="col-sm-4 col-form-label">SEXO</label>
			    <div class="col-sm-8">
			      <select class="form-select" id="cbo_sexo" name="cbo_sexo" required>
			      	<option value>-- Seleccione --</option>
			      </select>
			    </div>
			</div>
			<div class="mb-3 row">
			    <label for="txt_edad" class="col-sm-4 col-form-label">EDAD</label>
			    <div class="col-sm-8">
			      <input type="text" class="form-control" id="txt_edad" name="txt_edad" required value="<%= p.getEdad() %>">
			    </div>
			</div>
			<div class="mb-3 row">
			    <label for="txt_tele" class="col-sm-4 col-form-label">TELÉFONO</label>
			    <div class="col-sm-8">
			      <input type="text" class="form-control" id="txt_tele" name="txt_tele" required value="<%= p.getTelefono() %>">
			    </div>
			</div>
			
			<div class="mb-3 row">
			    <label for="txt_dire" class="col-sm-4 col-form-label">DIRECCIÓN</label>
			    <div class="col-sm-8">
			      <input type="text" class="form-control" id="txt_dire" name="txt_dire" required value="<%= p.getDireccion() %>">
			    </div>
			</div>
			
						
			
			<div class="d-flex justify-content-end">
				<button class="btn btn-success me-2" name="tipo" value="actualizar"><i class="bi bi-person-plus"></i> Actualizar</button>
				<a class="btn btn-warning" href="ServeletPacientes?tipo=listar"><i class="bi bi-arrow-90deg-left"></i> Regresar</a>
			</div>
			</form>
		</div>
	</div>
	
	<script type="text/javascript">
		async function getGeneros(){
			const res = await fetch("ServletCombos?tipo=genero");
			const data = await res.json();
			data.forEach(obj => {
				document.getElementById("cbo_sexo").insertAdjacentHTML("beforeend","<option value='"+obj.codigo+"'>"+obj.nombre+"</option>");
			});
		}
		getGeneros();

	</script>
</body>
</html>
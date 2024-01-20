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
<title>CLINICA SALUD - Registro</title>
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
    
   
	<div class="container">
		<h2 class="text-center">REGISTRO DE DOCTORES</h2>
		<hr>
		<div class="row justify-content-center">
			<form action="ServletEmpleado" method="post" class="col-10 col-sm-8 col-md-6 col-xl-4">
			<div class="mb-3 row">
			    <label for="txt_nom" class="col-sm-4 col-form-label">Nombre</label>
			    <div class="col-sm-8">
			      <input type="text" pattern="^[A-Za-zÁ-Úá-úÄ-Üä-ü ]{2,20}$" title="El nombre debe ser de 2 a 20 letras"
			      class="form-control" id="txt_nom" name="txt_nom" required>
			    </div>
			</div>
			<div class="mb-3 row">
			    <label for="txt_pat" class="col-sm-4 col-form-label">Ap. Paterno</label>
			    <div class="col-sm-8">
			      <input type="text" pattern="^[A-Za-zÁ-Úá-úÄ-Üä-ü ]{2,20}$" title="El Ap. Paterno debe ser de 2 a 20 letras"
			      class="form-control" id="txt_pat" name="txt_pat" required>
			    </div>
			</div>
			<div class="mb-3 row">
			    <label for="txt_mat" class="col-sm-4 col-form-label">Ap. Materno</label>
			    <div class="col-sm-8">
			      <input type="text" pattern="^[A-Za-zÁ-Úá-úÄ-Üä-ü ]{2,20}$" title="El Ap. Materno debe ser de 2 a 20 letras"
			      class="form-control" id="txt_mat" name="txt_mat" required>
			    </div>
			</div>
			<div class="mb-3 row">
			    <label for="txt_cargo" class="col-sm-4 col-form-label">Cargo</label>
			    <div class="col-sm-8">
			      <input type="text" pattern="^[A-Za-zÁ-Úá-úÄ-Üä-ü ]{2,20}$" title="El Cargo debe ser de 2 a 20 letras"
			      class="form-control" id="txt_cargo" name="txt_cargo" required>
			    </div>
			</div>
			<div class="mb-3 row">
			    <label for="txt_cel" class="col-sm-4 col-form-label">Celular</label>
			    <div class="col-sm-8">
			      <input type="text" pattern="^9[0-9]{8}$" maxlength="9" title="El celular debe ser de 9 dígitos y empezar en 9"
			      class="form-control" id="txt_cel" name="txt_cel" required>
			    </div>
			</div>
			<div class="mb-3 row">
			    <label for="cbo_depa" class="col-sm-4 col-form-label">Departamento</label>
			    <div class="col-sm-8">
			      <select class="form-select" id="cbo_depa" name="cbo_depa" required>
			      	<option value>-- Seleccione --</option>
			      </select>
			    </div>
			</div>
			<div class="mb-3 row">
			    <label for="cbo_sede" class="col-sm-4 col-form-label">Sede</label>
			    <div class="col-sm-8">
			      <select class="form-select" id="cbo_sede" name="cbo_sede" required>
			      	<option value>-- Seleccione --</option>
			      </select>
			    </div>
			</div>
			<div class="d-flex justify-content-end">
				<button class="btn btn-success me-2" name="tipo" value="registrar"><i class="bi bi-person-plus"></i> Registrar</button>
				<a class="btn btn-warning" href="ServletEmpleado?tipo=listar"><i class="bi bi-arrow-90deg-left"></i> Listar Doctores</a>
			</div>
			</form>
		</div>
	</div>
	
	<script type="text/javascript">
		async function getDepartamentos(){
			const res = await fetch("ServletCombos?tipo=departamento");
			const data = await res.json();
			data.forEach(obj => {
				document.getElementById("cbo_depa").insertAdjacentHTML("beforeend","<option value='"+obj.codigo+"'>"+obj.nombre+"</option>");
			});
		}
		
		async function getSedes(){
			const res = await fetch("ServletCombos?tipo=sede");
			const data = await res.json();
			data.forEach(obj => {
				document.getElementById("cbo_sede").insertAdjacentHTML("beforeend","<option value='"+obj.codigo+"'>"+obj.nombre+"</option>");
			});
		}
		
		getDepartamentos();
		getSedes();
	</script>
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
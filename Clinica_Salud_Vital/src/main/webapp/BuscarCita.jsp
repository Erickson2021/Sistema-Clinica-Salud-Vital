<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/inicio.css">
<link href="css/fontawesome.css" rel="stylesheet">
<link href="css/styleCita.css" rel="stylesheet">
<!-- CSS only -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body >

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

	<main class="main">
		<div class="login">
			<form  title="Registro Cita">
				<div class="consulta">
					<br>
					<div class="titulos">
						<img alt="" src="img/logoPrincipal.png">
					</div>
					<div class="consultaD">
						<h4 style="text-align: center;">Buscar Cita</h4>
						<br>
						<div class="form-row">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<label for="exampleInputEmail1">Tipo de documento:</label>
								<button type="button" class="btn btn-info">DNI</button>
							</div>
							<div class="form-group col-md-1"></div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<label for="exampleInputEmail1">Número de documento:</label><input
									type="text" value="" name="txtDoc"
									class="form-control" id="InputDoc">
							</div>
							<div class="form-group col-md-1"></div>
						</div>
						<br>
						<div class="form-row">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<button  name="" class="btn btn-dark"
									value="">
									<i class="fas fa-search"></i> Buscar
								</button>
							</div>
							<div class="form-group col-md-1"></div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</main>
</body>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css"
	integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
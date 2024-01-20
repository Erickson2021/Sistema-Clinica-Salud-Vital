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
	#frmBoleta{
		width:50%	;
		margin:auto;	
	}
</style>
<link rel="stylesheet" href="css/cita.css">
    <!-- GOOGLE FONTs -->
    <link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet">
    <!-- FONT AWESOME -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <!-- ANIMATE CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">
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
    <div class="content">
        
            <div class="contact-form">
            
                <form action="ServletCita" method="post" id="frmBoleta">
                <h1 class="logo">CITA<span>S</span></h1>
                <br>
                    <p>
                        <label>PACIENTE</label>
                        <input type="text" id="txt_pac" name="txt_pac" required>
                    </p>
                    <p>
                        <label>MEDICO</label>
                        <input type="text" id="txt_med" name="txt_med" required>
                    </p>
                    <p>
                        <label>FECHA CITA</label>
                        <input type="date" name="fecha" id="fecha">
                        
                    </p>
                    <p>
                        <label>HORA</label>
                        <select class="form-select" id="cbo_hora" name="cbo_hora" required>
			      	<option value>-- Seleccione --</option>
			      </select>
                    </p>
                    <p class="block">
                       <label>Observaciones</label> 
                        <textarea id="texto" name="texto" rows="6" cols="30"></textarea>
                    </p>
                    <p class="block">
                        <button name="tipo" value="registrar">
                            REGISTRAR
                            
                        </button>
                        <input <a class="btn btn-warning" href="ServletCita?tipo=listar"><i class="bi bi-arrow-90deg-left"></i> Listado Cita</a> >
                        <a class="btn btn-warning" href="ServletCita?tipo=listar"><i class="bi bi-arrow-90deg-left"></i> Listado Cita</a>
                    </p>
                </form>
            </div>
    </div>
    <script type="text/javascript">
		async function getCitas(){
			const res = await fetch("ServletCombos?tipo=hora");
			const data = await res.json();
			data.forEach(obj => {
				document.getElementById("cbo_hora").insertAdjacentHTML("beforeend","<option value='"+obj.codigo+"'>"+obj.nombre+"</option>");
			});
		}
		getCitas();

	</script>
</body>
</html>
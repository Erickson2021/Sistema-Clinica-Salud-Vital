package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.UsuarioService;

import java.io.IOException;

import beans.UsuarioDTO;

/**
 * Servlet implementation class ServletUsuario
 */
public class ServletUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UsuarioService usu = new UsuarioService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String opcion = request.getParameter("opcion");
		//IF O SHICH
		if (opcion.equals("log"))
			loguear(request, response);
		else if (opcion.equals("registrar"))
			registrar(request, response);
	}
	protected void post(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		registrar(request, response);
	}

	private void registrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ingreso ce");
		// TODO Auto-generated method stub
		String nombre = request.getParameter("txtnombre").toUpperCase();
		String apellido = request.getParameter("txtapellido").toUpperCase();
		String usuario = request.getParameter("txtusuario").toUpperCase();
		String clave = request.getParameter("txtclave").toUpperCase();

		
		//crear
	
		UsuarioDTO u = new UsuarioDTO();
		
		u.setNombre(nombre);
		u.setApellido(apellido);
		u.setUsuario(usuario);
		u.setClave(clave);

		//iNSTANCIAMOS LA CLASE SERVISE A USAR
		
		
		int res = usu.registrarUsuario(u);
		if (res > 0) {
			request.setAttribute("men", "USUARIO CREADO CON EXITO");
			
			request.getRequestDispatcher("RegistrarUsuario.jsp").forward(request, response);
			
		}
		else {
			request.setAttribute("mensaje", "ERROR AL CREAR EL USUARO");
			request.getRequestDispatcher("RegistrarUsuario.jsp").forward(request, response);
		}
	}

	private void loguear(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("ingreso correctamente");
		
		String usuario, clave;
		//CAPTURAMOS LOS DATOS ENVIADOS DEL FORMULARIO
		usuario = request.getParameter("txtcorreo");
		clave = request.getParameter("txtclave");
		
		System.out.println("txtcorreo :"+ usuario + "clave");
		
		//ENVIAR INFORMACION AL USUARIO --> EN UNA PAGINA EXISTENTE
		
		//Usuario u = new GestionDeUsuario().iniciarSesion(usuario, clave);
		UsuarioDTO u = new UsuarioService().iniciarSesion(usuario, clave);
		//
		if (u !=null) {
			System.out.println("Id sesion : " + request.getSession().getId());
			request.getSession().setAttribute("usu", u);
			request.getRequestDispatcher("inicio.jsp").forward(request, response);
			
		}else {
			request.setAttribute("mensaje", "USUARIO O CLAVE INCORRECTO");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		
		
		
		

}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	

}

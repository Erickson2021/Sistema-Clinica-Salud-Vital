package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.CitaService;

import java.io.IOException;

import beans.CitasDTO;

/**
 * Servlet implementation class ServletCita
 */
public class ServletCita extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CitaService serviCita = new CitaService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCita() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String tipo = request.getParameter("tipo");
		if (tipo.equals("listar"))
			listar(request, response);
		else if (tipo.equals("registrar"))
			registrar(request, response);
		else if (tipo.equals("eliminar"))
			eliminar(request, response);
	}

	private void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		int cod = Integer.parseInt(request.getParameter("cod"));
		int res = serviCita.EliminarCita(cod);
		if (res > 0) {
			request.setAttribute("tipo_men", "success");
			request.setAttribute("mensaje", "La cita se elimino correctamente.");
		}
		else {
			request.setAttribute("tipo_men", "danger");
			request.setAttribute("mensaje", "Ocurri� un error en la eliminaci�n.");
		}
		listar(request, response);
	
	}

	private void registrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String nom_pac = request.getParameter("txt_pac").toUpperCase();
		String nom_med = request.getParameter("txt_med").toUpperCase();
		String obser = request.getParameter("texto").toUpperCase();
		String fecha = request.getParameter("fecha").toUpperCase();
		int cod_hora = Integer.parseInt(request.getParameter("cbo_hora"));
		CitasDTO obj = new CitasDTO();
		obj.setNom_pac(nom_pac);
		obj.setNom_med(nom_med);
		obj.setObser(obser);
		obj.setFecha(fecha);
		obj.getHora().setCodigo(cod_hora);
		int res = serviCita.registrarCita(obj);
		if (res > 0) {
			request.setAttribute("men", "USUARIO CREADO CON EXITO");
			request.getRequestDispatcher("registrarCita.jsp").forward(request, response);
		}
		else {
			request.setAttribute("tipo_men", "danger");
			request.setAttribute("mensaje", "Ocurri� un error en el registro.");
		}
		
	
	}

	private void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setAttribute("data", serviCita.listarCitas());
		request.getRequestDispatcher("litar_citas.jsp").forward(request, response);
	
	}

}

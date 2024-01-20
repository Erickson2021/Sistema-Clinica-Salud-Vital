package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.PacienteService;

import java.io.IOException;

import beans.PacienteDTO;

/**
 * Servlet implementation class ServeletPacientes
 */
public class ServeletPacientes extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PacienteService serviPaciente = new PacienteService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServeletPacientes() {
        super();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String tipo = request.getParameter("tipo");
		if (tipo.equals("listar"))
			listar(request, response);
		else if (tipo.equals("buscar"))
			buscar(request, response);
		else if (tipo.equals("regis"))
			registrar(request, response);
		else if (tipo.equals("actualizar"))
			actualizar(request, response);
		else if (tipo.equals("eliminar"))
			eliminar(request, response);
	}
	/*protected void post(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		registrar(request, response);
		listar(request, response);
		buscar(request, response);
		actualizar(request, response);
	}*/
	private void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		
				int cod = Integer.parseInt(request.getParameter("cod"));
				int res = serviPaciente.EliminarPaciente(cod);
				if (res > 0) {
					request.setAttribute("tipo_men", "success");
					request.setAttribute("mensaje", "Los datos del Paciente se eliminaron correctamente.");
				}
				else {
					request.setAttribute("tipo_men", "danger");
					request.setAttribute("mensaje", "Ocurri� un error en la eliminaci�n.");
				}
				listar(request, response);
	
		
	}

	private void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				System.out.println("ingreso ce");
				int cod = Integer.parseInt(request.getParameter("txt_cod"));
				
				String dni = request.getParameter("txt_dni").toUpperCase();
				String nombres = request.getParameter("txt_nom").toUpperCase();
				String apPaterno = request.getParameter("txt_pat").toUpperCase();
				String apMaterno = request.getParameter("txt_mat").toUpperCase();
				int cod_gene = Integer.parseInt(request.getParameter("cbo_sexo"));
				String edad = request.getParameter("txt_edad").toUpperCase();
				String telefono = request.getParameter("txt_tele");
				String direccion = request.getParameter("txt_dire");
				PacienteDTO obj = new PacienteDTO();
				obj.setCodigo(cod);
				obj.setDni(dni);
				obj.setNombres(nombres); 
				obj.setApPaterno(apPaterno);
				obj.setApMaterno(apMaterno);
				obj.getGenero().setCodigo(cod_gene);
				obj.setEdad(edad);
				obj.setTelefono(telefono);
				obj.setDireccion(direccion);
				int res = serviPaciente.actualizarPaciente(obj);
				if (res > 0) {
					request.setAttribute("tipo_men", "success");
					request.setAttribute("mensaje", "Los datos del Paciente " + obj.getNombres() + " " + obj.getApPaterno() + " se actualizaron correctamente.");
				}
				else {
					request.setAttribute("tipo_men", "danger");
					request.setAttribute("mensaje", "Ocurri� un error en la actualizaci�n.");
				}
				listar(request, response);
	
	}

	private void buscar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cod = Integer.parseInt(request.getParameter("cod"));
		request.setAttribute("paciente", serviPaciente.buscarPaciente(cod));
		request.getRequestDispatcher("actualizar_paciente.jsp").forward(request, response);
		
	}

	private void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("data", serviPaciente.listarPacientes());
		request.getRequestDispatcher("listar_pacientes.jsp").forward(request, response);
		
	}

	private void registrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("ingreso ce");
		String dni = request.getParameter("txt_dni").toUpperCase();
		String nombres = request.getParameter("txt_nom").toUpperCase();
		String apPaterno = request.getParameter("txt_pat").toUpperCase();
		String apMaterno = request.getParameter("txt_mat").toUpperCase();
		int cod_gene = Integer.parseInt(request.getParameter("cbo_sexo"));
		String edad = request.getParameter("txt_edad").toUpperCase();
		String telefono = request.getParameter("txt_tele");
		String direccion = request.getParameter("txt_dire");
		PacienteDTO obj = new PacienteDTO();
		obj.setDni(dni);
		obj.setNombres(nombres); 
		obj.setApPaterno(apPaterno);
		obj.setApMaterno(apMaterno);
		obj.getGenero().setCodigo(cod_gene);
		obj.setEdad(edad);
		obj.setTelefono(telefono);
		obj.setDireccion(direccion);
	
		int res = serviPaciente.registrarPaciente(obj);
		if (res > 0) {
			request.setAttribute("tipo_men", "success");
			request.setAttribute("mensaje", "Los datos del Paciente " + obj.getNombres() + " " + obj.getApPaterno() + " se registraron correctamente.");
		}
		else {
			request.setAttribute("tipo_men", "danger");
			request.setAttribute("mensaje", "Ocurri� un error en el registro.");
		}
		listar(request, response);
	
		
	}
	

}

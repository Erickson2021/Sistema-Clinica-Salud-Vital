package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.EmpleadoService;

import java.io.IOException;

import beans.EmpleadoDTO;

/**
 * Servlet implementation class ServletEmpleado
 */
public class ServletEmpleado extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EmpleadoService serviEmpleado = new EmpleadoService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletEmpleado() {
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
		else if (tipo.equals("buscar"))
			buscar(request, response);
		else if (tipo.equals("registrar"))
			registrar(request, response);
		else if (tipo.equals("actualizar"))
			actualizar(request, response);
		else if (tipo.equals("eliminar"))
			eliminar(request, response);
	}
	
	protected void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("data", serviEmpleado.listarEmpleados());
		request.getRequestDispatcher("listar_empleados.jsp").forward(request, response);
	}
	
	protected void registrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombre = request.getParameter("txt_nom").toUpperCase();
		String apPaterno = request.getParameter("txt_pat").toUpperCase();
		String apMaterno = request.getParameter("txt_mat").toUpperCase();
		String cargo = request.getParameter("txt_cargo").toUpperCase();
		String celular = request.getParameter("txt_cel");
		int cod_depa = Integer.parseInt(request.getParameter("cbo_depa"));
		int cod_sede = Integer.parseInt(request.getParameter("cbo_sede"));
		EmpleadoDTO obj = new EmpleadoDTO();
		obj.setNombre(nombre);
		obj.setApPaterno(apPaterno);
		obj.setApMaterno(apMaterno);
		obj.setCargo(cargo);
		obj.setCelular(celular);
		obj.getDepartamento().setCodigo(cod_depa);
		obj.getSede().setCodigo(cod_sede);
		int res = serviEmpleado.registrarEmpleado(obj);
		if (res > 0) {
			request.setAttribute("tipo_men", "success");
			request.setAttribute("mensaje", "Los datos del Empleado " + obj.getNombre() + " " + obj.getApPaterno() + " se registraron correctamente.");
		}
		else {
			request.setAttribute("tipo_men", "danger");
			request.setAttribute("mensaje", "Ocurrió un error en el registro.");
		}
		listar(request, response);
	}
	
	protected void buscar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cod = Integer.parseInt(request.getParameter("cod"));
		request.setAttribute("empleado", serviEmpleado.buscarEmpleado(cod));
		request.getRequestDispatcher("actualizar_empleado.jsp").forward(request, response);
	}
	
	protected void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cod = Integer.parseInt(request.getParameter("txt_cod"));
		String nombre = request.getParameter("txt_nom").toUpperCase();
		String apPaterno = request.getParameter("txt_pat").toUpperCase();
		String apMaterno = request.getParameter("txt_mat").toUpperCase();
		String cargo = request.getParameter("txt_cargo").toUpperCase();
		String celular = request.getParameter("txt_cel");
		int cod_depa = Integer.parseInt(request.getParameter("cbo_depa"));
		int cod_sede = Integer.parseInt(request.getParameter("cbo_sede"));
		EmpleadoDTO obj = new EmpleadoDTO();
		obj.setCodigo(cod);
		obj.setNombre(nombre);
		obj.setApPaterno(apPaterno);
		obj.setApMaterno(apMaterno);
		obj.setCargo(cargo);
		obj.setCelular(celular);
		obj.getDepartamento().setCodigo(cod_depa);
		obj.getSede().setCodigo(cod_sede);
		int res = serviEmpleado.actualizarEmpleado(obj);
		if (res > 0) {
			request.setAttribute("tipo_men", "success");
			request.setAttribute("mensaje", "Los datos del Empleado " + obj.getNombre() + " " + obj.getApPaterno() + " se actualizaron correctamente.");
		}
		else {
			request.setAttribute("tipo_men", "danger");
			request.setAttribute("mensaje", "Ocurrió un error en la actualización.");
		}
		listar(request, response);
	}
	
	protected void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cod = Integer.parseInt(request.getParameter("cod"));
		int res = serviEmpleado.EliminarEmpleado(cod);
		if (res > 0) {
			request.setAttribute("tipo_men", "success");
			request.setAttribute("mensaje", "Los datos del Empleado se eliminaron correctamente.");
		}
		else {
			request.setAttribute("tipo_men", "danger");
			request.setAttribute("mensaje", "Ocurrió un error en la eliminación.");
		}
		listar(request, response);
	}

}

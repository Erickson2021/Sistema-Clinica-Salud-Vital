package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.DepartamentoService;
import services.SedeService;
import services.GeneroService;
import services.HoraService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;

import beans.DepartamentoDTO;
import beans.SedeDTO;
import beans.GeneroDTO;
import beans.HoraDTO;

/**
 * Servlet implementation class ServletCombos
 */
public class ServletCombos extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DepartamentoService serviDepartamento = new DepartamentoService();
	private SedeService serviSede = new SedeService();
	private GeneroService serviGenero = new GeneroService();
	private HoraService serviHora = new HoraService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCombos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		String tipo = request.getParameter("tipo");
		if(tipo.equals("departamento"))
			comboDepartamento(request,response);
		else if(tipo.equals("sede"))
			comboSede(request,response);
		else if(tipo.equals("genero"))
			comboGenero(request,response);
		else if(tipo.equals("hora"))
			comboHora(request,response);
	}
	
	private void comboHora(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<HoraDTO> data = serviHora.listarHoras();
		Gson gson = new Gson();
		String json = gson.toJson(data);
		PrintWriter out = response.getWriter();
		out.println(json);
		
	}

	protected void comboDepartamento(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<DepartamentoDTO> data = serviDepartamento.listarDepartamentos();
		Gson gson = new Gson();
		String json = gson.toJson(data);
		PrintWriter out = response.getWriter();
		out.println(json);
	}
	
	protected void comboSede(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<SedeDTO> data = serviSede.listarSedes();
		Gson gson = new Gson();
		String json = gson.toJson(data);
		PrintWriter out = response.getWriter();
		out.println(json);
	}
	protected void comboGenero(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<GeneroDTO> data = serviGenero.listarGeneros();
		Gson gson = new Gson();
		String json = gson.toJson(data);
		PrintWriter out = response.getWriter();
		out.println(json);
	}

}

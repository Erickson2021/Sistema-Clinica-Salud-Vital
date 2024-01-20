package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import beans.UsuarioDTO;

/**
 * Servlet implementation class ServeletCerrar
 */
public class ServeletCerrar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("serrando secion ID: " + request.getSession().getId());
		UsuarioDTO u = (UsuarioDTO) request.getSession().getAttribute("usu");
		request.getSession().invalidate();
		request.getRequestDispatcher("login.jsp").forward(request, response);
		
	}

}

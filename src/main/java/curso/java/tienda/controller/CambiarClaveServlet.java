package curso.java.tienda.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import curso.java.tienda.model.VO.UsuarioVO;
import curso.java.tienda.service.OperacionesUsuario;

/**
 * Servlet implementation class CambiarClaveServlet
 */
@WebServlet("/CambiarClaveServlet")
public class CambiarClaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CambiarClaveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("view/cambiarClave.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		UsuarioVO u = (UsuarioVO) session.getAttribute("usuario");
		
		
		if (OperacionesUsuario.compararClaves(request.getParameter("claveActual"), u.getClave())) {
			if (request.getParameter("claveNueva").equals(request.getParameter("claveNuevaRepetida"))) {
			    OperacionesUsuario.cambiarClave(request.getParameter("claveNueva"), u.getEmail());
			}
		}
		
		request.getRequestDispatcher("view/cambiarClave.jsp").forward(request, response);
		
	}

}

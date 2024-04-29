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
 * Servlet implementation class PerfilServlet
 */
@WebServlet("/PerfilServlet")
public class PerfilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PerfilServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("view/perfil.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		UsuarioVO u = (UsuarioVO) session.getAttribute("usuario");
		
				
		OperacionesUsuario.editarUsuario(request.getParameter("nombre"), request.getParameter("apellido1"), request.getParameter("apellido2"), 
				request.getParameter("direccion"), request.getParameter("dni"), u.getEmail(), request.getParameter("localidad"), request.getParameter("provincia"),
				request.getParameter("telefono"));
		
		UsuarioVO usuarioCompleto = OperacionesUsuario.recuperarUsuario(u.getEmail());
		session.setAttribute("usuario", usuarioCompleto);
		
		request.getRequestDispatcher("view/perfil.jsp").forward(request, response);
	}

}

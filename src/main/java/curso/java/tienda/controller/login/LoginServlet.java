package curso.java.tienda.controller.login;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import curso.java.tienda.model.DAO.UsuarioDAO;
import curso.java.tienda.model.VO.UsuarioVO;



@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static Logger log = Logger.getLogger(LoginServlet.class);
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("view/login.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
		
		
			UsuarioVO user = UsuarioDAO.verificarCredenciales(request.getParameter("email"), request.getParameter("clave"));

			if (user != null) {
				HttpSession sessionLogin = request.getSession(true);
				sessionLogin.setAttribute("usuario", user);

				log.info("El usuario "+ user.getEmail()+" inició sesión.");
				request.getRequestDispatcher("").forward(request, response);

				
			} else {
				HttpSession sessionLogin = request.getSession(false);
				sessionLogin.setAttribute("error", "Error de credenciales.");
                request.getRequestDispatcher("view/login.jsp").forward(request, response);
			}
		

	}
}

package curso.java.tienda.controller;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.apache.log4j.Logger;

import curso.java.tienda.model.DAO.UsuarioDAO;
import curso.java.tienda.model.VO.UsuarioVO;



@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final Logger log = Logger.getLogger(LoginServlet.class);
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("view/login.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
		
		
			UsuarioVO user = UsuarioDAO.verificarCredenciales(request.getParameter("email"), request.getParameter("clave"));

			if (user != null) {
				if (user.getFecha_baja() == null) {
					HttpSession sessionLogin = request.getSession(true);
					sessionLogin.setAttribute("usuario", user);

					log.info("El usuario "+ user.getEmail()+" inició sesión.");
					response.sendRedirect(request.getContextPath());
				} else {
					request.setAttribute("error", "ERROR: Contacte con el administrador.");
	                request.getRequestDispatcher("view/login.jsp").forward(request, response);
				}
							
			} else {
				request.setAttribute("error", "Error de credenciales.");
                request.getRequestDispatcher("view/login.jsp").forward(request, response);
			}
		

	}
}

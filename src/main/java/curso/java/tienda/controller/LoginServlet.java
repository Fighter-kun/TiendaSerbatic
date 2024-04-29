package curso.java.tienda.controller;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import curso.java.tienda.model.DAO.UsuarioDAO;
import curso.java.tienda.model.VO.UsuarioVO;
import curso.java.tienda.service.OperacionesUsuario;



@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
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

				request.getRequestDispatcher("").forward(request, response);

				
			} else {
				HttpSession sessionLogin = request.getSession(false);
				sessionLogin.setAttribute("error", "Error de credenciales.");
                request.getRequestDispatcher("view/login.jsp").forward(request, response);
			}
		

	}
}

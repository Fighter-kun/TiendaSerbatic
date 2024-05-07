package curso.java.tienda.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import curso.java.tienda.model.DAO.UsuarioDAO;
import curso.java.tienda.model.VO.UsuarioVO;
import curso.java.tienda.service.OperacionesUsuario;
import org.apache.log4j.Logger;

@WebServlet("/RegistroServlet")
public class RegistroServlet extends HttpServlet {
    private static final Logger log = Logger.getLogger(LoginServlet.class);

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    String confirmPassword = request.getParameter("confirm-password");

	    String emailError = null;
	    String passwordError = null;
	    String confirmPasswordError = null;

	    // Validar campos y establecer mensajes de error
	    if (!OperacionesUsuario.comprobarVacios(email, password, confirmPassword)) {
	        emailError = "Introduce todos los campos";
	    } else if (!OperacionesUsuario.validarEmail(email)) {
	        emailError = "El email es incorrecto";
	    } else if (!OperacionesUsuario.validarClaves(password, confirmPassword)) {
	        passwordError = "Las claves no son las mismas";
	        confirmPasswordError = "Las claves no son las mismas";
	    } else if (UsuarioDAO.verificarCredenciales(email, password) != null) {
	    	emailError = "Este email ya esta registrado";
	    }
	    
	    

	    // Si hay errores, enviarlos de vuelta al formulario
	    if (emailError != null || passwordError != null || confirmPasswordError != null) {
	        request.setAttribute("emailError", emailError);
	        request.setAttribute("passwordError", passwordError);
	        request.setAttribute("confirmPasswordError", confirmPasswordError);
	        request.getRequestDispatcher("view/login.jsp").forward(request, response);
	        return;
	    }

	    // Si no hay errores, continuar con el registro
	    UsuarioVO user = UsuarioDAO.añadirUsuario(email, OperacionesUsuario.encriptarClave(password));
	    if (user != null) {
	        HttpSession sessionLogin = request.getSession(true);
	        sessionLogin.setAttribute("usuario", user);
                log.info("El usuario "+ user.getEmail()+" se registro.");
		response.sendRedirect(request.getContextPath());
	    } else {
	        // Si hay un error al añadir el usuario, mostrar un mensaje de error
	        request.setAttribute("error", "Error al registrar el usuario");
	        request.getRequestDispatcher("view/login.jsp").forward(request, response);
	    }
	}

}

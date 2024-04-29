package curso.java.tienda.controller;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SeleccionIdioma
 */
@WebServlet("/SeleccionIdioma")
public class SeleccionIdioma extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SeleccionIdioma() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idioma = request.getParameter("idioma");

        if (idioma != null) {
        	Locale locale = new Locale(idioma);
        	
        	ResourceBundle messages = ResourceBundle.getBundle("language/messages", locale);

            request.setAttribute("messages", messages);

            request.getRequestDispatcher("").forward(request, response);
        } else {
        	Locale locale = new Locale("es");
        	
        	ResourceBundle messages = ResourceBundle.getBundle("language/messages", locale);

            request.setAttribute("messages", messages);

            request.getRequestDispatcher("").forward(request, response);
        }
        
    }

}

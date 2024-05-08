package curso.java.tienda.controller;

import java.io.IOException;
import java.util.Locale;

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

        if ("es".equals(idioma)) {
			request.getSession().setAttribute("locale", new Locale("es"));
		} else if ("en".equals(idioma)) {
			request.getSession().setAttribute("locale", new Locale("en"));
		} else {
			request.getSession().setAttribute("locale", request.getLocale());
		}        
        
        request.getRequestDispatcher("").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
        String idioma = request.getParameter("idioma");

        if ("es".equals(idioma)) {
			request.getSession().setAttribute("locale", new Locale("es"));
		} else if ("en".equals(idioma)) {
			request.getSession().setAttribute("locale", new Locale("en"));
		} else {
			request.getSession().setAttribute("locale", request.getLocale());
		}        
        
        request.getRequestDispatcher("").forward(request, response);
    }

}

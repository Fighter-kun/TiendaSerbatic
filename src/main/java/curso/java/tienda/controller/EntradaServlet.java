package curso.java.tienda.controller;

import curso.java.tienda.model.DAO.ProductoDAO;
import curso.java.tienda.model.VO.ProductoVO;
import curso.java.tienda.service.OperacionesProducto;

import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class EntradaServlet
 */
@WebServlet("")
public class EntradaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EntradaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Si todo ha ido bien creo el carrito
		if(request.getSession().getAttribute("carrito") == null) {
			request.getSession().setAttribute("carrito", new HashMap<ProductoVO, Integer>());
		}
		
		request.setAttribute("catalogo", OperacionesProducto.findAll());
		
		if (request.getParameter("idioma") == null) {
			// Idioma 'es' por defecto
			request.getSession().setAttribute("locale", new Locale("es"));     
		}
		
		request.getRequestDispatcher("view/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("orden") != null) {
			request.setAttribute("catalogo", OperacionesProducto.buscarPorFiltro(request.getParameter("orden")));
		    
			if (request.getParameter("idioma") == null) {
				request.getSession().setAttribute("locale", new Locale("es"));
			}
	        
		    request.getRequestDispatcher("view/index.jsp").forward(request, response);
		}
	}

}

package curso.java.tienda.controller;

import curso.java.tienda.model.DAO.ProductoDAO;
import curso.java.tienda.model.VO.ProductoVO;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ComprarServlet
 */
@WebServlet("/AñadirProductoServlet")
public class AñadirProductoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public AñadirProductoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("id") != null) {
            HttpSession session = request.getSession();
            String id = request.getParameter("id");

            HashMap<ProductoVO, Integer> carrito = (HashMap<ProductoVO, Integer>) session.getAttribute("carrito");

            if (carrito == null) {
                carrito = new HashMap<>();
                session.setAttribute("carrito", carrito);
            }

            Integer cantidad = carrito.getOrDefault(ProductoDAO.findById(Integer.parseInt(id)), 0);
            
            ProductoVO producto = ProductoDAO.findById(Integer.parseInt(id));

            if (cantidad < producto.getStock()) {
            	carrito.put(ProductoDAO.findById(Integer.parseInt(id)), cantidad + 1);
            }

        }

        response.sendRedirect(request.getContextPath());
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("id") != null && request.getParameter("ud") != null) {
            HttpSession session = request.getSession();
            String id = request.getParameter("id");
            String ud = request.getParameter("ud");

            HashMap<ProductoVO, Integer> carrito = (HashMap<ProductoVO, Integer>) session.getAttribute("carrito");

            if (carrito == null) {
                carrito = new HashMap<>();
                session.setAttribute("carrito", carrito);
            }

            Integer cantidad = carrito.getOrDefault(ProductoDAO.findById(Integer.parseInt(id)), 0);
            
            ProductoVO producto = ProductoDAO.findById(Integer.parseInt(id));

            if (cantidad < producto.getStock()) {
            	carrito.put(ProductoDAO.findById(Integer.parseInt(id)), cantidad + Integer.parseInt(ud));
            }

        }

        response.sendRedirect(request.getContextPath());
    }

}

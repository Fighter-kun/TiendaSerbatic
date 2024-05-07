package curso.java.tienda.controller;

import curso.java.tienda.model.DAO.ProductoDAO;
import curso.java.tienda.model.VO.ProductoVO;
import java.io.IOException;
import java.util.Base64;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Carlos
 */
@WebServlet("/DetalleProductoServlet")
public class DetalleProductoServlet extends HttpServlet {

    public DetalleProductoServlet() {
    }

    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("id") != null) {
            String id = request.getParameter("id"); 
            
            ProductoVO productoSeleccionado = ProductoDAO.findById(Integer.parseInt(id));
            
            if (productoSeleccionado != null) {
                request.setAttribute("imagen", productoSeleccionado.getImagen());
                request.setAttribute("nombre", productoSeleccionado.getNombre());
                request.setAttribute("precio", productoSeleccionado.getPrecio());
                request.setAttribute("categoria", productoSeleccionado.getId_categoria());
                request.setAttribute("id", productoSeleccionado.getId());
                request.setAttribute("stock", productoSeleccionado.getStock());
                request.setAttribute("descripcion", productoSeleccionado.getDescripcion());

                String imagenBase64 = Base64.getEncoder().encodeToString(productoSeleccionado.getImagen());

                request.setAttribute("imagen", imagenBase64);

                request.getRequestDispatcher("view/detalleProducto.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath());
            }
            
        } else {
            response.sendRedirect(request.getContextPath());
        }
        
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
        
    }

}

package curso.java.tienda.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import curso.java.tienda.model.VO.ProductoVO;

@WebServlet("/EliminarProductoServlet")
public class EliminarProductoServlet extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String productoId = request.getParameter("productoId");

        HashMap<ProductoVO, Integer> carrito = (HashMap<ProductoVO, Integer>) request.getSession().getAttribute("carrito");

        if (carrito != null) {
            ProductoVO productoEliminar = null;
            for (ProductoVO producto : carrito.keySet()) {
            	if (String.valueOf(producto.getId()).equals(productoId)) {
                    productoEliminar = producto;
                    break;
                }
            }
            if (productoEliminar != null) {
                carrito.remove(productoEliminar);
                request.getSession().setAttribute("carrito", carrito);
            }
        }

        // Redirigir de vuelta al carrito
        response.sendRedirect("view/carrito.jsp");
    }
}

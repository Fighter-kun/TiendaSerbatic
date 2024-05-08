package curso.java.tienda.controller;

import curso.java.tienda.model.VO.ProductoVO;
import curso.java.tienda.service.OperacionesProducto;

import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EntradaServlet
 */
@WebServlet("")
public class EntradaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Si todo ha ido bien creo el carrito
        if (request.getSession().getAttribute("carrito") == null) {
            request.getSession().setAttribute("carrito", new HashMap<ProductoVO, Integer>());
        }

        request.setAttribute("catalogo", OperacionesProducto.findAll());

        Locale localePorDefecto = (Locale) request.getSession().getAttribute("locale");
        if (localePorDefecto == null) {
            // Establecer el idioma 'es' por defecto si no está presente
            request.getSession().setAttribute("locale", new Locale("es"));
        }

        request.getRequestDispatcher("view/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("orden") != null) {
            request.setAttribute("catalogo", OperacionesProducto.buscarPorFiltro(request.getParameter("orden")));

            Locale localePorDefecto = (Locale) request.getSession().getAttribute("locale");
            if (localePorDefecto == null) {
                // Establecer el idioma 'es' por defecto si no está presente
                request.getSession().setAttribute("locale", new Locale("es"));
            }

            request.getRequestDispatcher("view/index.jsp").forward(request, response);
        }
    }

}

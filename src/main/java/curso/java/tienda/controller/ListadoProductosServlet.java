package curso.java.tienda.controller;

import curso.java.tienda.service.OperacionesProducto;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ListadoProductosServlet")
public class ListadoProductosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("catalogo", OperacionesProducto.buscarPorFiltro("fecha_alta"));
        request.getRequestDispatcher("view/listadoProductos.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setAttribute("catalogo", OperacionesProducto.buscarPorFiltro(request.getParameter("orden")));
        request.getRequestDispatcher("view/listadoProductos.jsp").forward(request, response);
        
        
    }


}

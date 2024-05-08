package curso.java.tienda.controller;

import curso.java.tienda.model.VO.DetallePedidoVO;
import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import curso.java.tienda.model.VO.PedidoVO;
import curso.java.tienda.model.VO.UsuarioVO;
import curso.java.tienda.service.OperacionesPedidos;
import curso.java.tienda.service.OperacionesProducto;
import curso.java.tienda.service.OperacionesUsuario;
import java.io.PrintWriter;

/**
 * Servlet implementation class HistorialPedidosServlet
 */
@WebServlet("/HistorialPedidosServlet")
public class HistorialPedidosServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public HistorialPedidosServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        UsuarioVO user = (UsuarioVO) session.getAttribute("usuario");
        List<PedidoVO> listadoPedidos = OperacionesUsuario.listarPedidosUsuario(user.getId(),"descendente");

        if (listadoPedidos != null && request.getParameter("idPedido") == null) {
            request.setAttribute("listadoPedidos", listadoPedidos);
            request.getRequestDispatcher("view/historialPedidos.jsp").forward(request, response);
        }

        if (request.getParameter("idPedido") != null) {
            List<DetallePedidoVO> listadoLineasPedido = OperacionesUsuario.listarLineasPedidoUsuario(Integer.parseInt(request.getParameter("idPedido")));
            // Establecer el tipo de contenido de la respuesta como HTML
            response.setContentType("text/html");

            // Obtener el PrintWriter para escribir la respuesta
            PrintWriter out = response.getWriter();

            // Escribir los detalles del pedido en formato HTML
            out.println("<table class='table table-bordered'>");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th class='text-center'>Nº. Pedido</th>");
            out.println("<th class='text-center'>Nº. Producto</th>");
            out.println("<th class='text-center'>Cantidad</th>");
            out.println("<th class='text-center'>Precio Unitario</th>");
            out.println("<th class='text-center'>Impuesto</th>");
            out.println("<th class='text-center'>Total</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");

            for (DetallePedidoVO detalle : listadoLineasPedido) {
                out.println("<tr>");
                out.println("<td class='text-center'>" + detalle.getIdPedido() + "</td>");
                out.println("<td class='text-center'>" + detalle.getIdProducto() + "</td>");
                out.println("<td class='text-center'>" + detalle.getUnidades() + "</td>");
                out.println("<td class='text-center'>" + detalle.getPrecioUnidad() + "</td>");
                out.println("<td class='text-center'>" + (detalle.getImpuesto()*100) + " %</td>");
                out.println("<td class='text-center'>" + detalle.getTotal() + "</td>");
                if (OperacionesPedidos.obtenerEstadoPedido(Integer.parseInt(request.getParameter("idPedido"))).equals("PE")) {
                	out.println("<td class='text-center'><a href='CancelarLineaPedidoServlet?id=" + detalle.getId() + "'>X</a></td>");
                }
                out.println("</tr>");
            }

            out.println("</tbody>");
            out.println("</table>");

            // Cerrar el PrintWriter
            out.close();

            request.getRequestDispatcher("view/historialPedidos.jsp").forward(request, response);
        }

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	if (request.getParameter("orden") != null) {
    		HttpSession session = request.getSession(false);
            UsuarioVO user = (UsuarioVO) session.getAttribute("usuario");
            List<PedidoVO> listadoPedidos = OperacionesUsuario.listarPedidosUsuario(user.getId(),request.getParameter("orden"));

            if (listadoPedidos != null && request.getParameter("idPedido") == null) {
                request.setAttribute("listadoPedidos", listadoPedidos);
                request.getRequestDispatcher("view/historialPedidos.jsp").forward(request, response);
            }         
            
		}
    }

}

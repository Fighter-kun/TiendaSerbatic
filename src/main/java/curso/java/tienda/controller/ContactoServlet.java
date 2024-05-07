package curso.java.tienda.controller;

import curso.java.tienda.model.VO.UsuarioVO;
import curso.java.tienda.service.EnviarCorreo;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ContactoServlet")
public class ContactoServlet extends HttpServlet {

   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        UsuarioVO usuario = (UsuarioVO) session.getAttribute("usuario");
        if (usuario != null) {
            request.setAttribute("nombre", usuario.getNombre());
            request.setAttribute("email", usuario.getEmail());
            request.setAttribute("numero", usuario.getTelefono());
        }
        request.getRequestDispatcher("view/contacto.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (EnviarCorreo.enviarCorreo(request.getParameter("name"), request.getParameter("email"), 
                request.getParameter("number"), request.getParameter("message"), request.getParameter("subject"))) {
                request.setAttribute("mensajeConfirmacion", "El correo electrónico se envió correctamente.");
                request.getRequestDispatcher("view/contacto.jsp").forward(request, response);
        } else {
            request.setAttribute("mensajeConfirmacion", "Error al enviar el correo electrónico. Por favor, inténtalo de nuevo.");
            request.getRequestDispatcher("view/contacto.jsp").forward(request, response);
        }
    
    }
    
}

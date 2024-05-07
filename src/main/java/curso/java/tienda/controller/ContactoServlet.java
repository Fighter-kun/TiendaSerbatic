package curso.java.tienda.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@WebServlet("/ContactoServlet")
public class ContactoServlet extends HttpServlet {

   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/contacto.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // Obtener los parámetros del formulario
    String nombre = request.getParameter("name");
    String email = request.getParameter("email");
    String numero = request.getParameter("number");
    String asunto = request.getParameter("subject");
    String mensajeTexto = request.getParameter("message");

    String destinatario = "carlos.daw2@gmail.com"; // CORREO "EMPRESARIAL"

    try {
        // Propiedades de la conexión
        Properties prop = new Properties();
        // Configuración del servidor SMTP
        prop.setProperty("mail.smtp.host", "smtp-mail.outlook.com");
        prop.setProperty("mail.smtp.starttls.enable", "true");
        prop.setProperty("mail.smtp.port", "587");
        prop.setProperty("mail.smtp.user", "tienda-online-curso@outlook.com");
        prop.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");

        // Crear una sesión
        Session sesion = Session.getDefaultInstance(prop);

        // Crear un mensaje
        MimeMessage mensaje = new MimeMessage(sesion);
        mensaje.setFrom(new InternetAddress("tienda-online-curso@outlook.com"));
        mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));
        mensaje.setSubject(asunto);
        mensaje.setText("Nombre: " + nombre + "\n" +
                        "Email: " + email + "\n" +
                        "Número: " + numero + "\n" +
                        "Mensaje: " + mensajeTexto);

        // Crear un objeto Transport para enviar el mensaje
        Transport t = sesion.getTransport("smtp");
        t.connect("tienda-online-curso@outlook.com", "CursoJava2024");
        t.sendMessage(mensaje, mensaje.getAllRecipients());
        t.close();

        // Redirigir a una página de confirmación
        request.getRequestDispatcher("view/contacto.jsp").forward(request, response);
        System.out.println("MENSAJE ENVIADO");

    } catch (AddressException ex) {
        Logger.getLogger(ContactoServlet.class.getName()).log(Level.SEVERE, null, ex);
    } catch (MessagingException ex) {
        Logger.getLogger(ContactoServlet.class.getName()).log(Level.SEVERE, null, ex);
    }
}
    
}

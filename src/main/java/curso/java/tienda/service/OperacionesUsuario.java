package curso.java.tienda.service;

import java.sql.SQLException;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import curso.java.tienda.model.DAO.PedidoDAO;
import curso.java.tienda.model.DAO.DetallePedidoDAO;
import curso.java.tienda.model.DAO.UsuarioDAO;
import curso.java.tienda.model.VO.DetallePedidoVO;
import curso.java.tienda.model.VO.PedidoVO;
import curso.java.tienda.model.VO.UsuarioVO;
import lombok.NoArgsConstructor;

@NoArgsConstructor
public class OperacionesUsuario {

    public static boolean validarClave(String email, String contrasena) {
        if (UsuarioDAO.verificarCredenciales(email, contrasena) != null) {
            return true;
        }
        return false;
    }

    public static void cerrarSesion(HttpSession sessionUsuario) {
        sessionUsuario.setAttribute("usuario", null);
    }

    public static UsuarioVO recuperarUsuario(String email) {
        return UsuarioDAO.recuperarUsuario(email);
    }

    public static UsuarioVO editarUsuario(String nombre, String apellido1, String apellido2, String direccion,
            String dni, String email, String localidad, String provincia, String telefono) {
        try {
            return UsuarioDAO.editarUsuario(nombre, apellido1, apellido2, direccion, dni, email, localidad, provincia, telefono);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;

    }

    public static boolean agregarDatosEnvio(String nombre, String apellido1, String apellido2, String direccion, String dni, String localidad, String provincia,
            String telefono, String email) {
        try {
            UsuarioDAO.agregarDatosEnvio(nombre, apellido1, apellido2, direccion, dni, localidad, provincia, telefono, email);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return true;

    }

    public static String encriptarClave(String clave) {
        String claveEncriptada;

        // Generar hash de contraseña
        claveEncriptada = BCrypt.hashpw(clave, BCrypt.gensalt());

        return claveEncriptada;
    }

    public static boolean compararClaves(String clave, String claveEncriptada) {
        if (BCrypt.checkpw(clave, claveEncriptada)) {
            return true;
        }
        return false;

    }

    public static boolean cambiarClave(String nuevaClave, String email) {
        String nuevaClaveCodificada = encriptarClave(nuevaClave);
        return UsuarioDAO.cambiarClave(nuevaClaveCodificada, email);
    }

    // Método para validar el formulario
    public static boolean comprobarVacios(String email, String clave, String claveRepetida) {
        if (email == null || email.trim().isEmpty() || clave == null || clave.trim().isEmpty() || claveRepetida == null
                || claveRepetida.trim().isEmpty()) {
            return false; // Campos vacíos
        }
        return true; // Todo validado correctamente
    }

    // Método para validar el formato del email con una expresión regular
    public static boolean validarEmail(String email) {
        String regex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        Pattern pattern = Pattern.compile(regex);
        return pattern.matcher(email).matches();
    }

    public static boolean validarClaves(String clave, String claveRepetida) {
        // Validar que las claves sean iguales
        if (!clave.equals(claveRepetida)) {
            return false;
        }

        return true;

    }

    public static List<PedidoVO> listarPedidosUsuario(int id_usuario) {
        return PedidoDAO.listarPedidosUsuario(id_usuario);
    }

    public static List<DetallePedidoVO> listarLineasPedidoUsuario(int id_pedido) {
        return DetallePedidoDAO.listarLineasPedidosUsuario(id_pedido);
    }

}

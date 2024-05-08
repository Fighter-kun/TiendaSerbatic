package curso.java.tienda.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import curso.java.tienda.model.VO.UsuarioVO;
import curso.java.tienda.service.OperacionesUsuario;
import curso.java.tienda.util.Conexion;

public class UsuarioDAO {

	public static UsuarioVO verificarCredenciales(String email, String contrasena) {
    PreparedStatement statement = null;
    ResultSet resultSet = null;
    UsuarioVO usuario = null;

    try {
        Connection con = Conexion.getConexion();
        String query = "SELECT * FROM usuarios WHERE email = ?";
        statement = con.prepareStatement(query);
        statement.setString(1, email);
        resultSet = statement.executeQuery();

        if (resultSet.next()) {
            if (OperacionesUsuario.compararClaves(contrasena, resultSet.getString("clave"))) {
                int idRol = resultSet.getInt("id_rol");
                // Verificar si el id_rol es igual a 1
                if (idRol == 1) {
                    usuario = new UsuarioVO();
                    usuario.setId(resultSet.getInt("id"));
                    usuario.setId_rol(idRol);
                    usuario.setEmail(resultSet.getString("email"));
                    usuario.setClave(resultSet.getString("clave"));
                    usuario.setNombre(resultSet.getString("nombre"));
                    usuario.setApellido1(resultSet.getString("apellido1"));
                    usuario.setApellido2(resultSet.getString("apellido2"));
                    usuario.setDireccion(resultSet.getString("direccion"));
                    usuario.setProvincia(resultSet.getString("provincia"));
                    usuario.setLocalidad(resultSet.getString("localidad"));
                    usuario.setTelefono(resultSet.getString("telefono"));
                    usuario.setDni(resultSet.getString("dni"));
                    usuario.setFecha_baja(resultSet.getDate("fecha_baja"));
                } else {
                    // Si el id_rol no es igual a 1, devolver null
                    usuario = null;
                }
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return usuario;
}


	public static UsuarioVO añadirUsuario(String email, String clave) {
		UsuarioVO nuevoUsuario = null;

		try {
			Connection con = Conexion.getConexion();
			String sql = "INSERT INTO usuarios (email, clave) VALUES (?, ?)";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, email);
			stmt.setString(2, clave);

			int filasInsertadas = stmt.executeUpdate();
			if (filasInsertadas > 0) {
				nuevoUsuario = new UsuarioVO(email, clave);
			} else {
				return null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return nuevoUsuario;
	}
	
	public static void agregarDatosEnvio(String nombre, String apellido1, String apellido2, String direccion, String dni, String localidad, String provincia,
			String telefono, String email) throws SQLException {

		String sql = "UPDATE usuarios SET nombre = ?, apellido1 = ?, apellido2 = ?, direccion = ?, dni = ?, localidad = ?, provincia = ?, telefono = ? WHERE email = ?";
		Connection conn = Conexion.getConexion();
		PreparedStatement stmt = null;

		try {
			stmt = conn.prepareStatement(sql);

			stmt.setString(1, nombre);
			stmt.setString(2, apellido1);
			stmt.setString(3, apellido2);
			stmt.setString(4, direccion);
			stmt.setString(5, dni);
			stmt.setString(6, localidad);
			stmt.setString(7, provincia);
			stmt.setString(8, telefono);
			stmt.setString(9, email);

			// Ejecutar la consulta
			stmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}

	public static UsuarioVO editarUsuario(String nombre, String apellido1, String apellido2, String direccion, String dni,
			String email, String localidad, String provincia, String telefono) throws SQLException {

		String sql = "UPDATE usuarios SET nombre = ?, apellido1 = ?, apellido2 = ?, direccion = ?, dni = ?, localidad = ?, provincia = ?, telefono = ?  WHERE email = ?";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = Conexion.getConexion();
			stmt = conn.prepareStatement(sql);

			stmt.setString(1, nombre);
			stmt.setString(2, apellido1);
			stmt.setString(3, apellido2);
			stmt.setString(4, direccion);
			stmt.setString(5, dni);
			stmt.setString(6, localidad);
			stmt.setString(7, provincia);
			stmt.setString(8, telefono);
			stmt.setString(9, email);

			if (stmt.executeUpdate() > 0) {
				// Consultar los datos actualizados del usuario
				String selectSql = "SELECT * FROM usuarios WHERE email = ?";
				PreparedStatement selectStmt = conn.prepareStatement(selectSql);
				selectStmt.setString(1, email);
				rs = selectStmt.executeQuery();
				
				if (rs.next()) {
					int id = rs.getInt("id");
					int id_rol = rs.getInt("id_rol");
					String nombreDB = rs.getString("nombre");
					String apellido1DB = rs.getString("apellido1");
					String apellido2DB = rs.getString("apellido2");
					String direccionDB = rs.getString("direccion");
					String provinciaDB = rs.getString("provincia");
					String localidadDB = rs.getString("localidad");
					String telefonoDB = rs.getString("telefono");
					String dniDB = rs.getString("dni");
					
					// Crear y devolver un nuevo objeto UsuarioVO con los datos actualizados
					return new UsuarioVO(id, id_rol, email, nombreDB, apellido1DB, apellido2DB, direccionDB, provinciaDB, localidadDB, telefonoDB, dniDB);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null; // Si no se pudo actualizar el usuario, devolver null
	}

	
	public static UsuarioVO recuperarUsuario(String email) {
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		UsuarioVO usuario = null;

		try {
			Connection con = Conexion.getConexion();
			String query = "SELECT * FROM usuarios WHERE email = ?";
			statement = con.prepareStatement(query);
			statement.setString(1, email);
			resultSet = statement.executeQuery();

			if (resultSet.next()) {
				usuario = new UsuarioVO();
				usuario.setId(resultSet.getInt("id"));
				usuario.setId_rol(resultSet.getInt("id_rol"));
				usuario.setEmail(resultSet.getString("email"));
				usuario.setClave(resultSet.getString("clave"));
				usuario.setNombre(resultSet.getString("nombre"));
				usuario.setApellido1(resultSet.getString("apellido1"));
				usuario.setApellido2(resultSet.getString("apellido2"));
				usuario.setDireccion(resultSet.getString("direccion"));
				usuario.setProvincia(resultSet.getString("provincia"));
				usuario.setLocalidad(resultSet.getString("localidad"));
				usuario.setTelefono(resultSet.getString("telefono"));
				usuario.setDni(resultSet.getString("dni"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return usuario;
	}
	
	public static boolean cambiarClave(String clave, String email) {
		String sql = "UPDATE usuarios SET clave = ?  WHERE email = ?";
		Connection conn = Conexion.getConexion();
		PreparedStatement stmt = null;

		try {
			stmt = conn.prepareStatement(sql);

			stmt.setString(1, clave);
			stmt.setString(2, email);

			if (stmt.executeUpdate() > 0) {
				return true;
			} else {
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}

}
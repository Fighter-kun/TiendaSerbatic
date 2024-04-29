package curso.java.tienda.model.VO;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class UsuarioVO {

	private int id;
	private int id_rol;
	private String email;
	private String clave;
	private String nombre;
	private String apellido1;
	private String apellido2;
	private String direccion;
	private String provincia;
	private String localidad;
	private String telefono;
	private String dni;
	
	public UsuarioVO(int id, int id_rol, String email, String nombre, String apellido1, String apellido2,
			String direccion, String provincia, String localidad, String telefono, String dni) {
		super();
		this.id = id;
		this.id_rol = id_rol;
		this.email = email;
		this.nombre = nombre;
		this.apellido1 = apellido1;
		this.apellido2 = apellido2;
		this.direccion = direccion;
		this.provincia = provincia;
		this.localidad = localidad;
		this.telefono = telefono;
		this.dni = dni;
	}

	public UsuarioVO(String email, String clave) {
		super();
		this.email = email;
		this.clave = clave;
	}
	
	
	
	
}

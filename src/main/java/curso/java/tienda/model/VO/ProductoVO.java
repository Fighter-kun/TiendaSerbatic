package curso.java.tienda.model.VO;

import java.sql.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ProductoVO {
	
    private int id;
    private int id_categoria;
    private String nombre;
    private String descripcion;
    private double precio;
    private int stock;
    private Timestamp fecha_alta;
    private Timestamp fecha_baja;
    private float impuesto;
    private byte[] imagen;
}

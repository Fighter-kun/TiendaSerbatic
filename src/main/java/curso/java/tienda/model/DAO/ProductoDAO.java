package curso.java.tienda.model.DAO;

import curso.java.tienda.model.VO.ProductoVO;
import curso.java.tienda.util.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ProductoDAO {
    public static List<ProductoVO> findAll() {
        List<ProductoVO> lista = new ArrayList<>();

        try {
            Connection con = Conexion.getConexion();
            PreparedStatement st = con.prepareStatement("SELECT * FROM productos");

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                ProductoVO producto = new ProductoVO(
                    rs.getInt("id"),
                    rs.getInt("id_categoria"),
                    rs.getString("nombre"),
                    rs.getString("descripcion"),
                    rs.getDouble("precio"),
                    rs.getInt("stock"),
                    rs.getTimestamp("fecha_alta"),
                    rs.getTimestamp("fecha_baja"),
                    rs.getFloat("impuesto"),
                    rs.getString("imagen")
                );
                lista.add(producto);
            }

            rs.close();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }
    
    public static List<ProductoVO> buscarPorFiltro(String orderBy) {
        List<ProductoVO> lista = new ArrayList<>();

        try {
            Connection con = Conexion.getConexion();
            String query = "SELECT * FROM productos";

            switch (orderBy) {
                case "precio_asc":
                    query += " ORDER BY precio ASC";
                    break;
                case "precio_desc":
                    query += " ORDER BY precio DESC";
                    break;
                case "fecha_alta":
                    query += " ORDER BY fecha_alta ASC";
                    break;
            }

            PreparedStatement st = con.prepareStatement(query);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                ProductoVO producto = new ProductoVO(
                    rs.getInt("id"),
                    rs.getInt("id_categoria"),
                    rs.getString("nombre"),
                    rs.getString("descripcion"),
                    rs.getDouble("precio"),
                    rs.getInt("stock"),
                    rs.getTimestamp("fecha_alta"),
                    rs.getTimestamp("fecha_baja"),
                    rs.getFloat("impuesto"),
                    rs.getString("imagen")
                );
                lista.add(producto);
            }

            rs.close();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }


	public static ProductoVO findById(int id) {
	    ProductoVO producto = null;

	    try {
	        Connection con = Conexion.getConexion();
	        PreparedStatement st = con.prepareStatement("SELECT * FROM productos WHERE id = ?");
	        st.setInt(1, id);
	        ResultSet rs = st.executeQuery();

	        if (rs.next()) {
	            producto = new ProductoVO();
	            producto.setId(rs.getInt("id"));
	            producto.setId_categoria(rs.getInt("id_categoria"));
	            producto.setNombre(rs.getString("nombre"));
	            producto.setDescripcion(rs.getString("descripcion"));
	            producto.setPrecio(rs.getDouble("precio"));
	            producto.setStock(rs.getInt("stock"));
	            producto.setFecha_alta(rs.getTimestamp("fecha_alta"));
	            producto.setImpuesto(rs.getFloat("impuesto"));
	            producto.setImagen(rs.getString("imagen"));
                producto.setFecha_baja(rs.getTimestamp("fecha_baja"));

	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return producto;
	}

	public static int comprobarStock(int id) {
		try {
	        Connection con = Conexion.getConexion();
	        PreparedStatement st = con.prepareStatement("SELECT * FROM productos WHERE id = ?");
	        st.setInt(1, id);
	        ResultSet rs = st.executeQuery();

	        if (rs.next()) {
	            return rs.getInt("stock");

	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
		
		return -1;
	}

	public static void actualizarStock(int idProducto, int cantidadComprada) {
		Connection con = Conexion.getConexion();
        try {
            String sql = "UPDATE productos SET stock = stock - ? WHERE id = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setInt(1, cantidadComprada);
            stmt.setInt(2, idProducto);
            
            int filasActualizadas = stmt.executeUpdate();
            if (filasActualizadas == 0) {
                System.out.println("No se encontró ningún producto con el ID proporcionado.");
            } else {
                System.out.println("Stock actualizado correctamente.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

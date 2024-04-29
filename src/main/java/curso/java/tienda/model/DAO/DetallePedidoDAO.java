package curso.java.tienda.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import curso.java.tienda.model.VO.DetallePedidoVO;
import curso.java.tienda.model.VO.PedidoVO;
import curso.java.tienda.util.Conexion;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DetallePedidoDAO {
	public static void rellenarDetallePedido(List<DetallePedidoVO> detalles) {
		try {
			Connection con = Conexion.getConexion();
			String query = "INSERT INTO detalles_pedido (id_pedido, id_producto, precio_unidad, unidades, impuesto, total) "
					+ "VALUES (?, ?, ?, ?, ?, ?)";
			PreparedStatement st = con.prepareStatement(query);

			for (DetallePedidoVO detalle : detalles) {
				st.setInt(1, detalle.getIdPedido());
				st.setInt(2, detalle.getIdProducto());
				st.setDouble(3, detalle.getPrecioUnidad());
				st.setDouble(4, detalle.getUnidades());
				st.setDouble(5, detalle.getImpuesto());
				st.setDouble(6, detalle.getTotal());

				st.executeUpdate();
			}

			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
        
        public static List<DetallePedidoVO> listarLineasPedidosUsuario(int id_pedido) { 
            List<DetallePedidoVO> lineas = new ArrayList<>();
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
            conn = Conexion.getConexion();
            String sql = "SELECT * FROM detalles_pedido WHERE id_pedido = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id_pedido);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                int idPedido = rs.getInt("id_pedido");
                int idProducto = rs.getInt("id_producto");
                double precioUnidad = rs.getDouble("precio_unidad");
                int unidades = rs.getInt("unidades");
                float impuesto = rs.getFloat("impuesto");
                double total = rs.getDouble("total");

                // Crear un objeto DetallePedidoVO y agregarlo a la lista
                DetallePedidoVO detallePedido = new DetallePedidoVO(id, idPedido, idProducto, precioUnidad, unidades, impuesto, total);
                lineas.add(detallePedido);
            }
            } catch (SQLException e) {
                e.printStackTrace();
            } 

        return lineas;
    }
}

package curso.java.tienda.model.DAO;

import curso.java.tienda.model.VO.PedidoVO;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import curso.java.tienda.util.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PedidoDAO {
    public static void realizarPedido(PedidoVO pedido) {
        try {
            Connection con = Conexion.getConexion();
            String query = "INSERT INTO pedidos (id_usuario, metodo_pago, num_factura, total) " +
                           "VALUES (?, ?, ?, ?)";
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, pedido.getIdUsuario());
            st.setString(2, pedido.getMetodoPago());
            st.setString(3, pedido.getNumFactura());
            st.setDouble(4, pedido.getTotal());

            int filasInsertadas = st.executeUpdate();
            if (filasInsertadas > 0) {
                System.out.println("Pedido realizado correctamente.");
            } else {
                System.out.println("Error al realizar el pedido.");
            }

            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static String asignarNumFactura(int idUsuario) {

        int numFactura = 0;
        
        try {
            Connection con = Conexion.getConexion();
            PreparedStatement st = con.prepareStatement("SELECT COUNT(*) FROM pedidos");
            
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                numFactura = rs.getInt(1);
            }
            
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return "FA" + (numFactura + 1) + "-US" + idUsuario;
    }
    
    /**
    * Busca y devuelve el último pedido realizado por un usuario identificado por su ID.
    *
    * @param idUsuario El ID del usuario para el cual se desea buscar el último pedido.
    * @return El último pedido realizado por el usuario, o null si no se encontró ningún pedido.
    */
    public static PedidoVO buscarUltimoPedidoPorUsuario(int id_usuario) {
    PedidoVO pedido = null;

    try {
        Connection con = Conexion.getConexion();
        PreparedStatement st = con.prepareStatement("SELECT * FROM pedidos WHERE id_usuario = ? ORDER BY fecha DESC LIMIT 1");
        st.setInt(1, id_usuario);

        ResultSet rs = st.executeQuery();
        
        if (rs.next()) {
            int idPedido = rs.getInt("id");
            Timestamp fecha = rs.getTimestamp("fecha");
            String metodoPago = rs.getString("metodo_pago");
            String estado = rs.getString("estado");
            String numFactura = rs.getString("num_factura");
            double total = rs.getDouble("total");

            pedido = new PedidoVO(idPedido, id_usuario, fecha, metodoPago, estado, numFactura, total);
        }

        rs.close();
        st.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return pedido;
}

    
    public static List<PedidoVO> listarPedidosUsuario(int id_usuario) {
        List<PedidoVO> pedidos = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = Conexion.getConexion();
            String sql = "SELECT * FROM pedidos WHERE id_usuario = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id_usuario);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                Timestamp fecha = rs.getTimestamp("fecha");
                String metodoPago = rs.getString("metodo_Pago");
                String estado = rs.getString("estado");
                String numFactura = rs.getString("num_Factura");
                double total = rs.getDouble("total");

                
                PedidoVO pedido = new PedidoVO(id, id_usuario, fecha, metodoPago, estado, numFactura, total);
                pedidos.add(pedido);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } 

        return pedidos;
    }

}

package curso.java.tienda.service;

import curso.java.tienda.model.DAO.DetallePedidoDAO;
import curso.java.tienda.model.DAO.PedidoDAO;

public class OperacionesPedidos {
	 public static void cancelarPedido(int id) { 
		 PedidoDAO.cancelarPedido(id);
	 }
	 
	 public static String obtenerEstadoPedido(int idPedido) { 
		 return PedidoDAO.obtenerEstadoPedido(idPedido);
	 }

	 public static void eliminarLineaPedido(int ip_lineaPedido) { 
		 DetallePedidoDAO.eliminarLineaPedido(ip_lineaPedido);
	 }
}

package curso.java.tienda.service;

import curso.java.tienda.model.DAO.PedidoDAO;

public class OperacionesPedidos {
	 public static void cancelarPedido(int id) { 
		 PedidoDAO.cancelarPedido(id);
	 }
}

package curso.java.tienda.service;

import java.util.List;

import curso.java.tienda.model.DAO.ProductoDAO;
import curso.java.tienda.model.VO.ProductoVO;

public class OperacionesProducto {

	public static List<ProductoVO> buscarPorFiltro(String orderBy) { 
		return ProductoDAO.buscarPorFiltro(orderBy);
	}
}

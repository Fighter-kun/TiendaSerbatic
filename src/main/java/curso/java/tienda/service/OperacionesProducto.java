package curso.java.tienda.service;

import java.util.List;

import curso.java.tienda.model.DAO.ProductoDAO;
import curso.java.tienda.model.VO.ProductoVO;

public class OperacionesProducto {

	public static List<ProductoVO> buscarPorFiltro(String orderBy) { 
		return ProductoDAO.buscarPorFiltro(orderBy);
	}
        
        public static List<ProductoVO> buscarPorFiltro(String orderBy, int idCategoria) {
            return ProductoDAO.buscarPorFiltro(orderBy, idCategoria);
        }
        
        public static List<ProductoVO> findAll() { 
            return ProductoDAO.findAll();
        }
}

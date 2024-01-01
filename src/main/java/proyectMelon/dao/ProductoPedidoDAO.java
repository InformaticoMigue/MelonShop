package proyectMelon.dao;

import proyectMelon.model.ProductoPedido;

import java.util.List;

public interface ProductoPedidoDAO {
    public List<ProductoPedido> findAll(int pkPedido);
}

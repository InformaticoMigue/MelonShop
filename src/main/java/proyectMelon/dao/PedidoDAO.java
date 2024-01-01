package proyectMelon.dao;

import proyectMelon.model.Pedido;

import java.util.List;

public interface PedidoDAO {
    public void guardarPedido(Pedido p);
    public List<Pedido> getALL();
    public List<Pedido> getAllByUser(int idUser);
    public void delete(int idPedido);
}

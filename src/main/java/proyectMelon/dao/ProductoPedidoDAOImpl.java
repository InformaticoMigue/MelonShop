package proyectMelon.dao;

import proyectMelon.model.Producto;
import proyectMelon.model.ProductoPedido;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductoPedidoDAOImpl extends AbstractDAOImpl implements ProductoPedidoDAO{
    @Override
    public List<ProductoPedido> findAll(int pkPedido) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<ProductoPedido> productosPedido = new ArrayList<>();
        ProductoDAOImpl pDAO = new ProductoDAOImpl();

        try {
            conn = connectDB();
            ps = conn.prepareStatement("SELECT * FROM productos_pedido WHERE id_pedido = ?");
            ps.setInt(1, pkPedido);
            rs = ps.executeQuery();

            while (rs.next()) {
                int index = 1;

                ProductoPedido productoPedido = new ProductoPedido();

                index++;
                productoPedido.setIdPedido(pkPedido);

                Producto producto = pDAO.find(rs.getInt(index++)).get();
                productoPedido.setProducto(producto);

                productoPedido.setCantidad(rs.getInt(index++));

                productosPedido.add(productoPedido);
            }

        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }finally {
            closeDb(conn,ps,rs);
        }
        return productosPedido;
    }
}

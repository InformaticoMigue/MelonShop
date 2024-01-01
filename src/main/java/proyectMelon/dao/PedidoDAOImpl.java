package proyectMelon.dao;

import proyectMelon.model.Pedido;
import proyectMelon.model.ProductoPedido;
import proyectMelon.model.Usuario;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PedidoDAOImpl extends AbstractDAOImpl implements PedidoDAO {
    @Override
    public void guardarPedido(Pedido p) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rsGenKeys = null;

        try {
            conn = connectDB();

            ps = conn.prepareStatement("INSERT INTO pedidos (id_usuario,fecha_pedido,total_pedido) VALUES(?,?,?)", Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, p.getUsuario().getId());
            ps.setDate(2,p.getFechaPedido());
            ps.setBigDecimal(3,p.getTotalPedido());

            ps.executeUpdate();

            rsGenKeys = ps.getGeneratedKeys();

            if (rsGenKeys.next())
                p.setId(rsGenKeys.getInt(1));

            List<ProductoPedido> productoPedidos = p.getProductos();

            for (ProductoPedido productoPedido : productoPedidos){
                ps = conn.prepareStatement("INSERT INTO productos_pedido (id_pedido,id_producto,cantidad) values (?,?,?)");

                ps.setInt(1,p.getId());
                ps.setInt(2,productoPedido.getProducto().getId());
                ps.setInt(3,productoPedido.getCantidad());

                ps.executeUpdate();
            }

        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }finally {
            closeDb(conn,ps,rsGenKeys);
        }

    }

    @Override
    public List<Pedido> getALL() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Pedido> pedidos = new ArrayList<>();
        UsuarioDAOImpl usuDAO = new UsuarioDAOImpl();
        ProductoPedidoDAOImpl prpeDAO = new ProductoPedidoDAOImpl();

        try {
            conn = connectDB();

            ps = conn.prepareStatement("SELECT * FROM pedidos");
            rs = ps.executeQuery();

            while (rs.next()) {
                int index = 1;

                Pedido pedido = new Pedido();
                pedido.setId(rs.getInt(index++));

                Usuario usuarioPedido = usuDAO.find(rs.getInt(index++)).get();
                pedido.setUsuario(usuarioPedido);
                pedido.setFechaPedido(rs.getDate(index++));
                pedido.setTotalPedido(rs.getBigDecimal(index++));

                //Añadimos a la lista del pedido todos los productos que hay
                pedido.setProductos(prpeDAO.findAll(pedido.getId()));

                pedidos.add(pedido);
            }

        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }finally {
            closeDb(conn,ps,rs);
        }
        return pedidos;
    }

    @Override
    public List<Pedido> getAllByUser(int idUser) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Pedido> pedidos = new ArrayList<>();
        UsuarioDAOImpl usuDAO = new UsuarioDAOImpl();

        try {
            conn = connectDB();

            ps = conn.prepareStatement("SELECT * FROM pedidos WHERE id_usuario = ?");
            ps.setInt(1,idUser);

            rs = ps.executeQuery();

            while (rs.next()) {
                int index = 1;
                Pedido pedido = new Pedido();
                pedido.setId(rs.getInt(index++));
                pedido.setUsuario(usuDAO.find(rs.getInt(index++)).get());
                pedido.setFechaPedido(rs.getDate(index++));
                pedido.setTotalPedido(rs.getBigDecimal(index++));

                pedidos.add(pedido);
            }

        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }finally {
            closeDb(conn,ps,rs);
        }
        return pedidos;
    }

    @Override
    public void delete(int idPedido) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = connectDB();
            ps = conn.prepareStatement("DELETE FROM pedidos where id_pedido = ?");
            ps.setInt(1,idPedido);
            ps.executeUpdate();

        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }finally {
            closeDb(conn,ps,rs);
        }
    }
}

package proyectMelon.dao;

import proyectMelon.model.Categoria;
import proyectMelon.model.Producto;
import proyectMelon.model.Usuario;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class ProductoDAOImpl extends AbstractDAOImpl implements ProductoDAO{
    @Override
    public void create(Producto p) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rsGenKeys = null;

        try {
            conn = connectDB();
            ps = conn.prepareStatement("INSERT INTO productos (nombre_producto,precio,id_categoria,descripcion,stock) VALUES (?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);

            CategoriaDAOImpl catDAO = new CategoriaDAOImpl();
            int id = 0;
            Optional<Categoria> cat = catDAO.findByName(p.getCat());

            if (cat.isPresent()){
                id = cat.get().getId();
            }

            int idx = 1;
            ps.setString(idx++, p.getNombre());
            ps.setDouble(idx++, p.getPrecio());
            ps.setInt(idx++, id);
            ps.setString(idx++, p.getDescripcion());
            ps.setInt(idx++, p.getStock());

            ps.executeUpdate();

            rsGenKeys = ps.getGeneratedKeys();

            if (rsGenKeys.next())
                p.setId(rsGenKeys.getInt(1));

        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }finally {
            closeDb(conn,ps,rsGenKeys);
        }
    }

    @Override
    public List<Producto> getAll() {
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        List<Producto> products = new ArrayList<>();

        try {
            conn = connectDB();

            st = conn.createStatement();

            rs = st.executeQuery("SELECT * FROM productos");

            while (rs.next()) {
                Producto p = new Producto();
                int index = 1;

                p.setId(rs.getInt(index++));
                p.setNombre(rs.getString(index++));
                p.setPrecio(rs.getDouble(index++));
                p.setCat(String.valueOf(rs.getInt(index++)));
                p.setDescripcion(rs.getString(index++));
                p.setStock(rs.getInt(index++));

                products.add(p);
            }

        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        } finally {
            closeDb(conn,st,rs);
        }
        return products;
    }

    @Override
    public void update(Producto p) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = connectDB();

            ps = conn.prepareStatement("UPDATE productos set nombre_producto = ?, precio = ?, id_categoria = ?, descripcion = ?, stock = ? WHERE id_producto = ?");

            ps.setString(1,p.getNombre());
            ps.setDouble(2,p.getPrecio());
            ps.setString(3,p.getCat());
            ps.setString(4,p.getDescripcion());
            ps.setInt(5,p.getStock());
            ps.setInt(6,p.getId());


            ps.executeUpdate();

        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }finally {
            closeDb(conn,ps,rs);
        }
    }

    @Override
    public void delete(int pk) {
         Connection conn = null;
         PreparedStatement ps = null;
         ResultSet rs = null;

         try {
            conn = connectDB();
            ps = conn.prepareStatement("DELETE FROM productos WHERE id_producto = ?");
            ps.setInt(1, pk);

            ps.executeUpdate();
         } catch (ClassNotFoundException | SQLException e) {
                throw new RuntimeException(e);
         }finally {
                closeDb(conn,ps,rs);
            }
        }

    @Override
    public Optional<Producto> find(int pk) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Optional<Producto> producto = Optional.empty();

        try {
            conn = connectDB();

            ps = conn.prepareStatement("SELECT * FROM productos WHERE id_producto = ?");

            ps.setInt(1, pk);
            rs = ps.executeQuery();

            if (rs.next()) {
                int index = 1;
                Producto p = new Producto();
                p.setId(rs.getInt(index++));
                p.setNombre(rs.getString(index++));
                p.setPrecio(rs.getDouble(index++));
                p.setCat(rs.getString(index++));
                p.setDescripcion(rs.getString(index++));
                p.setStock(rs.getInt(index++));
                producto = Optional.of(p);
            }

        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }finally {
            closeDb(conn,ps,rs);
        }
        return producto;
    }
}

package proyectMelon.dao;

import proyectMelon.model.Categoria;
import proyectMelon.model.Producto;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class CategoriaDAOImpl extends AbstractDAOImpl implements CategoriaDAO{

    @Override
    public void create(Categoria c) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rsGenKeys = null;

        try {
            conn = connectDB();
            ps = conn.prepareStatement("INSERT INTO categorias (nombre_categoria) VALUES (?)", Statement.RETURN_GENERATED_KEYS);


            int idx = 1;
            ps.setString(idx++, c.getNombre());

            ps.executeUpdate();

            rsGenKeys = ps.getGeneratedKeys();

            if (rsGenKeys.next())
                c.setId(rsGenKeys.getInt(1));

        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }finally {
            closeDb(conn,ps,rsGenKeys);
        }
    }

    @Override
    public void delete(int pk) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = connectDB();
            ps = conn.prepareStatement("DELETE FROM categorias WHERE id_categoria = ?");
            ps.setInt(1, pk);

            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }finally {
            closeDb(conn,ps,rs);
        }
    }

    @Override
    public List<Categoria> getAll() {
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        List<Categoria> categorias = new ArrayList<>();

        try {
            conn = connectDB();

            st = conn.createStatement();

            rs = st.executeQuery("SELECT * FROM categorias");

            while (rs.next()) {
                Categoria c = new Categoria();
                int index = 1;

                c.setId(rs.getInt(index++));
                c.setNombre(rs.getString(index++));
                categorias.add(c);
            }

        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        } finally {
            closeDb(conn,st,rs);
        }
        return categorias;
    }

    @Override
    public Optional<Categoria> find(int pk) {
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        Optional<Categoria> categoria = Optional.empty();

        try {
            conn = connectDB();

            ps = conn.prepareStatement("SELECT * FROM categorias WHERE id_categoria = ?");
            ps.setInt(1,pk);

            rs = ps.executeQuery();

            if (rs.next()) {
                Categoria cat = new Categoria();
                cat.setId(rs.getInt(1));
                cat.setNombre(rs.getString(2));
                categoria = Optional.of(cat);
            }

        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }finally {
            closeDb(conn,ps,rs);
        }

        return categoria;
    }


    public Optional<Categoria> findByName(String name) {
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        Optional<Categoria> categoria = Optional.empty();

        try {
            conn = connectDB();

            ps = conn.prepareStatement("SELECT * FROM categorias WHERE nombre_categoria = ?");
            ps.setString(1,name);

            rs = ps.executeQuery();

            if (rs.next()) {
                Categoria cat = new Categoria();
                cat.setId(rs.getInt(1));
                cat.setNombre(rs.getString(2));
                categoria = Optional.of(cat);
            }

        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }finally {
            closeDb(conn,ps,rs);
        }

        return categoria;
    }

    @Override
    public void update(Categoria cat) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = connectDB();
            ps = conn.prepareStatement("UPDATE categorias SET nombre_categoria = ? WHERE id_categoria = ?");

            ps.setString(1,cat.getNombre());
            ps.setInt(2,cat.getId());


            ps.executeUpdate();

        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }finally {
            closeDb(conn,ps,rs);
        }
    }
}

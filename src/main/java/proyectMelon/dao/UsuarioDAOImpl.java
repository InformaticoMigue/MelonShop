package proyectMelon.dao;

import proyectMelon.model.Usuario;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class UsuarioDAOImpl extends AbstractDAOImpl implements UsuarioDAO{
    @Override
    public void create(Usuario u) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rsGenKeys = null;

        try {
            conn = connectDB();
            ps = conn.prepareStatement("INSERT INTO usuarios (email,username,nombre,apellidos,rol,password) VALUES (?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);

            int idx = 1;
            ps.setString(idx++, u.getEmail());
            ps.setString(idx++, u.getUsername());
            ps.setString(idx++, u.getNombre());
            ps.setString(idx++, u.getApellidos());
            ps.setString(idx++, u.getRol());
            ps.setString(idx++, u.getPassword());

            ps.executeUpdate();

            rsGenKeys = ps.getGeneratedKeys();

            if (rsGenKeys.next())
                u.setId(rsGenKeys.getInt(1));

    } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }finally {
            closeDb(conn,ps,rsGenKeys);
        }
    }



    public Optional<Usuario> exists(Usuario u){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Optional<Usuario> opUS = Optional.empty();

        try {
            conn = connectDB();

            ps = conn.prepareStatement("SELECT * FROM usuarios WHERE email = ? and password = ?");

            ps.setString(1, u.getEmail());
            ps.setString(2, u.getPassword());

            rs = ps.executeQuery();

            if (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt(1));
                usuario.setEmail(rs.getString(2));
                usuario.setUsername(rs.getString(3));
                usuario.setNombre(rs.getString(4));
                usuario.setApellidos(rs.getString(5));
                usuario.setRol(rs.getString(6));
                usuario.setPassword(rs.getString(7));
                opUS = Optional.of(usuario);
            }

        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }finally {
            closeDb(conn,ps,rs);
        }

        return opUS;
    }

    @Override
    public void delete(int pk) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = connectDB();
            ps = conn.prepareStatement("DELETE FROM usuarios WHERE id_usuario = ?");
            ps.setInt(1, pk);

            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }finally {
            closeDb(conn,ps,rs);
        }
    }

    @Override
    public List<Usuario> getALL() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Usuario> lisUsuarios = new ArrayList<>();

        try {
            conn = connectDB();

            ps = conn.prepareStatement("SELECT * FROM usuarios");
            rs = ps.executeQuery();

            while (rs.next()) {
                int index = 1;
                Usuario u = new Usuario();
                u.setId(rs.getInt(index++));
                u.setEmail(rs.getString(index++));
                u.setUsername(rs.getString(index++));
                u.setNombre(rs.getString(index++));
                u.setApellidos(rs.getString(index++));
                u.setRol(rs.getString(index++));
                u.setPassword(rs.getString(index++));
                lisUsuarios.add(u);
            }

        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }finally {
            closeDb(conn,ps,rs);
        }
        return lisUsuarios;
    }

    @Override
    public Optional<Usuario> find(int pk) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Optional<Usuario> usuario = Optional.empty();

        try {
            conn = connectDB();
            ps = conn.prepareStatement("SELECT * FROM usuarios WHERE id_usuario = ?");
            ps.setInt(1,pk);

            rs = ps.executeQuery();

            if (rs.next()) {
                int index = 1;
                usuario = Optional.of(new Usuario(rs.getInt(index++),rs.getString(index++),rs.getString(index++),rs.getString(index++),rs.getString(index++),rs.getString(index++),rs.getString(index++)));
            }


        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }

        return usuario;
    }

    @Override
    public void update(Usuario u) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = connectDB();

            ps = conn.prepareStatement("UPDATE usuarios SET email = ?, username = ?, nombre = ?, apellidos = ?, rol = ?, password = ? WHERE id_usuario = ?");

            ps.setString(1, u.getEmail());
            ps.setString(2, u.getUsername());
            ps.setString(3, u.getNombre());
            ps.setString(4, u.getApellidos());
            ps.setString(5, u.getRol());
            ps.setString(6,u.getPassword());
            ps.setInt(7, u.getId());

            ps.executeUpdate();

        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }finally {
            closeDb(conn, ps, rs);
        }

    }
}

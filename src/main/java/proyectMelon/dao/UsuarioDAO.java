package proyectMelon.dao;

import proyectMelon.model.Usuario;

import java.util.List;
import java.util.Optional;

public interface UsuarioDAO {
    public void create(Usuario u);
    public Optional<Usuario> exists(Usuario u);
    public void delete(int pk);
    public List<Usuario> getALL();
    public Optional<Usuario> find (int pk);
    public void update(Usuario u);

}

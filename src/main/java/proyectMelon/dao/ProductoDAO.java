package proyectMelon.dao;

import proyectMelon.model.Producto;

import java.util.List;
import java.util.Optional;

public interface ProductoDAO {
    public void create (Producto p);
    public List<Producto> getAll();
    public void delete(int pk);
    public void update(Producto p);
    public Optional<Producto> find(int pk);

}

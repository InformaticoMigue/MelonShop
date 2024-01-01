package proyectMelon.dao;

import proyectMelon.model.Categoria;

import java.util.List;
import java.util.Optional;

public interface CategoriaDAO {
    public List<Categoria> getAll();
    public Optional<Categoria> find(int pk);
    public Optional<Categoria> findByName(String name);
    public void create(Categoria cat);
    public void delete(int pk);
    public void update(Categoria cat);
}

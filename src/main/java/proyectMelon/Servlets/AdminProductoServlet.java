package proyectMelon.Servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proyectMelon.dao.CategoriaDAOImpl;
import proyectMelon.dao.ProductoDAOImpl;
import proyectMelon.dao.UsuarioDAOImpl;
import proyectMelon.model.Producto;

import java.io.IOException;
import java.util.Arrays;

@WebServlet(name = "productosServlet", value = "/admin/producto/*")
public class AdminProductoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        ProductoDAOImpl pDAO = new ProductoDAOImpl();

        if (pathInfo == null){
            req.setAttribute("listProductos", pDAO.getAll());
            RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/admin/producto/productos.jsp");
            rd.forward(req,resp);
        }else{
            String[] pathInfoSplit = req.getPathInfo().split("/");
            if ("crear".equals(pathInfoSplit[1])){
                CategoriaDAOImpl catDAO = new CategoriaDAOImpl();
                req.setAttribute("categorias",catDAO.getAll());
                RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/admin/producto/crear-producto.jsp");
                rd.forward(req,resp);
            } else if ("editar".equals(pathInfoSplit[1])) {
                try {
                    CategoriaDAOImpl catDAO = new CategoriaDAOImpl();
                    int id = Integer.parseInt(pathInfoSplit[2]);

                    req.setAttribute("listaCategorias",catDAO.getAll());
                    req.setAttribute("producto",pDAO.find(id));
                    RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/admin/producto/editar-producto.jsp");
                    rd.forward(req,resp);

                }catch (NumberFormatException nfe) {
                    RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/admin/producto/productos.jsp");
                    rd.forward(req,resp);
                }
            }else if (pathInfoSplit.length == 3 && "borrar".equals(pathInfoSplit[1])) {
            doDelete(req, resp);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String __method__ = req.getParameter("__method__");
        ProductoDAOImpl pdDAO = new ProductoDAOImpl();

        if (__method__ == null){
            String nombre = req.getParameter("nombre");
            double precio = Double.parseDouble(req.getParameter("precio"));
            String descripcion = req.getParameter("descripcion");
            int stock = Integer.parseInt(req.getParameter("stock"));
            String cat = req.getParameter("cat");

            Producto p = new Producto();

            p.setNombre(nombre);
            p.setPrecio(precio);
            p.setDescripcion(descripcion);
            p.setStock(stock);
            p.setCat(cat);

            pdDAO.create(p);
        }else if ("delete".equals(__method__)){
            doDelete(req,resp);
        } else if ("put".equals(__method__)) {
            doPut(req,resp);
        }
        resp.sendRedirect(req.getContextPath() + "/admin/producto");
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductoDAOImpl pDAO = new ProductoDAOImpl();
        int id;

        try {
            id = Integer.parseInt(req.getPathInfo().split("/")[2]);
        }catch (NumberFormatException nfe) {
            id = -1;
        }

        pDAO.delete(id);

    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CategoriaDAOImpl catDAO = new CategoriaDAOImpl();
        String categoria = req.getParameter("categoria");

        int id = Integer.parseInt(req.getParameter("id"));
        String nombre = req.getParameter("nombre");
        double precio = Double.parseDouble(req.getParameter("precio"));
        String idCategoria = String.valueOf(catDAO.findByName(categoria).get().getId());
        String descripcion = req.getParameter("descripcion");
        int stock = Integer.parseInt(req.getParameter("stock"));

        ProductoDAOImpl pDAO = new ProductoDAOImpl();
        Producto p = new Producto(id,nombre,precio,idCategoria,descripcion,stock);
        pDAO.update(p);
    }
}

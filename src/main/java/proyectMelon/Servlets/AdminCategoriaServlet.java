package proyectMelon.Servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proyectMelon.dao.CategoriaDAOImpl;
import proyectMelon.dao.ProductoDAOImpl;
import proyectMelon.model.Categoria;
import proyectMelon.model.Producto;

import java.io.IOException;

@WebServlet(name = "categoriasServlet", value = "/admin/categoria/*")
public class AdminCategoriaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        CategoriaDAOImpl catDAO = new CategoriaDAOImpl();

        if (pathInfo == null){
            req.setAttribute("listCategoria",catDAO.getAll());
            RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/admin/categoria/categorias.jsp");
            rd.forward(req,resp);
        }else{
            String[] pathInfoSplit = req.getPathInfo().split("/");
            if ("crear".equals(pathInfoSplit[1])){
                RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/admin/categoria/crear-categoria.jsp");
                rd.forward(req,resp);
            } else if ("editar".equals(pathInfoSplit[1])) {
                try {
                    int id = Integer.parseInt(pathInfoSplit[2]);
                    req.setAttribute("categoria",catDAO.find(id));
                    RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/admin/categoria/editar-categoria.jsp");
                    rd.forward(req,resp);

                }catch (NumberFormatException nfe) {
                    RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/admin/categoria/categorias.jsp");
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
        CategoriaDAOImpl catDAO = new CategoriaDAOImpl();

        if (__method__ == null){
            String nombre = req.getParameter("nombre");

            Categoria cat = new Categoria();
            cat.setNombre(nombre);

            catDAO.create(cat);
        }else if ("delete".equals(__method__)){
        doDelete(req,resp);
        } else if ("put".equals(__method__)) {
            doPut(req,resp);
        }

        resp.sendRedirect(req.getContextPath() + "/admin/categoria");
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CategoriaDAOImpl catDAO = new CategoriaDAOImpl();

        int id;
        try {
            id = Integer.parseInt(req.getPathInfo().split("/")[2]);
        }catch (NumberFormatException nfe) {
            id = -1;
        }
        catDAO.delete(id);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nombre = req.getParameter("nombre");
        int id = Integer.parseInt(req.getParameter("id"));
        CategoriaDAOImpl catDAO = new CategoriaDAOImpl();

        Categoria cat = new Categoria(id,nombre);

        catDAO.update(cat);
    }
}

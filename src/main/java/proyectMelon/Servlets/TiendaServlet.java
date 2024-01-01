package proyectMelon.Servlets;

import proyectMelon.dao.CategoriaDAOImpl;
import proyectMelon.dao.ProductoDAOImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proyectMelon.model.*;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "tiendaServlet", value = "/tienda/*")
public class TiendaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();

        ProductoDAOImpl pDao = new ProductoDAOImpl();
        CategoriaDAOImpl catDAO = new CategoriaDAOImpl();

        if (pathInfo == null) {

            List<Producto> productoList = pDao.getAll();
            productoList.forEach(producto -> {
                producto.setCat(
                        catDAO.find(Integer.parseInt(producto.getCat()))
                                .get().getNombre());
            });

            List<Categoria> listCat = catDAO.getAll();

            req.setAttribute("listCat", listCat);
            req.setAttribute("productoList", productoList);
            req.setAttribute("usuario", req.getSession().getAttribute("user"));

            RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/tienda/productos.jsp");
            rd.forward(req, resp);

        }else{
            String[] pathInfoSplit = req.getPathInfo().split("/");

            if("filtrarCat".equals(pathInfoSplit[1])) {
                List<Producto> productoList = pDao.getAll();
                List<Categoria> listCat = catDAO.getAll();

                productoList.forEach(producto -> {
                    producto.setCat(
                            catDAO.find(Integer.parseInt(producto.getCat()))
                                    .get().getNombre());
                });

                String catSeleccionada = pathInfoSplit[2];

                productoList = productoList.stream()
                        .filter(producto -> producto.getCat().equals(catSeleccionada))
                        .toList();

                if (!productoList.isEmpty()){
                    req.setAttribute("listCat", listCat);
                    req.setAttribute("productoList", productoList);
                    RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/tienda/productos.jsp");
                    rd.forward(req, resp);
                }else{
                    resp.sendRedirect(req.getContextPath()+"/tienda");
                }
            }else {
                try {
                    int id = Integer.parseInt(pathInfoSplit[1]);
                    Optional<Producto> producto = pDao.find(id);

                    producto.ifPresent(p -> p.setCat(
                            catDAO.find(Integer.parseInt(p.getCat()))
                                    .get().getNombre()));

                    req.setAttribute("producto",producto);
                    List<Categoria> listCat = catDAO.getAll();
                    req.setAttribute("listCat", listCat);

                    RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/tienda/detalle-producto.jsp");
                    rd.forward(req, resp);

                }catch (NumberFormatException e) {
                    resp.sendRedirect(req.getContextPath()+"/tienda");
                }
            }
        }
    }
}

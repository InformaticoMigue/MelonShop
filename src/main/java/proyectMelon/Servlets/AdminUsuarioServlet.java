package proyectMelon.Servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proyectMelon.dao.ProductoDAOImpl;
import proyectMelon.dao.UsuarioDAOImpl;
import proyectMelon.model.Producto;
import proyectMelon.model.Usuario;

import java.io.IOException;

@WebServlet(name = "usuariosServlet", value = "/admin/usuario/*")
public class AdminUsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        UsuarioDAOImpl usuDAO  = new UsuarioDAOImpl();

        if (pathInfo == null){
            req.setAttribute("listUsuarios", usuDAO.getALL());
            RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/admin/usuario/usuarios.jsp");
            rd.forward(req,resp);
        }else{
            String[] pathInfoSplit = req.getPathInfo().split("/");
            if (pathInfoSplit.length == 2 && "crear".equals(pathInfoSplit[1])){
                RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/admin/usuario/crear-usuario.jsp");
                rd.forward(req,resp);
            } else if (pathInfoSplit.length == 3 && "editar".equals(pathInfoSplit[1])) {
                try {
                    int id = Integer.parseInt(pathInfoSplit[2]);
                    req.setAttribute("user", usuDAO.find(id));
                    RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/admin/usuario/editar-usuario.jsp");
                    rd.forward(req,resp);
                }catch (NumberFormatException nfe) {
                    RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/admin/usuario/usuarios.jsp");
                    rd.forward(req,resp);
                }
            } else if (pathInfoSplit.length == 3 && "borrar".equals(pathInfoSplit[1])) {
                doDelete(req, resp);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String __method__ = req.getParameter("__method__");
        UsuarioDAOImpl usuDAO = new UsuarioDAOImpl();

        if (__method__ == null){
            String email = req.getParameter("email");
            String username = req.getParameter("username");
            String nombre = req.getParameter("nombre");
            String rol = req.getParameter("rol");
            String password = req.getParameter("password");
            String apellidos = req.getParameter("apellidos");

            Usuario u = new Usuario();

            u.setEmail(email);
            u.setUsername(username);
            u.setNombre(nombre);
            u.setApellidos(apellidos);
            u.setRol(rol);
            u.setPassword(password);

            usuDAO.create(u);
        } else if ("delete".equals(__method__)) {
            doDelete(req,resp);
        } else if ("put".equals(__method__)) {
            doPut(req,resp);
        }
        resp.sendRedirect(req.getContextPath()+"/admin/usuario");
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UsuarioDAOImpl usDAO = new UsuarioDAOImpl();
        int id;

        try {
            id = Integer.parseInt(req.getPathInfo().split("/")[2]);
        }catch (NumberFormatException nfe) {
            id = -1;
        }

        usDAO.delete(id);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String username = req.getParameter("username");
        String nombre = req.getParameter("nombre");
        String apellidos = req.getParameter("apellidos");
        String rol = req.getParameter("rol");

        UsuarioDAOImpl usuDAO = new UsuarioDAOImpl();
        Usuario usuario = new Usuario(id, email, nombre, apellidos, username, password, rol);

        usuDAO.update(usuario);

    }
}

package proyectMelon.Servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import proyectMelon.dao.UsuarioDAOImpl;
import proyectMelon.model.Pedido;
import proyectMelon.model.Usuario;

import java.io.IOException;

@WebServlet(name = "singInServletServer", value = "/sigin")
public class SingInServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/SigIn/sigin.jsp");
        rd.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UsuarioDAOImpl usDAO = new UsuarioDAOImpl();
        Usuario crear = new Usuario();
        String usuario = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String nombre = req.getParameter("nombre");
        String apellidos = req.getParameter("apellidos");

        boolean todosLosCamposValidos =
                        usuario != null && !usuario.isEmpty() &&
                        password != null && !password.isEmpty() &&
                        email != null && !email.isEmpty() &&
                        nombre != null && !nombre.isEmpty() &&
                        apellidos != null && !apellidos.isEmpty();

        if (todosLosCamposValidos){
            crear.setUsername(usuario);
            crear.setPassword(password);
            crear.setEmail(email);
            crear.setNombre(nombre);
            crear.setApellidos(apellidos);
            crear.setRol("cliente");

            usDAO.create(crear);

            HttpSession session = req.getSession(true);
            session.setAttribute("user",crear);

            resp.sendRedirect(req.getContextPath()+"/tienda");
        }else{
            resp.sendRedirect(req.getContextPath()+"/sigin");
        }
    }
}

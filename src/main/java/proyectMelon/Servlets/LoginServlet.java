package proyectMelon.Servlets;

import java.io.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import proyectMelon.dao.UsuarioDAOImpl;
import proyectMelon.model.Pedido;
import proyectMelon.model.Usuario;

@WebServlet(name = "loginShop", value = "/login")
public class LoginServlet extends HttpServlet {

    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/login/login.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UsuarioDAOImpl usDAO = new UsuarioDAOImpl();
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        boolean stringsValidos = email != null && !email.isEmpty() && password != null && !password.isEmpty();

        if (stringsValidos){
            Usuario exists;
            Usuario comprobar = new Usuario();

            comprobar.setEmail(email);
            comprobar.setPassword(password);

            if (usDAO.exists(comprobar).isPresent()) {
                exists = usDAO.exists(comprobar).get();
                HttpSession session = req.getSession(true);
                session.setAttribute("user",exists);
                resp.sendRedirect(req.getContextPath()+"/tienda");
            }else{
                resp.sendRedirect(req.getContextPath()+"/sigin");
            }
        }else{
            resp.sendRedirect(req.getContextPath()+"/sigin");
        }
    }

    public void destroy() {

    }
}
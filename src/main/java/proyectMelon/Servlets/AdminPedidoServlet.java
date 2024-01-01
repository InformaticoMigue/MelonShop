package proyectMelon.Servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proyectMelon.dao.PedidoDAOImpl;
import proyectMelon.dao.ProductoPedidoDAOImpl;
import proyectMelon.model.Pedido;
import proyectMelon.model.ProductoPedido;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "pedidosServlet", value = "/admin/pedido/*")
public class AdminPedidoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        PedidoDAOImpl pedidoDAO = new PedidoDAOImpl();

        if (pathInfo == null){
            List<Pedido> pedidos = pedidoDAO.getALL();
            req.setAttribute("pedidos", pedidos);
            RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/admin/pedido/pedidos.jsp");
            rd.forward(req, resp);
        }else{
            String[] pathInfoSplit = req.getPathInfo().split("/");
            if ("filtrar".equals(pathInfoSplit[1])){

                try {
                    int idUsuario = Integer.parseInt(req.getParameter("idUsuario"));
                    List<Pedido> pedidosByUser = pedidoDAO.getAllByUser(idUsuario);

                    if (pedidosByUser.isEmpty()){
                        List<Pedido> pedidos = pedidoDAO.getALL();
                        req.setAttribute("pedidos", pedidos);
                        RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/admin/pedido/pedidos.jsp");
                        rd.forward(req, resp);
                    }else{
                        req.setAttribute("pedidos", pedidosByUser);
                        RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/admin/pedido/pedidos.jsp");
                        rd.forward(req, resp);
                    }
                }catch (NumberFormatException nfe) {
                    List<Pedido> pedidos = pedidoDAO.getALL();
                    req.setAttribute("pedidos", pedidos);
                    RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/admin/pedido/pedidos.jsp");
                    rd.forward(req, resp);
                }

            } else if (pathInfoSplit.length == 3 && "detalles".equals(pathInfoSplit[1])){
                ProductoPedidoDAOImpl ppDAO = new ProductoPedidoDAOImpl();

                try {
                    int id = Integer.parseInt(pathInfoSplit[2]);
                    List<ProductoPedido> productoPedidos = ppDAO.findAll(id);

                    if (!productoPedidos.isEmpty()){
                        req.setAttribute("pedidos", productoPedidos);
                        RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/admin/pedido/productosPedido.jsp");
                        rd.forward(req, resp);
                    }else{
                        List<Pedido> pedidosAll = pedidoDAO.getALL();
                        req.setAttribute("pedidos", pedidosAll);
                        RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/admin/pedido/pedidos.jsp");
                        rd.forward(req, resp);
                    }

                }catch (NumberFormatException nfe) {
                    System.out.println("a");
                    List<Pedido> pedidos = pedidoDAO.getALL();
                    req.setAttribute("pedidos", pedidos);
                    RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/admin/pedido/pedidos.jsp");
                    rd.forward(req, resp);
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String __method__ = req.getParameter("__method__");

        if (__method__ != null && "delete".equals(__method__)){
            doDelete(req, resp);
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idPedido = Integer.parseInt(req.getPathInfo().split("/")[2]);
        PedidoDAOImpl pedidoDAO = new PedidoDAOImpl();
        pedidoDAO.delete(idPedido);
        resp.sendRedirect(req.getContextPath()+"/admin/pedido");
    }
}

package proyectMelon.Servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import proyectMelon.dao.PedidoDAOImpl;
import proyectMelon.dao.ProductoDAOImpl;
import proyectMelon.model.Pedido;
import proyectMelon.model.Producto;
import proyectMelon.model.ProductoPedido;
import proyectMelon.model.Usuario;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Optional;

@WebServlet(name = "carritoServlet", value = "/carrito/*")
public class CarritoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        if (pathInfo == null) {
            RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/tienda/carrito.jsp");
            rd.forward(req, resp);
        }else{
            String[] pathInfoSplit = req.getPathInfo().split("/");
                if (pathInfoSplit.length == 2 && "limpiar".equals(pathInfoSplit[1]) && req.getSession().getAttribute("carrito") != null) {
                    doDelete(req, resp);
                } else if (pathInfoSplit.length == 3 && "limpiar".equals(pathInfoSplit[1]) && req.getSession().getAttribute("carrito") != null) {
                    doDelete(req, resp);
                }
        }
        resp.sendRedirect(req.getContextPath() + "/carrito");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        String __method__ = req.getParameter("__method__");

        if (__method__ != null && "delete".equals(__method__) && req.getSession().getAttribute("carrito") != null) {
            doDelete(req, resp);
        } else if (pathInfo == null && req.getSession().getAttribute("user") != null) {
                int idProducto = Integer.parseInt(req.getParameter("idProducto"));
                ProductoDAOImpl pDAO = new ProductoDAOImpl();
                int cantidad = Integer.parseInt(req.getParameter("cant"));

                pDAO.find(idProducto)
                        .filter(producto -> cantidad > 0)
                        .ifPresent(prp -> {
                            Usuario usuario = (Usuario) req.getSession().getAttribute("user");
                            Pedido carrito = (Pedido) req.getSession().getAttribute("carrito");

                            if (carrito == null) {
                                HttpSession session = req.getSession(true);
                                session.setAttribute("carrito", new Pedido());
                                carrito = (Pedido) session.getAttribute("carrito");
                            }

                            ProductoPedido productoPedido = new ProductoPedido();
                            productoPedido.setProducto(prp);
                            productoPedido.setCantidad(cantidad);

                            boolean esta = carrito.getProductos()
                                    .stream()
                                    .anyMatch(pp -> pp.equals(productoPedido));

                            if (esta) {
                                carrito.getProductos()
                                        .stream()
                                        .filter(pp -> pp.equals(productoPedido))
                                        .forEach(pp -> {
                                            pp.setCantidad(Math.min(pp.getCantidad() + productoPedido.getCantidad(), pp.getProducto().getStock()));
                                        });
                            } else {
                                carrito.getProductos().add(productoPedido);
                            }

                            carrito.setUsuario(usuario);
                            BigDecimal total = carrito.getProductos()
                                    .stream()
                                    .map(pp -> {
                                        BigDecimal precio = BigDecimal.valueOf(pp.getProducto().getPrecio());
                                        BigDecimal c = BigDecimal.valueOf(pp.getCantidad());
                                        return precio.multiply(c);
                                    })
                                    .reduce(BigDecimal.ZERO, BigDecimal::add);

                            carrito.setTotalPedido(total);
                        });

                    RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/tienda/carrito.jsp");
                    rd.forward(req, resp);

        } else if (pathInfo != null) {
                String[] pathInfoSplit = req.getPathInfo().split("/");

                if (pathInfoSplit.length == 2 && "comprar".equals(pathInfoSplit[1]) && req.getSession().getAttribute("carrito") != null) {
                    Pedido pedido = (Pedido) req.getSession().getAttribute("carrito");
                    ProductoDAOImpl pDAO = new ProductoDAOImpl();

                    PedidoDAOImpl peDAO = new PedidoDAOImpl();
                    LocalDate localDate = LocalDate.now();
                    java.sql.Date fechaActual = java.sql.Date.valueOf(localDate);
                    pedido.setFechaPedido(fechaActual);
                    peDAO.guardarPedido(pedido);

                    for (ProductoPedido pp : pedido.getProductos()) {
                        pp.getProducto().setStock(pp.getProducto().getStock() - pp.getCantidad());
                        pDAO.update(pp.getProducto());
                    }
                    req.getSession().removeAttribute("carrito");
                    resp.sendRedirect(req.getContextPath()+"/tienda");
                }
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] pathInfoSplit = req.getPathInfo().split("/");

        if (pathInfoSplit.length == 2 && "limpiar".equals(pathInfoSplit[1]) && req.getSession().getAttribute("carrito") != null) {
            req.getSession().removeAttribute("carrito");
        } else if (pathInfoSplit.length == 3 && "limpiar".equals(pathInfoSplit[1]) && req.getSession().getAttribute("carrito") != null) {
            Pedido carrito = (Pedido) req.getSession().getAttribute("carrito");
            try {
                int id = Integer.parseInt(pathInfoSplit[2]);
                Producto equal = new Producto();
                equal.setId(id);

                Optional<ProductoPedido> pp = carrito.getProductos()
                        .stream()
                        .filter(productoPedido -> {
                            ProductoPedido equalpp = new ProductoPedido();
                            equalpp.setProducto(equal);
                            return productoPedido.equals(equalpp);
                        })
                        .findFirst();

                pp.ifPresent(productoPedido -> carrito.getProductos().remove(productoPedido));

                if (carrito.getProductos().isEmpty()) {
                    req.getSession().removeAttribute("carrito");
                }

            } catch (NumberFormatException nfe) {
                throw new RuntimeException(nfe);
            }
        }

        RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/tienda/carrito.jsp");
        rd.forward(req,resp);
    }
}

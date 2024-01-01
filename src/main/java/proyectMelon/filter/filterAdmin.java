package proyectMelon.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proyectMelon.model.Usuario;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

@WebFilter(urlPatterns = "/admin/*", initParams = {
        @WebInitParam(name = "rol", value = "admin")})

public class filterAdmin implements Filter {

    private String accesoRol;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        accesoRol = filterConfig.getInitParameter("rol");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        Usuario u = (Usuario) request.getSession().getAttribute("user");

        if (u == null) {
            response.sendRedirect(request.getContextPath()+"/tienda");
        }else if (u != null && !u.getRol().equals(accesoRol)){
            response.sendRedirect(request.getContextPath()+"/tienda");
        }else{
            filterChain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}

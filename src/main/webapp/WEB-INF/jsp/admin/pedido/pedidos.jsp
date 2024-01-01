<%@ page import="proyectMelon.model.Pedido" %>
<%@ page import="java.util.List" %>
<%@ page import="proyectMelon.model.ProductoPedido" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Pedidos</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Figtree:ital@1&family=Inconsolata&family=Montserrat:wght@500&family=Noto+Sans:ital,wght@1,300&display=swap" rel="stylesheet">
</head>
<style>
    <%@include file="../../../css/admin/admin.css"%>
    <%@include file="../../../css/admin/pedido/pedidos.css"%>

</style>

<%@ include file="../../frag/navAdmin.jsp"%>

<body>
    <%List<Pedido> pedidos = (List<Pedido>) request.getAttribute("pedidos");%>
    <% if (pedidos != null){%>

    <section class="debajoNav">
    <div class="formulario">
        <h2>Filtrar por ID de Usuario</h2>
        <form action="<%=request.getContextPath()%>/admin/pedido/filtrar">
            <label for="idUsuario">ID de Usuario:</label>
            <input type="number" id="idUsuario" name="idUsuario" required min="1">
            <button type="submit">Filtrar</button>
        </form>
    </div>
    </section>

    <section class="container">
        <div class="headers">
            <span>Id</span>
            <span>Id Usuario</span>
            <span>Fecha De Realización</span>
            <span>Total Del Pedido</span>
        </div>
        <br>
        <hr>
            <% for (Pedido pedido : pedidos){%>
                <div class="content">
                    <span><%=pedido.getId()%></span>
                    <span><%=pedido.getUsuario().getId()%></span>
                    <span><%=pedido.getFechaPedido()%></span>
                    <span><%=pedido.getTotalPedido()%></span>
                    <div class="acciones">
                        <form action="<%=request.getContextPath()%>/admin/pedido/borrar/<%=pedido.getId()%>" method="post">
                            <input type="hidden" name="__method__" value="delete">
                            <button><i class="fa-solid fa-trash"></i></button>
                        </form>
                        <form action="<%=request.getContextPath()%>/admin/pedido/detalles/<%=pedido.getId()%>">
                            <button><i class="fa-solid fa-eye"></i></button>
                        </form>
                    </div>
                </div>
            <%}%>
    <%}else{
        response.sendRedirect(request.getContextPath()+"/admin");
    }%>

    <script src="https://kit.fontawesome.com/0d6cc8454f.js" crossorigin="anonymous"></script>
</body>
</html>

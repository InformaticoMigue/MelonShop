<%@ page import="proyectMelon.model.ProductoPedido" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Productos pedido</title>
</head>
<body>
    <%List<ProductoPedido> productoPedidos = (List<ProductoPedido>) request.getAttribute("pedidos");%>
    <style>
        <%@include file="../../../css/admin/pedido/productosPedido.css"%>
    </style>

    <section class="container">
        <div class="headers">
            <span>Id Pedido</span>
            <span>Id Producto</span>
            <span>Cantidad</span>
        </div>
        <br>
        <hr>
            <% for (ProductoPedido producto : productoPedidos){%>
                <div class="content">
                    <span><%=producto.getIdPedido()%></span>
                    <span><%=producto.getProducto().getId()%></span>
                    <span><%=producto.getCantidad()%></span>
                </div>
            <%}%>
</body>
</html>

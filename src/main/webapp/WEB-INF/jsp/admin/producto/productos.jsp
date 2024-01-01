<%@ page import="proyectMelon.model.Producto" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Productos</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Figtree:ital@1&family=Inconsolata&family=Montserrat:wght@500&family=Noto+Sans:ital,wght@1,300&display=swap" rel="stylesheet"></head>
<body>
<style>
    <%@ include file="../../../css/admin/admin.css"%>
    <%@ include file="../../../css/admin/producto/productos.css"%>
</style>
<script src="https://cdn.tailwindcss.com"></script>
<script>
    tailwind.config = {
        theme: {
            extend: {
            }
        }
    }
</script>

<%@ include file="../../frag/navAdmin.jsp"%>

<% List<Producto> listProductos = (List<Producto>) request.getAttribute("listProductos");%>

<% if(listProductos != null) {%>

<div class="crear">
    <form action="<%=request.getContextPath()%>/admin/producto/crear">
    <button><i class="fa-solid fa-plus"></i></button>
    </form>
</div>

<section class="container">
    <div class="headers">
        <span>Id</span>
        <span>Nombre</span>
        <span>Precio</span>
        <span>Id categoria</span>
        <span>Stock</span>
        <span>Acciones</span>
    </div>
    <br>
    <hr>

        <% for(Producto p: listProductos){%>
    <div class="content">
        <span><%=p.getId()%></span>
        <span><%=p.getNombre()%></span>
        <span><%=p.getPrecio()%></span>
        <span><%=p.getCat()%></span>
        <span><%=p.getStock()%></span>
        <div class="acciones">
            <form action="<%=request.getContextPath()%>/admin/producto/editar/<%=p.getId()%>">
                <button><i class="fa-solid fa-pen-to-square"></i></button>
            </form>
            <form action="<%=request.getContextPath()%>/admin/producto/borrar/<%=p.getId()%>" method="post">
                <input type="hidden" name="__method__" value="delete">
                <button><i class="fa-solid fa-trash"></i></button>
            </form>
        </div>
    </div>
        <%}%>

<%}else{
    response.sendRedirect(request.getContextPath()+"/admin/producto");
}%>

    <script src="https://kit.fontawesome.com/0d6cc8454f.js" crossorigin="anonymous"></script>
</body>
</html>
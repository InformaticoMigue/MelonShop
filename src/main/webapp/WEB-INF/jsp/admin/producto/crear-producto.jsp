<%@ page import="java.util.List" %>
<%@ page import="proyectMelon.model.Categoria" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Crear producto</title>
</head>
<body>
<style>
    <%@include file="../../../css/admin/producto/crear.css"%>
    <%@include file="../../../css/admin/producto/return.css"%>
</style>

<% List<Categoria> listCat = (List<Categoria>) request.getAttribute("categorias"); %>
<% if (listCat != null){%>

<h1>Creación de un producto</h1>

<div>
    <form action="<%=request.getContextPath()%>/admin/producto" class="return">
        <button><i class="fa-solid fa-left-long"></i></button>
    </form>
</div>

<form action="" method="post" class="form">
    <label>Nombre:
        <input type="text" name="nombre" required>
    </label>
    <label>Precio:
        <input type="number" name="precio" required>
    </label>
    <label>Descripción:
        <textarea name="descripcion" id="" required></textarea>
    </label>
    <label>Categoría:
        <select name="cat" required>
            <%for (Categoria cat: listCat){%>
            <option><%=cat.getNombre()%></option>
            <%}%>
        </select>
    </label>
    <label>Stock:
        <input type="number" name="stock" required min="1">
    </label>
    <label>
        <input type="submit" id="enviar" value="Enviar">
    </label>
</form>
<script src="https://kit.fontawesome.com/0d6cc8454f.js" crossorigin="anonymous"></script>

</body>
</html>
<%}else{
    response.sendRedirect(request.getContextPath()+"/admin");
}%>

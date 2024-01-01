<%@ page import="java.util.List" %>
<%@ page import="proyectMelon.model.Categoria" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Crear categoria</title>
</head>
<body>
<style>
    <%@include file="../../../css/admin/categoria/crear.css"%>
    <%@include file="../../../css/admin/categoria/return.css"%>
</style>

<h1>Creación de una categoria</h1>

<div>
    <form action="<%=request.getContextPath()%>/admin/categoria" class="return">
        <button><i class="fa-solid fa-left-long"></i></button>
    </form>
</div>

<form action=<%=request.getContextPath()%>/admin/categoria/crear" method="post" class="form">
    <label>Nombre:
        <input type="text" name="nombre" required>
    </label>
    <label>
        <input type="submit" id="enviar" value="Enviar">
    </label>
</form>
<script src="https://kit.fontawesome.com/0d6cc8454f.js" crossorigin="anonymous"></script>

</body>
</html>



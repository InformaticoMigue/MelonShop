<%@ page import="java.util.List" %>
<%@ page import="proyectMelon.model.Categoria" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Crear categoria</title>
</head>
<body>
<style>
    <%@include file="../../../css/admin/usuario/crear.css"%>
    <%@include file="../../../css/admin/usuario/return.css"%>
</style>

<h1>Creación de un usuario</h1>

<div>
    <form action="<%=request.getContextPath()%>/admin/usuario" class="return">
        <button><i class="fa-solid fa-left-long"></i></button>
    </form>
</div>

<form action=<%=request.getContextPath()%>/admin/usuario/crear" method="post" class="form">
    <label>Email:
        <input type="email" name="email" required>
    </label>
    <label>Username:
        <input type="text" name="username" required>
    </label>
    <label>Nombre:
        <input type="text" name="nombre" required>
    </label>
    <label>Apellidos:
        <input type="text" name="apellidos" required>
    </label>
    <label>Password:
        <input type="password" name="password" required>
    </label>

    <select name="rol" required>
        <option>Cliente</option>
        <option>Admin</option>
    </select>

    <label>
        <input type="submit" id="enviar" value="Enviar">
    </label>
</form>

<script src="https://kit.fontawesome.com/0d6cc8454f.js" crossorigin="anonymous"></script>


</body>
</html>




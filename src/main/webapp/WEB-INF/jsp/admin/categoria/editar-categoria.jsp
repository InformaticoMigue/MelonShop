<%@ page import="proyectMelon.model.Categoria" %>
<%@ page import="java.util.Optional" %><%--
  Created by IntelliJ IDEA.
  User: migue
  Date: 03/12/2023
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Editar Categoria</title>
</head>
<body>
<%Optional<Categoria> cat = (Optional<Categoria>) request.getAttribute("categoria");%>

<%if (cat.isPresent()){%>


<style>
    <%@include file="../../../css/admin/categoria/editar.css"%>
    <%@include file="../../../css/admin/categoria/return.css"%>
</style>

<div class="container">

    <div>
        <form action="<%=request.getContextPath()%>/admin/categoria" class="return">
            <button><i class="fa-solid fa-left-long"></i></button>
        </form>
    </div>

    <h2>Editar Categoria</h2>
    <form id="editProductForm" action="<%=request.getContextPath()%>/admin/categoria/editar" method="post">
        <input type="hidden" name="__method__" value="put">

        <div class="form-group">
            <label>Id: </label>
            <input type="text" name="id" value="<%=cat.get().getId()%>" readonly>
        </div>

        <div class="form-group">
            <label for="productName">Nombre:</label>
            <input type="text" id="productName" name="nombre" value="<%=cat.get().getNombre()%>" required>
        </div>

        <button type="submit">Guardar Cambios</button>

<%}else {
    response.sendRedirect(request.getContextPath() + "/admin/categoria");
}%>
        <script src="https://kit.fontawesome.com/0d6cc8454f.js" crossorigin="anonymous"></script>
</body>
</html>

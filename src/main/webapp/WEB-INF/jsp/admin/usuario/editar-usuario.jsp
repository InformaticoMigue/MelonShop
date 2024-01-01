<%@ page import="java.util.Optional" %>
<%@ page import="proyectMelon.model.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Editar usuario</title>
</head>
<body>
    <%Optional<Usuario> user = (Optional<Usuario>) request.getAttribute("user");%>

    <%if (user.isPresent()){%>

    <style>
        <%@include file="../../../css/admin/usuario/editar.css"%>
        <%@include file="../../../css/admin/usuario/return.css"%>
    </style>



    <div class="container">
        <div>
            <form action="<%=request.getContextPath()%>/admin/usuario" class="return">
                <button><i class="fa-solid fa-left-long"></i></button>
            </form>
        </div>
        <h2>Editar Usuario</h2>
        <form id="editProductForm" action="<%=request.getContextPath()%>/admin/usuario/editar" method="post">
            <input type="hidden" name="__method__" value="put">

            <div class="form-group">
                <label>Id: </label>
                <input type="text" name="id" value="<%=user.get().getId()%>" readonly>
            </div>

            <div class="form-group">
                <label for="productName">Email:</label>
                <input type="text" name="email" value="<%=user.get().getEmail()%>" required>
            </div>

            <div class="form-group">
                <label for="productName">Username:</label>
                <input type="text" name="username" value="<%=user.get().getUsername()%>" required>
            </div>

            <div class="form-group">
                <label for="productName">Nombre:</label>
                <input type="text" id="productName" name="nombre" value="<%=user.get().getNombre()%>" required>
            </div>

            <div class="form-group">
                <label for="productName">Apellidos:</label>
                <input type="text" name="apellidos" value="<%=user.get().getApellidos()%>" required>
            </div>

            <div class="form-group">
                <label for="productName">Rol:</label>
                <select name="rol">
                    <option value="admin">Admin</option>
                    <option value="cliente">Cliente</option>
                </select>
            </div>

            <div class="form-group">
                <label for="productName">Password:</label>
                <input type="text" name="password" required>
            </div>

            <button type="submit">Guardar Cambios</button>

        <%}else {
        response.sendRedirect(request.getContextPath() + "/admin/usuario");
    }%>
            <script src="https://kit.fontawesome.com/0d6cc8454f.js" crossorigin="anonymous"></script>

</body>
</html>

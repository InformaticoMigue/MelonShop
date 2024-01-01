<%@ page import="proyectMelon.model.Usuario" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Usuarios</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Figtree:ital@1&family=Inconsolata&family=Montserrat:wght@500&family=Noto+Sans:ital,wght@1,300&display=swap" rel="stylesheet">
</head>
<body>
<style>
    <%@ include file="../../../css/admin/usuario/usuarios.css"%>
    <%@ include file="../../../css/admin/admin.css"%>

</style>

<%@ include file="../../frag/navAdmin.jsp"%>

<%List<Usuario> listUsuarios = (List<Usuario>) request.getAttribute("listUsuarios");%>

<% if(listUsuarios != null) {%>

<div class="crear">
    <form action="<%=request.getContextPath()%>/admin/usuario/crear">
        <button><i class="fa-solid fa-plus"></i></button>
    </form>
</div>

<section class="container">
    <div class="headers">
        <span>Id</span>
        <span>Email</span>
        <span>Username</span>
        <span>Nombre</span>
        <span>Apellidos</span>
        <span>Rol</span>
        <span>Acciones</span>
    </div>

    <br>
    <hr>

    <% for(Usuario user: listUsuarios){%>
        <div class="content">
            <span><%=user.getId()%></span>
            <span><%=user.getEmail()%></span>
            <span><%=user.getUsername()%></span>
            <span><%=user.getNombre()%></span>
            <span><%=user.getApellidos()%></span>
            <span><%=user.getRol()%></span>
            <div class="acciones">
                <form action="<%=request.getContextPath()%>/admin/usuario/editar/<%=user.getId()%>">
                    <button><i class="fa-solid fa-pen-to-square"></i></button>
                </form>
                <form action="<%=request.getContextPath()%>/admin/usuario/borrar/<%=user.getId()%>" method="post">
                    <input type="hidden" name="__method__" value="delete">
                    <button><i class="fa-solid fa-trash"></i></button>
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

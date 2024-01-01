<%@ page import="java.util.List" %>
<%@ page import="proyectMelon.model.Categoria" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Categorias</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Figtree:ital@1&family=Inconsolata&family=Montserrat:wght@500&family=Noto+Sans:ital,wght@1,300&display=swap" rel="stylesheet">
</head>
<body>
<style>
    <%@ include file="../../../css/admin/categoria/categorias.css"%>
    <%@ include file="../../../css/admin/admin.css"%>

</style>

<%@ include file="../../frag/navAdmin.jsp"%>

<%List<Categoria> listCategoria = (List<Categoria>) request.getAttribute("listCategoria");%>

<% if(listCategoria != null) {%>

<div class="crear">
    <form action="<%=request.getContextPath()%>/admin/categoria/crear">
        <button><i class="fa-solid fa-plus"></i></button>
    </form>
</div>

<section class="container">
    <div class="headers">
        <span>Id</span>
        <span>Nombre</span>
        <span>Acciones</span>
    </div>

    <br>
    <hr>

        <% for(Categoria cat: listCategoria){%>
    <div class="content">
        <span><%=cat.getId()%></span>
        <span><%=cat.getNombre()%></span>
        <div class="acciones">
        <form action="<%=request.getContextPath()%>/admin/categoria/editar/<%=cat.getId()%>">
            <button><i class="fa-solid fa-pen-to-square"></i></button>
        </form>
        <form action="<%=request.getContextPath()%>/admin/categoria/borrar/<%=cat.getId()%>" method="post">
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

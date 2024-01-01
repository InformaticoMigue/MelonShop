<%@ page import="proyectMelon.model.Producto" %>
<%@ page import="java.util.Optional" %>
<%@ page import="proyectMelon.model.Categoria" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Editar producto</title>
</head>
<body>
<style>
    <%@include file="../../../css/admin/producto/editar.css"%>
    <%@include file="../../../css/admin/producto/return.css"%>

</style>

<%Optional<Producto> prod = (Optional<Producto>) request.getAttribute("producto");%>

<%if (prod.isPresent()){%>


<div class="container">
    <div>
        <form action="<%=request.getContextPath()%>/admin/producto" class="return">
            <button><i class="fa-solid fa-left-long"></i></button>
        </form>
    </div>

    <h2>Editar Producto</h2>
    <form id="editProductForm" action="<%=request.getContextPath()%>/admin/producto/editar" method="post">
        <input type="hidden" name="__method__" value="put">

        <div class="form-group">
            <label>Id: </label>
            <input type="text" name="id" value="<%=prod.get().getId()%>" readonly>
        </div>

        <div class="form-group">
            <label for="productName">Nombre:</label>
            <input type="text" id="productName" name="nombre" value="<%=prod.get().getNombre()%>" required>
        </div>

        <div class="form-group">
            <label for="productPrice">Precio:</label>
            <input type="number" id="productPrice" name="precio" min="0" value="<%=prod.get().getPrecio()%>" step="any" required>
        </div>

        <div class="form-group">
            <label for="category">Categoría:</label>
            <select id="category" name="categoria" required>
                <%List<Categoria> listaCategorias = (List<Categoria>) request.getAttribute("listaCategorias");%>
                <%for (Categoria cat : listaCategorias){%>
                    <option value="<%=cat.getNombre()%>"><%=cat.getNombre()%></option>
                <%}%>
            </select>
        </div>

        <div class="form-group">
            <label for="productDescription">Descripción:</label>
            <textarea id="productDescription" name="descripcion" rows="4" required><%=prod.get().getDescripcion()%></textarea>
        </div>

        <div class="form-group">
            <label for="productStock">Stock:</label>
            <input type="number" id="productStock" name="stock" value="<%=prod.get().getStock()%>" required>
        </div>

        <button type="submit">Guardar Cambios</button>

    <%}else {
    response.sendRedirect(request.getContextPath() + "/admin/producto");
}%>
        <script src="https://kit.fontawesome.com/0d6cc8454f.js" crossorigin="anonymous"></script>
</body>
</html>

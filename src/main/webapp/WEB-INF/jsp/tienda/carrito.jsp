<%@ page import="proyectMelon.model.Pedido" %>
<%@ page import="proyectMelon.model.ProductoPedido" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Pedido carrito = (Pedido) request.getSession().getAttribute("carrito");%>

<% if (carrito != null){%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito</title>
</head>
<body>

<section class="flex items-center px-20 w-full">
    <article class="w1/4">
        <img class="w-60" src="<%=request.getContextPath()%>/img/logo.png" alt="">
    </article>
    <article class="flex justify-end w-full">
        <ul class="flex gap-10 text-xl">
            <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>">Inicio</a></li>
            <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>/nosotros">Sobre nosotros</a></li>
            <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>/tienda">Tienda</a></li>
            <li><form action="<%=request.getContextPath()%>/logout" method="post"><button class="hover:text-gray-500 transition-all" >Logout</button></form></li>
            <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>/contacto">Contacto</a></li>
        </ul>
    </article>
</section>

<section class="flex flex-col gap-5 px-20 p-5 mb-5">
    <h1 class="text-4xl mb-6">Mi cesta de la compra</h1>
    <hr>
    <article class="grid grid-cols-2 mt-5 ">
        <article class="flex gap-2">
            <h4 class="text-2xl">Nombre</h4>
        </article>
        <article class="flex gap-8 justify-end mr-14">
            <h4 class="text-2xl">Precio</h4>
            <h4 class="text-2xl">Cantidad</h4>
        </article>
    </article>
    <article class="grid gap-6">
        <%for(ProductoPedido pp: carrito.getProductos()){%>
        <article class="grid grid-cols-2 justify-start items-center">
            <h6><%=pp.getProducto().getNombre()%></h6>
            <article class="flex gap-20 justify-end items-center">
                <h6><%=pp.getProducto().getPrecio()%>€</h6>
                <h6><%=pp.getCantidad()%></h6>
                <form action="<%=request.getContextPath()%>/carrito/limpiar/<%=pp.getProducto().getId()%>" method="post">
                    <input type="hidden" name="__method__" value="delete">
                    <button class="text-red-600 text-xl"><i class="fa-solid fa-xmark"></i></button>
                </form>
            </article>
        </article>
        <hr>
        <%}%>
    </article>
    <article class="grid grid-cols-2 items-center">
        <article class="flex flex-col gap-4">
            <form action="<%=request.getContextPath()%>/tienda">
                <button class="bg-black text-white p-3 rounded-md hover:bg-gray-600 transition-all">Seguir comprando</button>
            </form>
            <form action="<%=request.getContextPath()%>/carrito/limpiar" method="post">
                <input type="hidden" name="__method__" value="delete">
                <button class="bg-red-600 text-white p-3 rounded-md hover:bg-red-300 transition-all">Limpiar la cesta</button>
            </form>
        </article>
        <article class="flex flex-col gap-5 col-6 text-end">
            <p>Subtotal: <%=carrito.getTotalPedido()%>€</p>
            <form action="<%=request.getContextPath()%>/carrito/comprar" method="post">
                <button class="bg-green-600 text-white p-3 rounded-md hover:bg-green-400 transition-all">Proceder al pago</button>
            </form>
        </article>
    </article>
</section>

<%@include file="../frag/footer.jsp"%>
<script src="https://cdn.tailwindcss.com"></script>
<script>
    tailwind.config = {
        theme: {
            extend: {
            }
        }
    }
</script>
<script src="https://kit.fontawesome.com/0d6cc8454f.js" crossorigin="anonymous"></script>
</body>
</html>

<%}else{%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito</title>
</head>
<body>

<%if(request.getSession().getAttribute("user") == null){%>

<section class="flex items-center px-20 w-full">
    <article class="w1/4">
        <img class="w-60" src="<%=request.getContextPath()%>/img/logo.png" alt="">
    </article>
    <article class="flex justify-end w-full">
        <ul class="flex gap-10 text-xl">
            <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>">Inicio</a></li>
            <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>/nosotros">Sobre nosotros</a></li>
            <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>/tienda">Tienda</a></li>
            <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>/login">Login</a></li>
            <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>/contacto">Contacto</a></li>
        </ul>
    </article>
</section>

<section class="px-20 p-5 ">
    <h1 class="text-4xl mb-6">Mi cesta de la compra</h1>
    <hr>
    <article class="mt-6">
        <p>No hay articulos en la cesta</p>
    </article>
    <article class="grid grid-cols-6 mt-6">
        <article>
            <form action="<%=request.getContextPath()%>/tienda">
                <button class="bg-black text-white p-3 rounded-md hover:bg-gray-600 transition-all">Seguir comprando</button>
            </form>
        </article>
    </article>
</section>
<%@include file="../frag/footer.jsp"%>
<script src="https://kit.fontawesome.com/0d6cc8454f.js" crossorigin="anonymous"></script>
<script src="https://cdn.tailwindcss.com"></script>
<script>
    tailwind.config = {
        theme: {
            extend: {
            }
        }
    }
</script>
</body>
</html>

<%}else{%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito</title>
</head>

<body>
<section class="flex items-center px-20 w-full">
    <article class="w1/4">
        <img class="w-60" src="<%=request.getContextPath()%>/img/logo.png" alt="">
    </article>
    <article class="flex justify-end w-full">
        <ul class="flex gap-10 text-xl">
            <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>">Inicio</a></li>
            <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>/nosotros">Sobre nosotros</a></li>
            <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>/tienda">Tienda</a></li>
            <li><form action="<%=request.getContextPath()%>/logout" method="post"><button class="hover:text-gray-500 transition-all" >Logout</button></form></li>
            <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>/contacto">Contacto</a></li>
        </ul>
    </article>
</section>

<section class="px-20 p-5 ">
    <h1 class="text-4xl mb-6">Mi cesta de la compra</h1>
    <hr>
    <article class="mt-6">
        <p>No hay articulos en la cesta</p>
    </article>
    <article class="grid grid-cols-6 mt-6">
        <article>
            <form action="<%=request.getContextPath()%>/tienda">
                <button class="bg-black text-white p-3 rounded-md hover:bg-gray-600 transition-all">Seguir comprando</button>
            </form>
        </article>
    </article>
</section>
<%@include file="../frag/footer.jsp"%>
<script src="https://kit.fontawesome.com/0d6cc8454f.js" crossorigin="anonymous"></script>
<script src="https://cdn.tailwindcss.com"></script>
<script>
    tailwind.config = {
        theme: {
            extend: {
            }
        }
    }
</script>
</body>
</html>

<%}%>

<%}%>



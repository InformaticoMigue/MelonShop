<%@ page import="java.util.List" %>
<%@ page import="proyectMelon.model.Producto" %>
<%@ page import="proyectMelon.model.Usuario" %>
<%@ page import="proyectMelon.model.Categoria" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<% Usuario u = (Usuario) request.getSession().getAttribute("user");
    if (u == null){%>

        <html>
        <head>
            <title>Productos</title>
        </head>
        <body>
        <style>
            <%@ include file="../../css/tienda/style.css" %>
        </style>
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
                    <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>/carrito"><i class="fa-solid fa-cart-shopping"></i></a></li>            </ul>
            </article>
        </section>


        <section class="flex flex-col items-center justify-center text-white h-40 mb-24 w-full bg-image3">
            <h1 class="text-2xl mb-4">Comprar melones y sandías online</h1>
            <p>Selecciona tus productos</p>
        </section>

        <div class="flex">
            <div class="w-3/4 grid grid-cols-3 px-20 gap-20">

                <% List<Producto> productoList = (List<Producto>) request.getAttribute("productoList");%>
                <% if (productoList != null) {%>


                <% for (Producto producto : productoList) {%>
                <div class="text-left">
                    <figure class="mb-6">
                        <img src="https://images.unsplash.com/photo-1513435160994-a731e7e5cb52?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D">
                    </figure>
                    <div class="flex flex-col gap-4">
                        <h3><%=producto.getNombre()%></h3>
                        <span><%=producto.getCat()%></span>
                        <span class="font-bold"><%=producto.getPrecio()%>€</span>
                    </div>
                    <a class="mt-10 text-xl w-full bg-green-700 h-14 flex items-center justify-center rounded-md text-white" href="<%=application.getContextPath()%>/tienda/<%=producto.getId()%>">Ver detalles </a>
                </div>
                <%  }%>

               <% }%>

            </div>

            <div class="flex flex-col border-l-2 px-20">
                <h1 class="text-2xl text-white bg-categoryColor rounded-md mb-10 p-4">Categorias de los melones</h1>
                <% if (request.getAttribute("listCat") != null)%>
                <% List<Categoria> categorias = (List<Categoria>) request.getAttribute("listCat");%>
                <div class="flex flex-col gap-4 text-xl">
                    <%for(Categoria cat : categorias){ %>
                            <a href="<%=request.getContextPath()%>/tienda/filtrarCat/<%=cat.getNombre()%>"><%=cat.getNombre()%></a>
                    <%}%>
                </div>
            </div>
        </div>

        <%@include file="../frag/footer.jsp" %>

        <script src="https://kit.fontawesome.com/0d6cc8454f.js" crossorigin="anonymous"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <script>
            tailwind.config = {
                theme: {
                    extend: {
                        colors: {
                            categoryColor: "#6aaf08"
                        }
                    }
                }
            }
        </script>

        </body>
        </html>

<% }else{%>

        <html>
        <head>
            <title>Productos</title>
        </head>
        <body>
        <style>
            <%@ include file="../../css/tienda/style.css" %>
        </style>
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
                    <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>/carrito"><i class="fa-solid fa-cart-shopping"></i></a></li>            </ul>
            </article>
        </section>

        <section class="flex flex-col items-center justify-center text-white h-40 mb-24 w-full bg-image3">
            <h1 class="text-2xl mb-4">Comprar melones y sandías online</h1>
            <p>Selecciona tus productos</p>
        </section>

        <div class="flex">
            <div class="w-3/4 grid grid-cols-3 px-20 gap-20">

                <% List<Producto> productoList = (List<Producto>) request.getAttribute("productoList");%>
                <% if (productoList != null) {%>


                <% for (Producto producto : productoList) {%>
                <div class="text-left">
                    <figure class="mb-6">
                        <img src="https://images.unsplash.com/photo-1513435160994-a731e7e5cb52?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D">
                    </figure>
                    <div class="flex flex-col gap-4">
                        <h3 class="title"><%=producto.getNombre()%></h3>
                        <span class="cat"><%=producto.getCat()%></span>
                        <span class="precio font-bold"><%=producto.getPrecio()%>€</span>
                    </div>
                    <a class="mt-10 text-xl w-full bg-green-700 h-14 flex items-center justify-center rounded-md text-white" href="<%=application.getContextPath()%>/tienda/<%=producto.getId()%>">Ver detalles </a>
                </div>
                <%  }%>

                <% }%>

            </div>

            <div class="flex flex-col border-l-2 px-20">
                <h1 class="text-2xl text-white bg-categoryColor rounded-md mb-10 p-4">Categorias de los melones</h1>
                <% if (request.getAttribute("listCat") != null)%>
                <% List<Categoria> categorias = (List<Categoria>) request.getAttribute("listCat");%>
                <div class="flex flex-col gap-4 text-xl">
                    <%for(Categoria cat : categorias){ %>
                    <a href="<%=request.getContextPath()%>/tienda/filtrarCat/<%=cat.getNombre()%>"><%=cat.getNombre()%></a>
                    <%}%>
                </div>
            </div>
        </div>

        <%@include file="../frag/footer.jsp" %>
        <script src="https://kit.fontawesome.com/0d6cc8454f.js" crossorigin="anonymous"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <script>
            tailwind.config = {
                theme: {
                    extend: {
                        colors: {
                            categoryColor: "#6aaf08"
                        }
                    }
                }
            }
        </script>
        </body>
        </html>
<%}%>
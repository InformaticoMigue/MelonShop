<%@ page import="proyectMelon.model.Usuario" %>
<%@ page import="proyectMelon.model.Producto" %>
<%@ page import="java.util.Optional" %>
<%@ page import="proyectMelon.model.Categoria" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% Optional<Producto> p = (Optional<Producto>) request.getAttribute("producto");%>

<% if (p.isPresent()) { %>

    <% Usuario u = (Usuario) request.getSession().getAttribute("user");
        if (u == null){%>
        <!DOCTYPE html>
        <html lang="es">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Detalles del Melón</title>
        </head>
        <body>
        <section class="flex items-center px-20 w-full">
            <article class="w1/4">
                <img class="w-60" src="<%=request.getContextPath()%>/img/logo.png" alt="">
            </article>
            <article class="flex justify-end w-full">
                <ul class="flex gap-10 text-xl">
                    <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>">Inicio</a></li>
                    <li><a class="hover:text-gray-500 transition-all" href="nosotros.jsp">Sobre nosotros</a></li>
                    <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>/tienda">Tienda</a></li>
                    <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>/login">Login</a></li>
                    <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>/contacto">Contacto</a></li>
                    <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>/carrito"><i class="fa-solid fa-cart-shopping"></i></a></li>            </ul>
            </article>
        </section>

        <section class="flex px-20 gap-10 mt-20">
            <article class="flex w-3/4 h-1/3">
                <article class="w-1/2 mr-12">
                    <img src="<%=request.getContextPath()%>/img/00-Melon-Bollo-1-1.webp" alt="">
                </article>
                <article class="w-1/2 flex flex-col gap-10">
                    <h1 class="text-4xl"><%=p.get().getNombre()%></h1>
                    <p class="font-bold text-3xl"><%=p.get().getPrecio()%>€</p>
                    <p class="text-red-800 font-semibold">GASTOS DE ENVIO  INCLUIDOS</p>
                    <p>Stock disponible <%=p.get().getStock()%></p>
                    <form class="flex flex-col gap-4" action="<%=request.getContextPath()%>/login">
                        <%if(p.get().getStock() > 0){%>
                        <div class="w-1/2 flex gap-4">
                            <span class="cursor-pointer plus"><i class="fa-solid fa-plus"></i></span>
                            <input class="text-center w-1/4 cantidad" value="1" readonly>
                            <span class="minus cursor-pointer"><i class="fa-solid fa-minus"></i></span>
                        </div>
                        <button class="text-start flex p-4 bg-categoryColor text-white text-xl w-2/5 mt-4 rounded-sm ">Agregar al carrito</button>
                        <%}else{%>
                        <div>
                            <p>No hay mas stock, proximamente se añadirá mas stock</p>
                        </div>
                        <%}%>
                    </form>
                </article>
            </article>

            <article class="flex w-1/4">
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
            </article>
        </section>

        <section class="px-20 flex flex-col gap-10 mt-10">
            <h1 class="text-4xl">Descripcion: </h1>
            <p class="text-xl"><%=p.get().getDescripcion()%></p>
            <p class="text-xl">IVA y gastos de envio incluidos.</p>
            <p class="text-xl">Los <b>GASTOS DE ENVÍO</b> están incluidos en el producto para todo el territorio nacional peninsular. Para envíos a <b>Baleares y Canarias, póngase en contacto con nosotros</b> y le informaremos del coste adicional.</p>
            <p class="text-xl">El plazo de entrega para territorio nacional peninsular es de <b>24/48 horas</b>, por ese motivo sólo se realizan envíos de lunes a jueves, para evitar que los envíos queden con el producto almacenado durante los fines de semana en las bases de la empresa de transporte.</p>
        </section>
        <%@include file="../../jsp/frag/footer.jsp"%>
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
        <script>
            let plus = document.getElementsByClassName("plus");
            let minus = document.getElementsByClassName("minus")
            let content = document.getElementsByClassName("cantidad")

            plus[0].onclick = () => {
                if (content[0].value < <%=p.get().getStock()%>) {
                    let parseo = parseInt(content[0].value);
                    content[0].value = parseo + 1;
                }
            }
            minus[0].onclick = () => {
                if (content[0].value > 1) {
                    let parseo = parseInt(content[0].value);
                    content[0].value = parseo-1;
                }
            }

        </script>
        <script src="https://kit.fontawesome.com/0d6cc8454f.js" crossorigin="anonymous"></script>

        </body>
        </html>

    <% }else{%>

        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Detalle Producto</title>
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
                    <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>/carrito"><i class="fa-solid fa-cart-shopping"></i></a></li>            </ul>
            </article>
        </section>

        <section class="flex px-20 gap-10 mt-20">
            <article class="flex w-3/4 h-1/3">
                <article class="w-1/2 mr-12">
                    <img src="<%=request.getContextPath()%>/img/00-Melon-Bollo-1-1.webp" alt="">
                </article>
                <article class="w-1/2 flex flex-col gap-10">
                    <h1 class="text-4xl"><%=p.get().getNombre()%></h1>
                    <p class="font-bold text-3xl"><%=p.get().getPrecio()%></p>
                    <p class="text-red-800 font-semibold">GASTOS DE ENVIO  INCLUIDOS</p>
                    <p>Stock disponible <%=p.get().getStock()%></p>

                    <form class="flex flex-col gap-4" action="<%=request.getContextPath()%>/carrito" method="post">
                        <%if(p.get().getStock() > 0){%>
                        <div class="w-1/2 flex gap-4">
                            <span class="cursor-pointer plus"><i class="fa-solid fa-plus"></i></span>
                            <input class="text-center w-1/4 cantidad" name="cant" value="1" readonly>
                            <span class="minus cursor-pointer"><i class="fa-solid fa-minus"></i></span>
                        </div>
                        <input type="hidden" value="<%=p.get().getId()%>" name="idProducto">
                        <button class="text-start flex p-4 bg-categoryColor text-white text-xl w-2/5 mt-4 rounded-sm ">Agregar al carrito</button>
                        <%}else{%>
                        <div>
                            <p>No hay mas stock, proximamente se añadirá mas stock</p>
                        </div>
                        <%}%>
                    </form>
                </article>
            </article>

            <article class="flex w-1/4">
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
            </article>
        </section>

        <section class="px-20 flex flex-col gap-10 mt-10">
            <h1 class="text-4xl">Descripcion: </h1>
            <p class="text-xl"><%=p.get().getDescripcion()%></p>
            <p class="text-xl">IVA y gastos de envio incluidos.</p>
            <p class="text-xl">Los <b>GASTOS DE ENVÍO</b> están incluidos en el producto para todo el territorio nacional peninsular. Para envíos a <b>Baleares y Canarias, póngase en contacto con nosotros</b> y le informaremos del coste adicional.</p>
            <p class="text-xl">El plazo de entrega para territorio nacional peninsular es de <b>24/48 horas</b>, por ese motivo sólo se realizan envíos de lunes a jueves, para evitar que los envíos queden con el producto almacenado durante los fines de semana en las bases de la empresa de transporte.</p>
        </section>
        <%@include file="../../jsp/frag/footer.jsp"%>

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
        <script>
            let plus = document.getElementsByClassName("plus");
            let minus = document.getElementsByClassName("minus")
            let content = document.getElementsByClassName("cantidad")

            plus[0].onclick = () => {
                if (content[0].value < <%=p.get().getStock()%>) {
                    let parseo = parseInt(content[0].value);
                    content[0].value = parseo + 1;
                }
            }
            minus[0].onclick = () => {
                if (content[0].value > 1) {
                    let parseo = parseInt(content[0].value);
                    content[0].value = parseo-1;
                }
            }

        </script>
        </body>
        </html>

    <%}%>

<% } else {
    response.sendRedirect(request.getContextPath() + "/tienda");
}%>
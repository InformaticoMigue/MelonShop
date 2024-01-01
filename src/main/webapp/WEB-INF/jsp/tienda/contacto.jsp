<%if (request.getSession().getAttribute("user") == null){%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contacto</title>
</head>
<body>
<style>
    .bg-image{
        background-image: url("https://melonesgamberro.es/wp-content/uploads/2020/05/cabecera-contacto.jpg");
        background-size: cover;
        background-position: center center;
    }
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

<section class="flex flex-col gap-20">
    <section class="bg-image h-80 flex items-center justify-center flex-col gap-10 text-white">
        <p class="text-4xl font-bold">Siempre cerca de ti</p>
        <p>Contacta con nosotros</p>
    </section>

    <section class="flex flex-col gap-5 w-full px-20 text-center">
        <h1 class="text-4xl font-semibold">Melones Acedo, los del tito Migue</h1>
        <p class="">Del melonar a la mesa</p>
    </section>

    <section class="flex gap-32 justify-center">
        <form action="" class="w-1/2">
            <article class="grid grid-cols-2 w-full gap-10">
                <input type="text"  placeholder="Nombre" class="w-full p-4 bg-gray-200 text-gray-900 border border-gray-200 rounded" name="">
                <input type="text"  placeholder="Telefono" class="w-full p-4 bg-gray-200 text-gray-900 border border-gray-200 rounded" name="">
                <input type="email" placeholder="Correo electronico" class="col-span-full w-full p-4 bg-gray-200 text-gray-900 border border-gray-200 rounded" name="">
                <input type="email" placeholder="Asunto" class="col-span-full w-full p-4 bg-gray-200 text-gray-900 border border-gray-200 rounded" name="">
                <input type="text" placeholder="Mensaje" class="col-span-full w-full p-4 pb-52 bg-gray-200 text-gray-900 border border-gray-200 rounded" name="">

                <article class="col-span-full flex justify-end">
                    <input type="submit" class="cursor-pointer p-3 w-1/5 text-white bg-mainColor   rounded" name="">
                </article>
            </article>
        </form>

        <article class="w-1/4 bg-gray-200 p-10 flex flex-col gap-16 h-1/2 ">
            <article class="flex gap-10">
                <article class="w-1/3 text-center text-6xl text-mainColor">
                    <i class="fa-solid fa-location-dot"></i>
                </article>
                <article class="flex flex-col">
                    <h1>Melones Acedo</h1>
                    <p>Avda/ Jaime I, 24, 12592 Chilches – Malaga</p>
                </article>
            </article>

            <article class="flex gap-10">
                <article class="w-1/3 text-center text-6xl text-mainColor">
                    <i class="fa-solid fa-phone"></i>
                </article>
                <article class="flex flex-col">
                    <h1>Teléfono</h1>
                    <p>666666666</p>
                    <p>*Tambien atendemos por WhatsApp</p>
                </article>
            </article>
            <article class="grid grid-cols-2 text-mainColor text-6xl text-center">
                <a href="https://www.instagram.com/melones"><i class="fa-brands fa-square-instagram"></i></a>
                <a href="https://www.facebook.com/melones"><i class="fa-brands fa-square-facebook"></i></a>
            </article>
        </article>
    </section>

    <iframe class="w-full" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3066.194106842038!2d-0.19165612454981817!3d39.780199094135654!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd6011ab79486fad%3A0x3d88ef5393cb7ddc!2sMelones%20Gamberro!5e0!3m2!1ses!2ses!4v1703268701741!5m2!1ses!2ses" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

    <%@include file="../../jsp/frag/footer.jsp" %>


</section>
<script src="https://kit.fontawesome.com/0d6cc8454f.js" crossorigin="anonymous"></script>
<script src="https://cdn.tailwindcss.com"></script>
<script>
    tailwind.config = {
        theme: {
            extend: {
                colors: {
                    mainColor: "#4fb71f",
                }
            }
        }
    }
</script>

</body>
</html>
<%}else{%>

<html>
<head>
    <title>Contacto</title>
</head>
<body>

<style>
    .bg-image{
        background-image: url("https://melonesgamberro.es/wp-content/uploads/2020/05/cabecera-contacto.jpg");
        background-size: cover;
        background-position: center center;
    }
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
            <li><a class="hover:text-gray-500 transition-all" href="#4">Contacto</a></li>
            <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>/carrito"><i class="fa-solid fa-cart-shopping"></i></a></li>            </ul>
    </article>
</section>

<section class="flex flex-col gap-20">
    <section class="bg-image h-80 flex items-center justify-center flex-col gap-10 text-white">
        <p class="text-4xl font-bold">Siempre cerca de ti</p>
        <p>Contacta con nosotros</p>
    </section>

    <section class="flex flex-col gap-5 w-full px-20 text-center">
        <h1 class="text-4xl font-semibold">Melones Acedo, los del tito Migue</h1>
        <p class="">Del melonar a la mesa</p>
    </section>

    <section class="flex gap-32 justify-center">
        <form action="" class="w-1/2">
            <article class="grid grid-cols-2 w-full gap-10">
                <input type="text"  placeholder="Nombre" class="w-full p-4 bg-gray-200 text-gray-900 border border-gray-200 rounded" name="">
                <input type="text"  placeholder="Telefono" class="w-full p-4 bg-gray-200 text-gray-900 border border-gray-200 rounded" name="">
                <input type="email" placeholder="Correo electronico" class="col-span-full w-full p-4 bg-gray-200 text-gray-900 border border-gray-200 rounded" name="">
                <input type="email" placeholder="Asunto" class="col-span-full w-full p-4 bg-gray-200 text-gray-900 border border-gray-200 rounded" name="">
                <input type="text" placeholder="Mensaje" class="col-span-full w-full p-4 pb-52 bg-gray-200 text-gray-900 border border-gray-200 rounded" name="">

                <article class="col-span-full flex justify-end">
                    <input type="submit" class="cursor-pointer p-3 w-1/5 text-white bg-mainColor   rounded" name="" id="">
                </article>
            </article>
        </form>

        <article class="w-1/4 bg-gray-200 p-10 flex flex-col gap-16 h-1/2 ">
            <article class="flex gap-10">
                <article class="w-1/3 text-center text-6xl text-mainColor">
                    <i class="fa-solid fa-location-dot"></i>
                </article>
                <article class="flex flex-col">
                    <h1>Melones Acedo</h1>
                    <p>Avda/ Jaime I, 24, 12592 Chilches – Malaga</p>
                </article>
            </article>

            <article class="flex gap-10">
                <article class="w-1/3 text-center text-6xl text-mainColor">
                    <i class="fa-solid fa-phone"></i>
                </article>
                <article class="flex flex-col">
                    <h1>Teléfono</h1>
                    <p>666666666</p>
                    <p>*Tambien atendemos por WhatsApp</p>
                </article>
            </article>
            <article class="grid grid-cols-2 text-mainColor text-6xl text-center">
                <a href="https://www.instagram.com/melones"><i class="fa-brands fa-square-instagram"></i></a>
                <a href="https://www.facebook.com/melones"><i class="fa-brands fa-square-facebook"></i></a>
            </article>
        </article>
    </section>

    <iframe class="w-full" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3066.194106842038!2d-0.19165612454981817!3d39.780199094135654!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd6011ab79486fad%3A0x3d88ef5393cb7ddc!2sMelones%20Gamberro!5e0!3m2!1ses!2ses!4v1703268701741!5m2!1ses!2ses" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

    <%@include file="../../jsp/frag/footer.jsp" %>

    <script src="https://kit.fontawesome.com/0d6cc8454f.js" crossorigin="anonymous"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        mainColor: "#4fb71f",
                    }
                }
            }
        }
    </script>
</body>
</html>

<%}%>
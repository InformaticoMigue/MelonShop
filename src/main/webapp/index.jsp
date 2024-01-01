<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% if(request.getSession().getAttribute("user") == null) {%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>MelonShop</title>
</head>
<body>
    <style>
        *{
            scroll-behavior: smooth;
        }
        .bg-image {
            background-image: url("https://melonesgamberro.es/wp-content/uploads/2021/04/venta-online-melones-sandias.jpg");
            background-size: cover;
            background-position: center center;
            height: 600px;
        }
        .bg-image2{
            background-image: url("https://melonesgamberro.es/wp-content/uploads/2021/04/Comprar-Melones-Tienda-Online.jpg");
            background-size: cover;
            height: 600px;
            background-position: center center;
        }
    </style>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                }
            }
        }
    </script>
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

    <section>
        <article class="mt-10 grid grid-rows-2 bg-image bg-cover text-white">
            <article class=" flex flex-col justify-end items-center ">
                <h1 class=" text-6xl font-bold">MELONES ACEDO</h1>
                <p class="mt-10 text-2xl">TIENEN FRESCURA, SABOR Y DULZURA.</p>
                <p class="text-2xl">La fruta del verano por excelencia llega directa desde el melonar a la mesa.</p>
            </article>
            <article class="h-full flex items-center justify-center">
                <a href="#descripcion" class="transform hover:scale-150 transition-transform duration-300 ease-in-out"><i class="text-3xl fa-solid fa-arrow-down-long"></i></a>
            </article>
        </article>
    </section>


    <section id="descripcion" class="gap-10 mt-20 px-40">
        <article class=" flex items-center gap-10">
            <img src="<%=request.getContextPath()%>/img/Header_icon.png" alt="">
            <article class="flex flex-col ">
                <h1 class="text-4xl font-semibold">Descripcion</h1>
                <p>Melones Acedo, del melonar a la mesa</p>
            </article>
        </article>

        <article class="flex flex-col gap-10 text-xl mt-20">
            <p>Nuestro melonar tiene una extensión de 5 hectáreas, 60 hanegadas (seixanta fanecades). Por ese motivo el cultivo de la tierra acaba siendo una actividad familiar y nuestra producción es reducida. Es nuestra manera de garantizar que nuestros melones tienen la calidad que los define. Tenemos sólo los melones que plantamos y cuando los vendemos, terminamos la temporada y descansamos. De nuevo empieza a crecer la ilusión por plantar el año que viene.</p>
        </article>

        <article class="flex flex-col gap-10 text-xl mt-10">
            <p>Los <strong>GASTOS DE ENVÍO</strong> están incluidos en el producto para todo el territorio nacional peninsular. Para envíos a <strong>Baleares y Canarias</strong>, póngase en contacto con nosotros y le informaremos del coste adicional.</p>
            <p>El plazo de entrega para territorio nacional peninsular es de 24/48 horas, por ese motivo sólo se realizan envíos de lunes a jueves, para evitar que los envíos queden con el producto almacenado durante los fines de semana en las bases de la empresa de transporte.            </p>
        </article>
    </section>

    <section class="gap-10 mt-20 px-40">
        <article class=" flex items-center gap-10">
            <img src="<%=request.getContextPath()%>/img/Header_icon.png" alt="">
            <article class="flex flex-col ">
                <h1 class="text-4xl font-semibold">¿Porque nosotros?</h1>
                <p>Melones Acedo, los del tito Migue</p>
            </article>
        </article>
        <article class="grid grid-cols-2 gap-10 m-20 items-center">
            <article class="text-xl flex flex-col gap-5">
                <h1 class="font-sans">¿Qué factores afectan al precio del melón piel de sapo?</h1>
                <p>Uno de los grandes factores que afectan al consumo del melón es sin duda el precio melón piel de sapo. Es un valor clave, tanto para el productor como para el consumidor. Pues bien, vamos a intentar...</p>
            </article>
            <article>
                <img class="w-full" src="<%=request.getContextPath()%>/img/sandia-sin-pepitas-niña.jpg" alt="">
            </article>
            <article>
                <img class="w-full" src="<%=request.getContextPath()%>/img/melones-y-sandias-gamberro-deportista-400x250.jpg" alt="">
            </article>
            <article class="text-xl flex flex-col gap-5">
                <h1 class="font-sans">¿Qué factores afectan al precio del melón piel de sapo?</h1>
                <p>¿Cuál es mi Melon Cantalupo?
                    Los melones cantalupos esta temporada están riquísimos, dulces y refrescantes pero ¿cómo elegir el mejor melon? Os lo contamos… Este año hemos ampliado las variedades de melones, incluyendo tres nuevos...</p><p>
            </p></article>
        </article>
    </section>


    <section class="mt-20">
        <article class="flex flex-col text-center w-full">
            <p class="text-6xl font-bold text-gray-800">MELONES ACEDO</p>
            <p class="mt-7 text-xl">Los del tio Migue</p>
        </article>
        <article class="grid grid-cols-2 gap-20 mt-32">
            <article class="flex justify-end">
                <img src="https://elmonarca.es/wp-content/uploads/2021/10/el-monarca-melon-piel-de-sapo-3.png">
            </article>
            <article class="grid grid-cols-1 grid-rows-4">
                <article class="flex items-center gap-5">
                    <i class="text-5xl text-green-700 fa-solid fa-location-dot"></i>
                    <article class="flex flex-col">
                        <h1>Melones Acedo</h1>
                        <p>Avda/ Jaime I, 24, 12592 Chilches – Malaga</p>
                    </article>
                </article>
                <article class="flex items-center gap-5">
                    <i class="text-5xl text-green-700 fa-solid fa-phone"></i>
                    <article class="flex flex-col">
                        <h1>+34 666666666</h1>
                    </article>
                </article>
                <article class="flex items-center gap-5">
                    <i class="text-5xl text-green-700 fa-solid fa-solid fa-envelope"></i>
                    <article class="flex flex-col">
                        <h1>melonesacedo@gmail.com</h1>
                    </article>
                </article>
                <article class="flex items-center gap-5">
                    <article class="flex gap-10 text-green-700">
                        <a href="https://facebook.com/melones"><i class="text-5xl fa-brands fa-facebook"></i></a>
                        <a href="https://instagram.com/melones"><i class="text-5xl fa-brands fa-instagram"></i></a>
                    </article>
                </article>
            </article>
        </article>
    </section>

    <%@include file="WEB-INF/jsp/frag/footer.jsp" %>

    <script src="https://kit.fontawesome.com/0d6cc8454f.js" crossorigin="anonymous"></script>

</body>
</html>

<%}else {%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
    content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>MelonShop</title>
</head>
<body>
    <style>
        *{
            scroll-behavior: smooth;
        }

        .bg-image {
            background-image: url("https://melonesgamberro.es/wp-content/uploads/2021/04/venta-online-melones-sandias.jpg");
            background-size: cover;
            background-position: center center;
            height: 600px;
        }
        .bg-image2{
            background-image: url("https://melonesgamberro.es/wp-content/uploads/2021/04/Comprar-Melones-Tienda-Online.jpg");
            background-size: cover;
            height: 600px;
            background-position: center center;
        }
    </style>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
            tailwind.config = {
            theme: {
        extend: {
        }
    }
        }
    </script>
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

<section>
    <article class="mt-10 grid grid-rows-2 bg-image bg-cover text-white">
        <article class=" flex flex-col justify-end items-center ">
            <h1 class=" text-6xl font-bold">MELONES ACEDO</h1>
            <p class="mt-10 text-2xl">TIENEN FRESCURA, SABOR Y DULZURA.</p>
            <p class="text-2xl">La fruta del verano por excelencia llega directa desde el melonar a la mesa.</p>
        </article>
        <article class="h-full flex items-center justify-center">
            <a href="#descripcion" class="transform hover:scale-150 transition-transform duration-300 ease-in-out"><i class="text-3xl fa-solid fa-arrow-down-long"></i></a>
        </article>
    </article>
</section>


<section id="descripcion" class="gap-10 mt-20 px-40">
    <article class=" flex items-center gap-10">
        <img src="<%=request.getContextPath()%>/img/Header_icon.png" alt="">
        <article class="flex flex-col ">
            <h1 class="text-4xl font-semibold">Descripcion</h1>
            <p>Melones Acedo, del melonar a la mesa</p>
        </article>
    </article>

    <article class="flex flex-col gap-10 text-xl mt-20">
        <p>Nuestro melonar tiene una extensión de 5 hectáreas, 60 hanegadas (seixanta fanecades). Por ese motivo el cultivo de la tierra acaba siendo una actividad familiar y nuestra producción es reducida. Es nuestra manera de garantizar que nuestros melones tienen la calidad que los define. Tenemos sólo los melones que plantamos y cuando los vendemos, terminamos la temporada y descansamos. De nuevo empieza a crecer la ilusión por plantar el año que viene.</p>
    </article>

    <article class="flex flex-col gap-10 text-xl mt-10">
        <p>Los <strong>GASTOS DE ENVÍO</strong> están incluidos en el producto para todo el territorio nacional peninsular. Para envíos a <strong>Baleares y Canarias</strong>, póngase en contacto con
            y le informaremos del coste adicional.</p>
        <p>El plazo de entrega para territorio nacional peninsular es de 24/48 horas, por ese motivo sólo se realizan envíos de lunes a jueves, para evitar que los envíos queden con el producto almacenado durante los fines de semana en las bases de la empresa de transporte.            </p>
    </article>
</section>


<section class="gap-10 mt-20 px-40">
    <article class=" flex items-center gap-10">
        <img src="<%=request.getContextPath()%>/img/Header_icon.png" alt="">
        <article class="flex flex-col ">
            <h1 class="text-4xl font-semibold">¿Porque nosotros?</h1>
            <p>Melones Acedo, los del tito Migue</p>
        </article>
    </article>
    <article class="grid grid-cols-2 gap-10 m-20 items-center">
        <article class="text-xl flex flex-col gap-5">
            <h1 class="font-sans">¿Qué factores afectan al precio del melón piel de sapo?</h1>
            <p>Uno de los grandes factores que afectan al consumo del melón es sin duda el precio melón piel de sapo. Es un valor clave, tanto para el productor como para el consumidor. Pues bien, vamos a intentar...</p>
        </article>
        <article>
            <img class="w-full" src="<%=request.getContextPath()%>/img/sandia-sin-pepitas-niña.jpg" alt="">
        </article>
        <article>
            <img class="w-full" src="<%=request.getContextPath()%>/img/melones-y-sandias-gamberro-deportista-400x250.jpg" alt="">
        </article>
        <article class="text-xl flex flex-col gap-5">
            <h1 class="font-sans">¿Qué factores afectan al precio del melón piel de sapo?</h1>
            <p>¿Cuál es mi Melon Cantalupo?
                Los melones cantalupos esta temporada están riquísimos, dulces y refrescantes pero ¿cómo elegir el mejor melon? Os lo contamos… Este año hemos ampliado las variedades de melones, incluyendo tres nuevos...</p><p>
        </p></article>
    </article>
</section>


<section class="mt-20">
    <article class="flex flex-col text-center w-full">
        <p class="text-6xl font-bold text-gray-800">MELONES ACEDO</p>
        <p class="mt-7 text-xl">Los del tio Migue</p>
    </article>
    <article class="grid grid-cols-2 gap-20 mt-32">
        <article class="flex justify-end">
            <img src="https://elmonarca.es/wp-content/uploads/2021/10/el-monarca-melon-piel-de-sapo-3.png">
        </article>
        <article class="grid grid-cols-1 grid-rows-4">
            <article class="flex items-center gap-5">
                <i class="text-5xl text-green-700 fa-solid fa-location-dot"></i>
                <article class="flex flex-col">
                    <h1>Melones Acedo</h1>
                    <p>Avda/ Jaime I, 24, 12592 Chilches – Malaga</p>
                </article>
            </article>
            <article class="flex items-center gap-5">
                <i class="text-5xl text-green-700 fa-solid fa-phone"></i>
                <article class="flex flex-col">
                    <h1>+34 666666666</h1>
                </article>
            </article>
            <article class="flex items-center gap-5">
                <i class="text-5xl text-green-700 fa-solid fa-solid fa-envelope"></i>
                <article class="flex flex-col">
                    <h1>melonesacedo@gmail.com</h1>
                </article>
            </article>
            <article class="flex items-center gap-5">
                <article class="flex gap-10 text-green-700">
                    <a href="https://facebook.com/melones"><i class="text-5xl fa-brands fa-facebook"></i></a>
                    <a href="https://instagram.com/melones"><i class="text-5xl fa-brands fa-instagram"></i></a>
                </article>
            </article>
        </article>
    </article>
</section>

    <%@include file="WEB-INF/jsp/frag/footer.jsp" %>

<script src="https://kit.fontawesome.com/0d6cc8454f.js" crossorigin="anonymous"></script>

</body>
</html>
<% }%>
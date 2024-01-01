<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%if (request.getSession().getAttribute("user") == null){%>
<html>
<head>
    <title>Sobre nosotros</title>
</head>
<body>

<style>
    .bg-image{
        background-image: url("https://melonesgamberro.es/wp-content/uploads/2020/05/portada-sobre-nosotros-3.jpg");
        background-position: center center;
        background-size: cover;
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


<section class="h-1/2 mt-10 bg-image mb-20">
    <article class="h-full text-white flex flex-col justify-center items-center ">
            <h1 class="text-6xl font-bold">MELONES ACEDO, los del tio Migue</h1>
            <p class="mt-10 text-2xl">Más de 50 años contigo.</p>
    </article>
</section>

<section class="grid grid-cols-2 px-20 gap-10">
    <article>
        <h1 class="text-center text-xl mb-12">Bienvenidos a Melon Shop: Celebrando 50 Años de Sabor y Tradición</h1>
        <p class="text-justify">En el corazón de la industria de la fruta, Melon Shop ha sido un referente durante cinco décadas, brindando a nuestros clientes la mejor calidad en melones frescos y deliciosos. Desde nuestra humilde apertura en 1973, nos hemos comprometido con la excelencia en cada etapa, desde la cosecha hasta tu mesa.</p>
    </article>
    <article>
        <h1 class="text-center text-xl mb-12">Nuestra Historia</h1>
        <p class="text-justify">La historia de Melon Shop es una de dedicación y pasión por ofrecer lo mejor de la naturaleza en cada bocado. Fundada por un grupo de agricultores visionarios, nuestra tienda ha crecido desde una pequeña parada en el mercado local hasta convertirse en un emblema regional. A lo largo de los años, hemos cultivado relaciones sólidas con agricultores locales, garantizando la frescura y calidad de cada melón que llega a nuestras instalaciones.</p>
    </article>
    <article>
        <h1 class="text-center text-xl mb-12">Compromiso con la Calidad</h1>
        <p  class="text-justify">En Melon Shop, creemos que la calidad es la clave de nuestra longevidad. Seleccionamos cuidadosamente cada melón para asegurarnos de que cumpla con nuestros estándares rigurosos. Nuestros expertos agricultores emplean técnicas tradicionales y métodos innovadores para cultivar melones jugosos y llenos de sabor. Nos enorgullece ofrecer a nuestros clientes productos que destacan por su frescura y autenticidad.</p>
    </article>
    <article>
        <h1 class="text-center text-xl mb-12">Variedad para Todos los Gustos</h1>
        <p class="text-justify">Entendemos que cada cliente es único, al igual que sus preferencias de sabor. En Melon Shop, ofrecemos una amplia variedad de melones para satisfacer todos los gustos. Desde el clásico melón cantalupo hasta exquisitas variedades de temporada, nuestra selección garantiza una experiencia gastronómica diversa y emocionante para cada paladar.</p>
    </article>
    <article>
        <h1 class="text-center text-xl mb-12">Sostenibilidad y Responsabilidad Social</h1>
        <p class="text-justify">Como custodios de la tierra, nos comprometemos a operar de manera sostenible y ética. Trabajamos en estrecha colaboración con agricultores locales que comparten nuestra visión de cuidar el medio ambiente. Desde prácticas agrícolas responsables hasta envases ecoamigables, buscamos reducir nuestro impacto en el planeta y contribuir a comunidades más saludables.</p>
    </article>
    <article>
        <h1 class="text-center text-xl mb-12">Nuestro Equipo</h1>
        <p class="text-justify">Detrás de cada melón que llega a tu mesa, hay un equipo dedicado de personas apasionadas por su trabajo. Desde nuestros agricultores hasta el personal de atención al cliente, todos en Melon Shop comparten el mismo compromiso con la excelencia y la satisfacción del cliente. Nos esforzamos por crear un ambiente de trabajo colaborativo donde cada miembro contribuye al éxito continuo de nuestra empresa.</p>
    </article>
    <article class="col-span-full">
        <h1 class="text-center text-xl mb-12">Celebrando el Pasado y Mirando hacia el Futuro</h1>
        <p class="text-justify">A medida que celebramos nuestros 50 años de servicio, en Melon Shop reflexionamos sobre nuestro pasado con gratitud y anticipamos un futuro lleno de innovación y crecimiento. Agradecemos a nuestros fieles clientes que han hecho posible este viaje, y esperamos continuar sirviendo melones frescos y deliciosos durante las próximas décadas.
            En Melon Shop, no solo vendemos melones; compartimos una historia de sabor, calidad y compromiso. Únete a nosotros en este viaje frutal y descubre por qué somos la elección de confianza para los amantes de los melones desde 1973.
        </p>
    </article>
</section>

<%@include file="../frag/footer.jsp"%>

<script src="https://kit.fontawesome.com/0d6cc8454f.js" crossorigin="anonymous"></script>
</body>
</html>

<%}else{%>

<html>
<head>
    <title>Sobre nosotros</title>
</head>
<body>

<style>
    .bg-image{
        background-image: url("https://melonesgamberro.es/wp-content/uploads/2020/05/portada-sobre-nosotros-3.jpg");
        background-position: center center;
        background-size: cover;
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
            <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>/contacto">Contacto</a></li>
            <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>/carrito"><i class="fa-solid fa-cart-shopping"></i></a></li>            </ul>
    </article>
</section>

<section class="h-1/2 mt-10 bg-image ">
    <article class="h-full text-white flex flex-col justify-center items-center ">
        <h1 class="text-6xl font-bold">MELONES ACEDO, los del tio Migue</h1>
        <p class="mt-10 text-2xl">Más de 50 años contigo.</p>
    </article>
</section>

<section class="grid grid-cols-2 px-20 gap-10 mt-20">
    <article>
        <h1 class="text-center text-xl mb-12">Bienvenidos a Melon Shop: Celebrando 50 Años de Sabor y Tradición</h1>
        <p class="text-justify">En el corazón de la industria de la fruta, Melon Shop ha sido un referente durante cinco décadas, brindando a nuestros clientes la mejor calidad en melones frescos y deliciosos. Desde nuestra humilde apertura en 1973, nos hemos comprometido con la excelencia en cada etapa, desde la cosecha hasta tu mesa.</p>
    </article>
    <article>
        <h1 class="text-center text-xl mb-12">Nuestra Historia</h1>
        <p class="text-justify">La historia de Melon Shop es una de dedicación y pasión por ofrecer lo mejor de la naturaleza en cada bocado. Fundada por un grupo de agricultores visionarios, nuestra tienda ha crecido desde una pequeña parada en el mercado local hasta convertirse en un emblema regional. A lo largo de los años, hemos cultivado relaciones sólidas con agricultores locales, garantizando la frescura y calidad de cada melón que llega a nuestras instalaciones.</p>
    </article>
    <article>
        <h1 class="text-center text-xl mb-12">Compromiso con la Calidad</h1>
        <p  class="text-justify">En Melon Shop, creemos que la calidad es la clave de nuestra longevidad. Seleccionamos cuidadosamente cada melón para asegurarnos de que cumpla con nuestros estándares rigurosos. Nuestros expertos agricultores emplean técnicas tradicionales y métodos innovadores para cultivar melones jugosos y llenos de sabor. Nos enorgullece ofrecer a nuestros clientes productos que destacan por su frescura y autenticidad.</p>
    </article>
    <article>
        <h1 class="text-center text-xl mb-12">Variedad para Todos los Gustos</h1>
        <p class="text-justify">Entendemos que cada cliente es único, al igual que sus preferencias de sabor. En Melon Shop, ofrecemos una amplia variedad de melones para satisfacer todos los gustos. Desde el clásico melón cantalupo hasta exquisitas variedades de temporada, nuestra selección garantiza una experiencia gastronómica diversa y emocionante para cada paladar.</p>
    </article>
    <article>
        <h1 class="text-center text-xl mb-12">Sostenibilidad y Responsabilidad Social</h1>
        <p class="text-justify">Como custodios de la tierra, nos comprometemos a operar de manera sostenible y ética. Trabajamos en estrecha colaboración con agricultores locales que comparten nuestra visión de cuidar el medio ambiente. Desde prácticas agrícolas responsables hasta envases ecoamigables, buscamos reducir nuestro impacto en el planeta y contribuir a comunidades más saludables.</p>
    </article>
    <article>
        <h1 class="text-center text-xl mb-12">Nuestro Equipo</h1>
        <p class="text-justify">Detrás de cada melón que llega a tu mesa, hay un equipo dedicado de personas apasionadas por su trabajo. Desde nuestros agricultores hasta el personal de atención al cliente, todos en Melon Shop comparten el mismo compromiso con la excelencia y la satisfacción del cliente. Nos esforzamos por crear un ambiente de trabajo colaborativo donde cada miembro contribuye al éxito continuo de nuestra empresa.</p>
    </article>
    <article class="col-span-full">
        <h1 class="text-center text-xl mb-12">Celebrando el Pasado y Mirando hacia el Futuro</h1>
        <p class="text-justify">A medida que celebramos nuestros 50 años de servicio, en Melon Shop reflexionamos sobre nuestro pasado con gratitud y anticipamos un futuro lleno de innovación y crecimiento. Agradecemos a nuestros fieles clientes que han hecho posible este viaje, y esperamos continuar sirviendo melones frescos y deliciosos durante las próximas décadas.
            En Melon Shop, no solo vendemos melones; compartimos una historia de sabor, calidad y compromiso. Únete a nosotros en este viaje frutal y descubre por qué somos la elección de confianza para los amantes de los melones desde 1973.
        </p>
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
<%}%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registrarse</title>

</head>
<body>
    <section class="flex items-center  px-20 w-full">
        <article class="w1/4">
            <img class="w-60" src="<%=request.getContextPath()%>/img/logo.png" alt="">
            </article>
        <article class="flex justify-end w-full">
            <ul class="flex gap-10 text-xl">
                <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>">Inicio</a></li>
                <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>/nosotros">Sobre nosotros</a></li>
                <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>/tienda">Tienda</a></li>
                <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>/contacto">Contacto</a></li>
                <li><a class="hover:text-gray-500 transition-all" href="<%=request.getContextPath()%>/carrito"><i class="fa-solid fa-cart-shopping"></i></a></li>            </ul>
        </article>
    </section>


    <section class="mt-10 flex justify-center">
    <form action="<%=request.getContextPath()%>/sigin" class="w-full max-w-lg" method="post">
        <div class="flex flex-wrap -mx-3 mb-6">
            <div class="w-full px-3 mb-6 md:mb-0">
                <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2">
                    Nombre de usuario
                </label>
                <input required name="username" class="appearance-none block w-full bg-gray-200 text-gray-700 border rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white" type="text" placeholder="erMakina">
            </div>

            <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
                <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2">
                    Nombre
                </label>
                <input required name="nombre" class="appearance-none block w-full bg-gray-200 text-gray-700 border rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white" type="text" placeholder="Federico">
            </div>
            <div class="w-full md:w-1/2 px-3">
                <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2">
                    Apellidos
                </label>
                <input  required name="apellidos" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-last-name" type="text" placeholder="Avellano Núñez">
            </div>
        </div>

        <div class="w-full mb-6 md:mb-0">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2">
                Email
            </label>
            <input required name="email" class="appearance-none block w-full bg-gray-200 text-gray-700 border rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white" type="email" placeholder="example@gmail.com">
        </div>

        <div class="flex flex-wrap -mx-3 mb-6">
            <div class="w-full px-3">
                <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2">
                    Password
                </label>
                <input required name="password" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password" type="password" placeholder="******************">
                <p class="text-gray-600 text-xs italic">Haz la contraseña mas complicada y larga posible</p>
            </div>
        </div>

        <div class="flex flex-wrap -mx-3 mb-6">
            <div class="w-full px-3">
                <input type="submit" value="Enviar" class="bg-green-200 py-3 px-4 cursor-pointer w-full transition duration-300 rounded-md hover:bg-green-400">
            </div>
        </div>
    </form>
    </section>

    <section class="flex justify-center gap-6">
        <span>¿Ya tienes una cuenta?</span>
        <a href="<%=request.getContextPath()%>/login">Login</a>
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

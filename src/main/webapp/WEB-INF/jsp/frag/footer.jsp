<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<section class="bg-slate-800 grid gap-10 grid-cols-3 justify-center mt-20">
    <article class="m-20">
        <h1 class="text-white text-2xl mb-5">Contacta con nosotros</h1>
        <img class="mb-5" src="<%=request.getContextPath()%>/img/forma-pago-melones-sandias.png" alt="">
        <article class="flex  flex-col gap-5">
            <article class="flex items-center gap-2">
                <i class="text-green-700 fa-solid fa-phone-flip"></i>
                <p class="text-white">+34 666666666</p>
            </article>
            <article class="flex items-center gap-2">
                <i class="text-green-700 fa-solid fa-location-dot"></i>
                <p class="text-white"> Melones Acedo
                    Avda/ Jaime I, 24
                    12592 Chilches (Malaga)
                </p>
            </article>
            <article class="flex items-center gap-2">
                <i class="text-green-700 fa-solid fa-solid fa-envelope"></i>
                <p class="text-white" >migueacedo@gmail.com</p>
            </article>
        </article>
    </article>
    <article class="m-20">
        <h1 class="text-white text-2xl mb-10">Acciones interesantes</h1>
        <article class="flex  flex-col gap-5">
            <article class="flex items-center gap-2">
                <i class="text-green-700 fa-solid fa-square-check"></i>
                <a class="text-white" href="<%=request.getContextPath()%>/tienda">Tienda</a>
            </article>
            <article class="flex items-center gap-2">
                <i class="text-green-700 fa-solid fa-square-check"></i>
                <a class="text-white" href="https://instagram.com/melones">Instagram</a>
            </article>
            <article class="flex items-center gap-2">
                <i class="text-green-700 fa-solid fa-square-check"></i>
                <a class="text-white" href="https://facebook.com/melones">Facebook</a>
            </article>
            <article class="flex items-center gap-2">
                <i class="text-green-700 fa-solid fa-square-check"></i>
                <a class="text-white" href="https://x.com/melones">Twitter</a>
            </article>
        </article>
    </article>
    <article class="m-20">
        <h1 class="text-white text-2xl mb-10">Enlaces de interes</h1>
        <article class="flex  flex-col gap-5">
            <article class="flex items-center gap-2">
                <i class="text-green-700 fa-solid fa-square-check"></i>
                <a class="text-white" href="#">Politica de privacidad</a>
            </article>
            <article class="flex items-center gap-2">
                <i class="text-green-700 fa-solid fa-square-check"></i>
                <a class="text-white" href="#">Cambios y devoluciones</a>
            </article>
            <article class="flex items-center gap-2">
                <i class="text-green-700 fa-solid fa-square-check"></i>
                <a class="text-white" href="#">Terminos y condiciones</a>
            </article>
            <article class="flex items-center gap-2">
                <i class="text-green-700 fa-solid fa-square-check"></i>
                <a class="text-white" href="#">Politica de cookies</a>
            </article>

            <article class="flex items-center gap-2">
                <i class="text-green-700 fa-solid fa-square-check"></i>
                <a class="text-white" href="#">Más información sobre las cookies</a>
            </article>

            <article class="flex items-center gap-2">
                <i class="text-green-700 fa-solid fa-square-check"></i>
                <a class="text-white" href="#">Aviso legal</a>
            </article>
        </article>
    </article>
</section>
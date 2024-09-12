<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recuperar Contraseña</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="/FarmaciaWeb/CSS/NewContrase.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="icon-container">
            <div class="icon-circle">
                <img src="/FarmaciaWeb/Imagenes/lo-removebg-preview.png" alt="Ícono" class="icon" /> 
            </div>
        </div>
        <div class="container">
            <form action="/FarmaciaWeb/CtrProductoLi?accion=ActualizarCont" method="post">
            <h1>Cambie su Contraseña</h1>
            <input type="hidden" name="id" id="id" value="${id}">
            <label><b>digite contraseña</b><input type="password" placeholder="Contraseña" id="contra" name="contra" class="password" /></label><br>
            <label> <b> confimar contraseña</b><input type="password2" placeholder="Contraseña2" id="contra2" name="contra2" class="password" /></label>
            <button type="submit">Cambiar</button>
            </form>
        </div>
        <button class="barra-button">
            <span class="barra-text">Volver al login</span>
            <span class="barra-icon">&#9664;</span>
        </button>
    </body>
</html>
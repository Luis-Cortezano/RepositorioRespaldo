<%-- 
    Document   : HomePageAdm
    Created on : 28/08/2024, 07:58:08 AM
    Author     : SENA
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrito</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link href="/FarmaciaWeb/CSS/PQR.css" rel="stylesheet" type="text/css"/>
        <link href="/FarmaciaWeb/CSS/style.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="/FarmaciaWeb/JS/scripts.js" type="text/javascript"></script>
        <link href="/FarmaciaWeb/CSS/carritocliente.css" rel="stylesheet" type="text/css"/>
       
    </head>
    <%
        if (session.getAttribute("log") == null || session.getAttribute("log").equals('0')) {
            response.sendRedirect("../Vistas/LogginPage.jsp");
        }

    %>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light navbar-custom">
            <a class="navbar-brand" href="/FarmaciaWeb/CtrProductoLi?accion=home">
                <img src="/FarmaciaWeb/Imagenes/lo-removebg-preview.png" class="icon" width="60px" height="60px"/>
                Farmacia yasbel
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <form class="form-inline my-2 my-lg-0 mr-auto" action="/FarmaciaWeb/CtrProductoLi?accion=buscar" method="post">
                    <input class="form-control mr-sm-2" type="search" placeholder="Buscar productos..." aria-label="Search" name="busqueda">
                    <button class="btn-search my-2 my-sm-0" type="submit">
                        <div class="original">BUSCAR</div>

                    </button>
                </form>

                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle nav-text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="bi bi-person"></i> Mi Cuenta
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item text-center" href="#"><i class="bi bi-person"></i></a>
                            <a class="dropdown-item " >${usuario.getUsunombre()}</a>
                            <a class="dropdown-item " >${usuario.getUsutipo()}</a>
                            <a class="dropdown-item"  data-bs-toggle="modal" data-bs-target="#exampleModal">PQR</a>
                            <a class="dropdown-item text-danger" href="/FarmaciaWeb/CtrProductoLi?accion=salir">Cerrar Sesion</a>

                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-text-white" href="CtrProductoLi?accion=Carrito">
                            <i class="bi bi-cart-check-fill"></i> Carrito
                            (<label style="color: darkorange">${contador}</label>)

                        </a>
                    </li>
                </ul>
            </div>
        </nav>
        <br>
        <br>
        <br>
        <br>
<div class="container mt-5">
    <h1 class="main-title text-center">Tu Carrito</h1>
    <div class="product-container d-flex flex-wrap justify-content-start">
        <table class="table table-hover table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Item</th>
                    <th>Producto</th>
                    <th>Descripción</th>
                    <th>Precio</th>
                    <th>Descuento</th>
                    <th>Cantidad</th>
                    <th>Subtotal</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="car" items="${carrito}">
                    <tr>
                        <td>${car.getItem()}</td>
                        <td>
                            <div class="d-flex align-items-center">
                                <img src="${car.getFoto()}" width="80" height="80" class="img-thumbnail mr-2">
                                <span class="product-name">${car.getNombre()}</span>
                            </div>
                        </td>
                        <td>${car.getDescripcion()}</td>
                        <td>${car.getPreciocompra()}</td>
                        <td>${producto.getDescuento()}</td>
                        <td>
                            <input type="hidden" id="idp" value="${car.getIdproducto()}">
                            <input type="number" id="cantidad" value="${car.getCantidad()}" class="form-control text-center"  max="${car.getStock()}">
                        </td>
                        <td>${car.getSubtotal()}</td>
                        <td>
                            <input type="hidden" id="idpro" class="idpro" value="${car.getIdproducto()}">
                            <a class="btn btn-outline-danger btn-round btndeletecar" href="#" id="btndeletecar">
                                <i class="bi bi-trash"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table> 
    </div>

    <!-- Información de pago -->
    <form action="/FarmaciaWeb/CtrProductoLi?accion=pedido" method="post">
        <input type="hidden" name="idusu" value="${usuario.getUsuid()}">
        <input type="hidden" name="stock" value="${usuario.getUsuid()}">
        <input type="hidden" name="totalp" value="${totalpagar}">
        <div class="card-body">
            <label>Subtotal:</label>
            <input type="text" value="${totalpagar}" readonly="" class="form-control mb-2">
            <label>Descuento:</label>
            <input type="text" value="${descuento}" readonly="" class="form-control mb-2">
            <label>Total:</label>
            <input type="text" value="${total}" readonly="" class="form-control mb-2">
        </div>

        
        <div class="formulario_grupo-input mb-3">
            <select class="form-control formulario_input" name="tipos" id="tipos">
                <option value="Efectivo">Efectivo</option>
                <option value="Tranferencia">Tranferencia</option>
            </select>
        </div>

        <div class="card-footer">
            <button type="submit" class="btn btn-success btn-block" onclick="ejecutarTarea()">Generar Pedido</button>
        </div>
    </form>
</div>



        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel" >Sistema de PQR</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"  ><i class="bi bi-x-lg"></i></button>
                    </div>
                    <div class="modal-body">
                        <form action="/FarmaciaWeb/CtrPQR?accion=CrearPQR" method="POST" >
                            <div class="form-group">
                                <label for="name"> Nombre</label>
                                <input id="name" name="nombre" class="nombre" type="text" placeholder="Ingrese su nombre">
                            </div>
                            <div class="form-group">
                                <label for="email"> Correo electrónico</label>
                                <input id="email" name="correo" type="email"  class="email" placeholder="Ingrese su correo">
                            </div>
                            <div class="form-group">
                                <label for="phone"> Teléfono</label>
                                <input id="telefono" class="telefono" name="telefono" type="text" placeholder="Ingrese su teléfono">
                            </div>
                            <div class="form-group">
                                <label for="type"> Tipo de solicitud</label>
                                <select id="type" name="tipo" class="tipo">
                                    <option value="" disabled selected>Seleccione una opción</option>
                                    <option value="peticion">Petición</option>
                                    <option value="queja">Queja</option>
                                    <option value="consulta">Consulta</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="hidden" name="id" id="id" value="${usuario.getUsuid()}">
                                <label for="description"> Descripción de la solicitud</label>
                                <textarea id="descripcion" class="descripcion" name="descripcion" placeholder="Ingrese los detalles de su solicitud"></textarea>

                            </div>
                        </form>
                    </div>
                    <div class="modal-footer" id="modal">
                        <p>Si el problema persiste, llame a la linea +123-456-789</p>
                    </div>
                </div>
            </div>
        </div>
    </body>
    
   
   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="/FarmaciaWeb/JS/EliminarCarrito.js" type="text/javascript"></script>
    <script>
                            function ejecutarTarea() {
                                document.getElementById("MensajeEspera").style.display = "block";
                                $('#reloj').modal('show');
                            }
    </script>
</body>
</html>
<%-- 
    Document   : ConfmPedido
    Created on : 10/09/2024, 10:48:32 PM
    Author     : HOME
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Confirmacion de pedido</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link href="/FarmaciaWeb/CSS/PQR.css" rel="stylesheet" type="text/css"/>
        <link href="/FarmaciaWeb/CSS/style.css" rel="stylesheet" type="text/css"/>

    </head>

    <body>


        <nav class="navbar navbar-expand-lg navbar-light navbar-custom">
            <a class="navbar-brand" href="/FarmaciaWeb/CtrProductoLi?accion=home">
                <img src="/FarmaciaWeb/Imagenes/lo-removebg-preview.png" class="icon" width="60" height="60" alt="Farmacia Yasbel"/>
                Farmacia Yasbel
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
                            <a class="dropdown-item" href="/FarmaciaWeb/CtrProductoLi?accion=historial">Historial Pedido</a>
                            <a class="dropdown-item"  data-bs-toggle="modal" data-bs-target="#exampleModal">PQR</a>
                            <a class="dropdown-item text-danger" href="/FarmaciaWeb/CtrProductoLi?accion=salir">Cerrar Sesion</a>

                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-text-white" href="CtrProductoLi?accion=carro">
                            <i class="bi bi-cart-check-fill"></i> Carrito
                            (<label style="color: darkorange">${contador}</label>)
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle nav-text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="bi bi-bookmark"></i> Comprar por categorías
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <c:forEach var="c" items="${categorias}">
                                <a class="dropdown-item" href="/FarmaciaWeb/CtrProductoLi?accion=buscarcat&catid=${c.getCatCodigo()}">
                                    <i class="bi bi-bookmarks"></i> ${c.getCatNombre()}
                                </a>
                            </c:forEach>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        <br>
        <br>
        <br>
        <br>

        <main class="container my-5">
            <h2 class="text-center mb-4" style="color: #559D46;">Confirmación de Pedido</h2>
            
            <form action="/FarmaciaWeb/CtrProductoLi?accion=pedido" method="post">
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="nombre" class="form-label" style="color: #559D46;">Nombre de la persona que recibe</label>
                        <input type="text" class="form-control" id="nombre" placeholder="${usuario.getUsunombre()}" required>
                    </div>
                    <div class="col-md-6">
                        <label for="telefono" class="form-label" style="color: #559D46;">${usuario.getUsutelefono()}</label>
                        <input type="text" class="form-control" id="telefono" placeholder="Número de contacto" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="direccion" class="form-label" style="color: #559D46;">${usuario.getUsudireccion()}</label>
                    <input type="text" class="form-control" id="direccion" placeholder="Dirección completa" required>
                </div>

                
                <h4 class="mt-4" style="color: #559D46;">Productos Seleccionados</h4>
                <ul class="list-group mb-3">
                    <c:forEach var="car" items="${carrito}">
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        ${car.getNombre()}
                        <span class="badge bg-success rounded-pill">${car.getPreciocompra()}</span>
                    </li>
                    </c:forEach>
                </ul>
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h5 class="text-muted">Total:</h5>
                    <h5 class="fw-bold" style="color: #559D46;">${totalpagar}</h5>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn" style="background-color: #559D46; color: white;" onclick="ejecutarTarea()">Confirmar Pedido</button>
                </div>
            </form>
        </main>
                <footer class="py-5 bg-dark text-white" id="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <h5 class="footer-heading">Información</h5>
                        <p class="footer-text">Dirección: Calle 51d#2g63</p>
                        <p class="footer-text">Teléfono: 324 6794400</p>
                    </div>
                    <div class="col-md-4">
                        <h5 class="footer-heading">Métodos de Pago</h5>
                        <div class="payment-methods">
                            <a href="#"><img src="../img/nequi.png" alt="Nequi" class="payment-icon"></a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <h5 class="footer-heading">Redes Sociales</h5>
                        <div class="social-links">
                            <a href="#" class="social-link"><i class="bi bi-facebook"></i> Facebook</a><br>
                            <a href="#" class="social-link"><i class="bi bi-instagram"></i> Instagram</a>
                        </div>
                    </div>
                </div>
                <div class="footer-bottom mt-4">
                    <p class="footer-text">Tu salud, nuestra prioridad. Descubre la comodidad de cuidarte desde casa con nuestra droguería en línea. Expertos en bienestar a solo un clic.</p>
                    <div class="footer-buttons">
                        <a href="#" class="btn btn-light footer-btn">Términos de servicio</a>
                        <a href="#" class="btn btn-light footer-btn">Política de privacidad</a>
                    </div>
                </div>
            </div>
        </footer>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Sistema de PQR</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="/FarmaciaWeb/CtrPQR?accion=CrearPQR" method="POST">
                            <div class="form-group">
                                <label for="name">Nombre</label>
                                <input id="name" name="nombre" class="nombre" type="text" placeholder="Ingrese su nombre">
                            </div>
                            <div class="form-group">
                                <label for="email">Correo electrónico</label>
                                <input id="email" name="correo" type="email" class="email" placeholder="Ingrese su correo">
                            </div>
                            <div class="form-group">
                                <label for="phone">Teléfono</label>
                                <input id="telefono" class="telefono" name="telefono" type="text" placeholder="Ingrese su teléfono">
                            </div>
                            <div class="form-group">
                                <label for="type">Tipo de solicitud</label>
                                <select id="type" name="tipo" class="tipo">
                                    <option value="" disabled selected>Seleccione una opción</option>
                                    <option value="peticion">Petición</option>
                                    <option value="queja">Queja</option>
                                    <option value="consulta">Consulta</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="hidden" name="id" id="id" value="${usuario.getUsuid()}">
                                <label for="description">Descripción de la solicitud</label>
                                <textarea id="descripcion" class="descripcion" name="descripcion" placeholder="Ingrese los detalles de su solicitud"></textarea>
                            </div>
                            <button type="submit" name="accion" value="CrearPQR" class="button">Enviar</button>
                        </form>
                    </div>
                    <div class="modal-footer" id="modal">
                        <p>Si el problema persiste, llame a la línea +123-456-789</p>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
         <script>
                            function ejecutarTarea() {
                                document.getElementById("MensajeEspera").style.display = "block";
                                $('#reloj').modal('show');
                            }
    </script>
    </body>
</html>

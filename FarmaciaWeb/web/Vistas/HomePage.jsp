<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
              <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Farma-online</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

        <link href="/FarmaciaWeb/CSS/PQR.css" rel="stylesheet" type="text/css"/>
        <link href="/FarmaciaWeb/CSS/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <%-- Session check --%>
        <%
            if (session.getAttribute("log") == null || session.getAttribute("log").equals('0')) {
                response.sendRedirect("../Vistas/LogginPage.jsp");
            }
        %>

        <!-- Navbar -->
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
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="carousel-content">
                        <img class="d-block w-100 large-image" src="/FarmaciaWeb/Imagenes/farmacia-la-botica.jpg" alt="First slide">
                        <div class="mini-images">
                            <img class="mini-image" src="/FarmaciaWeb/Imagenes/farmacia-la-botica.jpg" alt="Mini First slide">
                        </div>
                    </div>
                    <div class="carousel-caption d-none d-md-block">
                        <div class="promo-banner">
                            <span>HEY! <strong>2x1</strong> En medicamentos!</span>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="carousel-content">
                        <img class="d-block w-100 large-image" src="/FarmaciaWeb/Imagenes/regencia.jpg" alt="Second slide">
                        <div class="mini-images">
                            <img class="mini-image" src="/FarmaciaWeb/Imagenes/regencia.jpg" alt="Mini Second slide">
                        </div>
                    </div>
                    <div class="carousel-caption d-none d-md-block">
                        <div class="promo-banner">

                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="carousel-content">
                        <img class="d-block w-100 large-image" src="/FarmaciaWeb/Imagenes/regencia.jpg" alt="Third slide">
                        <div class="mini-images">
                            <img class="mini-image" src="/FarmaciaWeb/Imagenes/regencia.jpg" alt="Mini Third slide">
                        </div>
                    </div>
                    <div class="carousel-caption d-none d-md-block">
                        <div class="promo-banner">
                            <span>HEY! <strong>2x1</strong> En medicamentos!</span>
                        </div>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <br>
        <br>
       <div class="offer-banner"> 
    <p class="offer-text">Explora nuestros <span class="discount">15% de Descuento</span> en la Farmacia Yasbel</p>
    <div class="offer-cards">
        <c:forEach var="prod" items="${descuento}">
            <div class="offer-card">
                <div class="card-header">
                    <img src="${prod.getProFoto()}" class="card-image" alt="${prod.getProNombre()}">
                    <div class="discount-badge">${prod.getProDescuento()}%</div>
                </div>
                <h5 class="card-title">${prod.getProNombre()}</h5>
                <p class="card-text">${prod.getProDescripcion()}</p>
                <p class="card-price">$${prod.getProPrecio()}</p>
                <div class="card-buttons">
                    <a href="/FarmaciaWeb/CtrProductoLi?accion=Comprar&id=${prod.getProCodigo()}" class="btn btn-primary">Comprar</a>
                    <a href="/FarmaciaWeb/CtrProductoLi?accion=AgregarCarrito&id=${prod.getProCodigo()}" class="btn btn-secondary">Agregar al carrito</a>
                </div>
            </div>
        </c:forEach>
    </div>
    <div class="rotating-light"></div>
    <div class="carousel-controls">
        <button class="carousel-prev">&lt;</button>
        <button class="carousel-next">&gt;</button>
    </div>
</div>


        <br>            
        <!-- Products Section -->
        <section id="productos" class="product-container">
            <div class="container">
                <div class="row">
                    <c:forEach var="prod" items="${productos}">
                        <div class="col-md-3 col-sm-6 mb-4"> 
                            <div class="card h-100">
                                <img src="${prod.getProFoto()}" class="card-img-top" alt="${prod.getProNombre()}">
                                <div class="card-body d-flex flex-column">
                                    <h5 class="card-title">${prod.getProNombre()}</h5>
                                    <p class="card-text">${prod.getProDescripcion()}</p>
                                    <p class="card-text">$${prod.getProPrecio()}</p>
                                    <div class="mt-auto">
                                        <a href="/FarmaciaWeb/CtrProductoLi?accion=Comprar&id=${prod.getProCodigo()}"  class="btn btn-primary">Comprar</a>
                                        <a href="/FarmaciaWeb/CtrProductoLi?accion=AgregarCarrito&id=${prod.getProCodigo()}" class="btn btn-primary">Agregar al carrito</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>

        <!-- Footer -->
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

        <!-- Scripts -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
        <script src="/FarmaciaWeb/JS/Ofertas_home.js" type="text/javascript"></script>
    </body>
</html>

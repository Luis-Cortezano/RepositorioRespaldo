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
                            <a class="dropdown-item" href="/FarmaciaWeb/CtrProductoLi?accion=historial&id=${usuario.getUsuid()}">Historial Pedido</a>
                             <a class="dropdown-item" href="/FarmaciaWeb/CtrUsuarioCre?accion=editarusuario&id=${usuario.getUsuid()}">Editar Info</a>
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

                </ul>
            </div>
        </nav>
        <br><br><br><br>
        <!-- Contenedor de categorías debajo del navbar -->
        <div class="categories-section">
            <div class="container">
                <h2 class="categories-heading">Explora nuestras categorías</h2>
                <div class="categories-row">
                    <c:forEach var="c" items="${categorias}">
                        <a class="category-item" href="/FarmaciaWeb/CtrProductoLi?accion=buscarcat&catid=${c.getCatCodigo()}">
                            <i class="bi bi-bookmarks"></i> ${c.getCatNombre()}
                        </a>
                    </c:forEach>
                </div>
            </div>
        </div>

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
                            <span><strong>Tu salud es primero</strong></span>
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
                            <span><strong>Tu salud es primero</strong></span>
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
                            <span><strong>Tu salud es primero</strong></span>
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
        <div class="offer-banner">
            <p class="offer-text">Explora nuestros <span class="discount">Descuento</span> en la Farmacia Yasbel</p>
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
        <footer class="py-5" style="background-color: #357c28; color: #ffffff;" id="footer">
    <div class="container">
        <div class="row">
            <!-- Información -->
            <div class="col-md-4 mb-3">
                <h5 class="footer-heading" style="color: #000;">Información</h5>
                <p class="footer-text">Dirección: Calle 51d#2g63</p>
                <p class="footer-text">Teléfono: 324 6794400</p>
            </div>
            <!-- Métodos de Pago -->
            <div class="col-md-4 mb-3">
                <h5 class="footer-heading" style="color: #000;">Métodos de Pago</h5>
                <div class="payment-methods">
                    <a href="#"><img src="data:image/png;base64,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" alt="Nequi" class="payment-icon" style="width: 100px;"></a>
                </div>
            </div>
            <!-- Redes Sociales -->
            <div class="col-md-4 mb-3">
                <h5 class="footer-heading" style="color: #000;">Redes Sociales</h5>
                <div class="social-links">
                    <a href="https://facebook.com" class="social-link" style="color: #000;">
                        <img src="data:image/jpeg;base64,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" alt="Facebook" class="social-icon" style="width: 24px; vertical-align: middle; margin-right: 8px;"> Facebook
                    </a><br>
                    <a href="https://instagram.com" class="social-link" style="color: #000;">
                        <img src="data:image/jpeg;base64,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" alt="Instagram" class="social-icon" style="width: 24px; vertical-align: middle; margin-right: 8px;"> Instagram
                    </a>
                </div>
            </div>
        </div>
        <div class="footer-bottom mt-4">
            <p class="footer-text" style="color: #ffffff;">Tu salud, nuestra prioridad. Descubre la comodidad de cuidarte desde casa con nuestra droguería en línea. Expertos en bienestar a solo un clic.</p>
            <div class="footer-buttons">
                <a href="#" class="btn btn-light footer-btn" style="background-color: #559d46; color: #ffffff;">Términos de servicio</a>
                <a href="#" class="btn btn-light footer-btn" style="background-color: #559d46; color: #ffffff;">Política de privacidad</a>
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

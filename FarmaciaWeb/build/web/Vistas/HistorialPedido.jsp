<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Historial de pedidos</title>
        <!-- Bootstrap CSS -->
        <title>Farma-online</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

        <link href="/FarmaciaWeb/CSS/PQR.css" rel="stylesheet" type="text/css"/>
        <link href="/FarmaciaWeb/CSS/style.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="/FarmaciaWeb/CSS/Gestionpedido.css" rel="stylesheet" type="text/css"/>
        <link href="/FarmaciaWeb/CSS/GestionPedidoAdm.css" rel="stylesheet" type="text/css"/>
        <link href="/FarmaciaWeb/CSS/Gestion.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>

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
                            <a class="dropdown-item text-warnig" href="/FarmaciaWeb/CtrProductoLi?accion=admi">Gestion Administrador</a>
                            <a class="dropdown-item text-danger" href="/FarmaciaWeb/CtrProductoLi?accion=salir">Cerrar Sesion</a>

                        </div>
                    </li>

                </ul>
            </div>
        </nav>
        <!-- Espacio entre el navbar y el contenido -->
        <br>
        <br>
        <br>
        <br>
        <div class="mt-4 container">
            <header class="mb-4">
                <h1>Historial de pedidos</h1>
                <p>Aquí puedes ver el estado, precio y procesamiento de tus pedidos.</p>
            </header>

            <div class="table-responsive">
                <table class="table table-hover">
                    <thead class="table-light">
                        <tr>
                            <th>ID</th>
                            <th>Estado</th>
                            <th>Precio</th>
                            <th>Fecha</th>
                            <th>Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="ped" items="${pedido}">
                            <tr>
                                <td>${ped.getPedCodigo()}</td>
                                <td><span class="badge bg-warning text-dark">${ped.getPedEstado()}</span></td>
                                <td>${ped.getPedTotal()}</td>
                                <td>${ped.getPedFecha()}</td>
                                <td>
                                    <a class="btn btn-outline-primary btn-sm" href="/FarmaciaWeb/CtrProductoLi?accion=EditarDet&idpro=${ped.getPedCodigo()}" data-bs-toggle="modal" data-bs-target="#orderModal">
                                        Ver detalles
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="orderModal" tabindex="-1" aria-labelledby="orderModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="orderModalLabel">Detalles del Pedido</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-6">
                                    <label>Nombre del producto</label>
                                    <input type="text" class="form-control" name="txtnombre" placeholder="Nombre" value="${detalles.getDpdNombreProducto()}" readonly>
                                </div>
                                <div class="col-6">
                                    <label>Precio unitario</label>
                                    <input type="number" class="form-control" name="txtprecio" placeholder="Precio" value="${detalles.getDpdPrecioUnitario()}" readonly>
                                </div>
                                <div class="col-6">
                                    <label>Cantidad</label>
                                    <input type="text" class="form-control" name="txtcantidad" placeholder="Cantidad" value="${detalles.getDpdCantidad()}" readonly>
                                </div>
                                <div class="col-6">
                                    <label>Fecha</label>
                                    <input type="text" class="form-control" name="txtfecha" placeholder="Fecha" value="${detalles.getDpdFecha()}" readonly>
                                </div>
                                <div class="col-6">
                                    <label>Precio total</label>
                                    <input type="text" class="form-control" name="txttotal" placeholder="Total" value="${detalles.getDpdPrecioTotal()}" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Incluye Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">


    <!-- Bootstrap JS (y dependencias de Popper.js) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../JS/IndexAdmin.js" type="text/javascript"></script>

    <script>
        function setModalDetails(orderId) {
            document.getElementById('orderDetails').innerText = 'Detalles del pedido: ' + orderId;
        }
    </script>
</body>
</html>

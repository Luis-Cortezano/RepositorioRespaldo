<%-- 
    Document   : pqradmin
    Created on : 26/08/2024, 11:20:41 AM
    Author     : SENA
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index Admin</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
        <link href="/FarmaciaWeb/CSS/PQRAdmin.css" rel="stylesheet" type="text/css"/>
        <link href="/FarmaciaWeb/CSS/PQR.css" rel="stylesheet" type="text/css"/>
        <link href="/FarmaciaWeb/CSS/IndexAdmin.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3 sidebar">
                    <div class="header d-flex justify-content-between align-items-center mb-3">
                        <a href="/FarmaciaWeb/CtrProductoLi?accion=home" class="logo d-flex align-items-center text-light">
                            <i class="bi bi-box"></i>
                            Farmacia Yasbel
                        </a>
                        <button class="notification-btn btn btn-link text-light">
                            <i class="bi bi-bell" style="font-size: 24px; color: white;"></i>
                            <span class="sr-only">Toggle notifications</span>
                        </button>
                    </div>
                    <nav class="nav">
                        <!-- Collapsible Section -->
                        <div class="collapsible">
                            <button class="collapsible-trigger">
                                Gestión de Productos
                                <i class="bi bi-chevron-right" style="font-size: 24px; color: white;"></i>

                            </button>
                            <div class="collapsible-content">
                                <a href="/FarmaciaWeb/CtrProductoLi?accion=inventario" class="collapsible-link submenu-btn">Inventario</a>
                                <a href="/FarmaciaWeb/CtrProductoLi?accion=gestion" class="collapsible-link submenu-btn">Procesamiento de Pedidos</a>
                                <a href="/FarmaciaWeb/CtrUsuarioCre?accion=Listar" class="collapsible-link submenu-btn">Gestión de Clientes</a>
                                <a href="/FarmaciaWeb/CtrProductoLi?accion=Listaradm" class="collapsible-link submenu-btn">Gestion de Productos</a>
                                <a href="/FarmaciaWeb/CtrPQR?accion=listarPQR" class="collapsible-link submenu-btn">PQR</a>
                                <a href="/FarmaciaWeb/CtrProveedores?accion=listarProveedores" class="collapsible-link submenu-btn">Proveedores</a>
                            </div>
                        </div>
                    </nav>
                </div>
                <div class="col-md-9 main-content">
                    <header class="header d-flex justify-content-between align-items-center mb-3">
                        <a href="#" class="menu-toggle btn btn-link">
                            <!-- Usando el icono de Bootstrap -->
                            <i class="bi bi-house" style="font-size: 24px; color: white;"></i>

                            <span class="sr-only">Home</span>
                        </a>
                        <form class="search-form d-flex">
                            <input type="search" class="form-control" placeholder="Buscar productos...">
                            <svg class="icon search-icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="11" cy="11" r="8"/>
                            <path d="m21 21-4.3-4.3"/>
                            </svg>
                        </form>
                        <div class="user-menu">
                            <button class="user-btn btn btn-link">
                                <img src="https://www.w3schools.com/w3images/avatar2.png" width="32" height="32" alt="Avatar" class="avatar">
                                <span class="sr-only">Toggle user menu</span>
                            </button>
                            <div class="user-menu-content">
                                <a class="dropdown-item " >${usuario.getUsunombre()}</a>
                                <a class="dropdown-item " >${usuario.getUsutipo()}</a>
                                <a class="dropdown-item text-danger" href="/FarmaciaWeb/CtrProductoLi?accion=salir">Cerrar Sesion</a>
                            </div>
                        </div>
                    </header>
                    <main class="main">
                        <div class="container mt-5">
                            <h1 class="mb-4">PQR Realizadas</h1>
                            <div class="table-container">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Código</th>
                                            <th>ID de Usuario</th>
                                            <th>Fecha</th>
                                            <th>Nombre</th>
                                            <th>Correo</th>
                                            <th>Teléfono</th>
                                            <th>Tipo</th>
                                            <th>Descripción</th>
                                            <th>Estado</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <c:forEach var="pqr" items="${pqr}">
                                            <tr>
                                                <td>${pqr.getPqrCodigo()}</td>
                                                <td>${pqr.getTblUsuID()}</td>
                                                <td>${pqr.getPqrFecha()}</td>
                                                <td>${pqr.getPqrNombre()}</td>
                                                <td>${pqr.getPqrCorreo()}</td>
                                                <td>${pqr.getPqrTelefono()}</td>
                                                <td>${pqr.getPqrTipo()}</td>
                                                <td>${pqr.getPqrDescripcion()}</td>
                                                <td>${pqr.getPqrEstado()}</td>
                                                <td class="text-center border">
                                                    <input type="hidden" class="idpqr" value="${pqr.getPqrCodigo()}">
                                                    <a class="btn" style="background-color: #74BD64" href="CtrPQR?accion=Estado&idp=${pqr.pqrCodigo}">
                                                        <i class="bi bi-envelope-check"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </main>
                </div>
            </div>
        </div>
        <!-- Bootstrap JS, Popper.js, and jQuery -->
        <!-- SweetAlert CDN -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>  
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="/FarmaciaWeb/JS/IndexAdmin.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>  
        <script src="/FarmaciaWeb/JS/EliminarPQR.js" type="text/javascript"></script>
    </body>
</html>

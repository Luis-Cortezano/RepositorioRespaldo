<%-- 
    Document   : IndexAdmin
    Created on : 20/08/2024, 10:44:21 AM
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
        <link href="/FarmaciaWeb/CSS/IndexAdmin.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3 sidebar">
                    <div class="header d-flex justify-content-between align-items-center mb-3">
                        <a href="/FarmaciaWeb/CtrProductoLi?accion=home" class="logo d-flex align-items-center text-light">
                            <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M3 9h18v10a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V9Z"/>
                            <path d="m3 9 2.45-4.9A2 2 0 0 1 7.24 3h9.52a2 2 0 0 1 1.8 1.1L21 9"/>
                            <path d="M12 3v6"/>
                            </svg>
                            Farmacia Yasbel
                        </a>
                        <button class="notification-btn btn btn-link text-light">
                            <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M6 8a6 6 0 0 1 12 0c0 7 3 9 3 9H3s3-2 3-9"/>
                            <path d="M10.3 21a1.94 1.94 0 0 0 3.4 0"/>
                            </svg>
                            <span class="sr-only">Toggle notifications</span>
                        </button>
                    </div>
                    <nav class="nav">

                        <!-- Collapsible Section -->
                        <div class="collapsible">
                            <button class="collapsible-trigger">
                                Gestión de Productos
                                <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="m9 18 6-6-6-6"/>
                                </svg>
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
                            <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M3 9h18v10a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V9Z"/>
                            <path d="m3 9 2.45-4.9A2 2 0 0 1 7.24 3h9.52a2 2 0 0 1 1.8 1.1L21 9"/>
                            <path d="M12 3v6"/>
                            </svg>
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
                                <img src="/placeholder.svg" width="32" height="32" alt="Avatar" class="avatar">
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
                        <h1>Panel de Administración</h1>
                        <div class="table-container">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Producto</th>
                                        <th>Disponibilidad</th>
                                        <th>Vendidos</th>
                                        
                                        <th>fecha de vencimiento</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="prod" items="${productos}">
                                        <tr>
                                            <td>${prod.getProNombre()}</td>
                                            <td>${prod.getProStok()}</td>
                                            <td>${prod.getProVendido()}</td>
                                            <td>${prod.getProFechaVencimiento()}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>

                            </table>
                        </div>
                    </main>
                </div>
            </div>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="/FarmaciaWeb/JS/IndexAdmin.js" type="text/javascript"></script>
    </body>
</html>

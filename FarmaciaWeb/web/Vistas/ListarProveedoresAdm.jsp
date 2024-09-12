<%-- 
    Document   : ListarProveedoresAdm
    Created on : 7/09/2024, 07:50:03 PM
    Author     : HOME
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Proveedores</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
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
                                                <div class="user-menu">
                            <button class="user-btn btn btn-link">
                                <img src="https://www.w3schools.com/w3images/avatar2.png" width="32" height="32" alt="Avatar" class="avatar">
                                <span class="sr-only">Toggle user menu</span>
                            </button>
                            <div class="user-menu-content">
                                <div class="user-menu-label">Mi Cuenta</div>
                                <div class="user-menu-separator"></div>
                                <a href="#" class="user-menu-item">Cerrar sesión</a>
                            </div>
                        </div>
                    </header>
                    <main class="main">
                        <h3 class="title">Yasbel Drugs - Listar de Proveedores</h3>
                        <div class="container mt-5 border" style="border-radius: 15px">
                            <div class="row">
                                <div class="col-sm-4"></div>
                                <div class="col-sm-4"></div>
                                <div class="col-sm-4">
                                    <form class="form-inline mt-4" action=" ">
                                        <div class="form-group mx-sm-3 mb-2">
                                            <input type="text" class="form-control" name="busqueda" placeholder="digite nombre">
                                        </div>
                                        <button type="submit" class="btn btn-success mb-2" name="accion" value="buscarn"><i class="bi bi-search"></i> Buscar</button>
                                    </form>
                                </div>
                            </div>
                            <table class="table table-bordered">
                                <thead class="thead-light border">
                                    <tr table-success>
                                        <th scope="col" class="text-center border" width="110">
                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#agregarProveedorModal">
                                                Agregar Proveedor
                                            </button>
                                        <th scope="col" colspan="7" class="text-center border">Proveedores </th>
                                    </tr>
                                    <tr>
                                        <th scope="col" class="text-center border">Id</th>
                                        <th scope="col" class="text-center border">Nombre</th>
                                        <th scope="col" class="text-center border">Direccion</th>
                                        <th scope="col" class="text-center border">Ciudad</th>
                                        <th scope="col" class="text-center border">Correo</th>
                                        <th scope="col" class="text-center border">Telefono</th>
                                        <th scope="col" class="text-center border">Contacto</th>
                                        <th scope="col" class="text-center border">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="prov" items="${proveedores}">
                                        <tr>
                                            <th scope="row" class="border">${prov.getId()}</th>
                                            <td class="border">${prov.getNombre()}</td>
                                            <td class="border">${prov.getDireccion()}</td>
                                            <td class="border">${prov.getCiudad()}</td>
                                            <td class="border">${prov.getCorreo()}</td>
                                            <td class="border">${prov.getTelefono()}</td>
                                            <td class="border">${prov.getContacto()}</td>
                                            <td scope="col" class ="text-center border">
                                                <input type="hidden" name="idprov" class="idprov" id="idprov" value="${prov.getId()}">
                                                <a class="btn btn-warning" href="/FarmaciaWeb/CtrProveedores?accion=editarvedore&idprov=${prov.getId()}">
                                                    <i class="bi bi-pencil-fill"></i>
                                                </a> </br> </br>
                                                <a class="btn btn-danger btndelete" id="btndelete" href="#"><i class="bi bi-trash-fill"></i></a>

                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </main>
                </div>
            </div>
        </div>
        
                                  <!-- Modal para agregar un nuevo proveedor -->
        <div class="modal fade" id="agregarProveedorModal" tabindex="-1" role="dialog" aria-labelledby="agregarProveedorModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="agregarProveedorModalLabel">Agregar Nuevo Proveedor</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="/FarmaciaWeb/CtrProveedores?accion=Agregar" method="post">
                            <div class="form-group">
                                <label for="txtnombre">Nombre</label>
                                <input type="text" class="form-control" id="txtnombre" name="txtnombre" required>
                            </div>
                            <div class="form-group">
                                <label for="txtdireccion">Dirección</label>
                                <input type="text" class="form-control" id="txtdireccion" name="txtdireccion" required>
                            </div>
                            <div class="form-group">
                                <label for="txtciudad">Ciudad</label>
                                <input type="text" class="form-control" id="txtciudad" name="txtciudad" required>
                            </div>
                            <div class="form-group">
                                <label for="txtcorreo">Correo</label>
                                <input type="email" class="form-control" id="txtcorreo" name="txtcorreo" required>
                            </div>
                            <div class="form-group">
                                <label for="txtelefono">Teléfono</label>
                                <input type="number" class="form-control" id="txtelefono" name="txtelefono" required>
                            </div>
                            <div class="form-group">
                                <label for="txtcontacto">Contacto</label>
                                <input type="text" class="form-control" id="txtcontacto" name="txtcontacto" required>
                            </div>
                            <button type="submit" class="btn btn-success">Agregar Proveedor</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
       <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="/FarmaciaWeb/JS/EliminarProveedor.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>                        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>  
        <script src="/FarmaciaWeb/JS/IndexAdmin.js" type="text/javascript"></script>
    </body>
</html>

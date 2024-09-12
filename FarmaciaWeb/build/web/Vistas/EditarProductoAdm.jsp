<%-- 
    Document   : AdminiatracionProductos
    Created on : 20/08/2024, 10:39:58 AM
    Author     : SENA
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Yasbel Drugs - Administración de Productos</title>
        <link href="/FarmaciaWeb/CSS/Gestion.css" rel="stylesheet" type="text/css"/>
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
                    <form class="form-sing" action="/FarmaciaWeb/CtrProductoLi?accion=actualizarpro" method="POST" >

                        <div class="form-row">
                            <div class="col-6">
                                <label>Nombre</label> 
                                <input type="hidden" class="form-control" name="txtid" id="txtid" value="${Productoe.getProCodigo()}"> 
                                <input type="text" class="form-control" name="txtnombre" placeholder="nombre" required="" value="${Productoe.getProNombre()}">
                            </div>  
                            <div class="col-6">
                                <label>Proovedores</label> 
                                <select class="form-control" name="proovedores">
                                    <c:forEach var="prod" items="${proveedores}">
                                        <option value="${prod.getId()}">${prod.getNombre()}</option>
                                    </c:forEach>
                                </select>
                                <input type="hidden" class="form-control" name="prov" id="prov" value="${Productoe.getTblProverdores()}"> 
                            </div>
                            <div class="col-6">
                                <label>Precio</label> 
                                <input type="number" class="form-control" name="txtprecio" placeholder="precio" required="" value="${Productoe.getProPrecio()}">
                            </div>
                            <div class="col-6">
                                <label>Descuento</label> 
                                <input type="text" class="form-control" name="txtdescuento" placeholder="descuento" required="" value="${Productoe.getProDescuento()}">
                            </div>
                            <div class="col-6">
                                <label>Marca</label> 
                                <input type="text" class="form-control" name="txtmarca" placeholder="marca" required="" value="${Productoe.getProMarca()}">
                            </div>
                            <div class="col-6">
                                <label>Descripcion</label> 
                                <input type="text" class="form-control" name="txtdescripcion" placeholder="descripcion" required="" value="${Productoe.getProDescripcion()}">
                            </div>
                            <div class="col-6">
                                <label>Fecha vencimiento</label> 
                                <input type="date" class="form-control" name="txtfechavencimiento" placeholder="fecha" required="" value="${Productoe.getProFechaVencimiento()}">
                            </div>
                            <div class="col-6">
                                <label>Stock</label> 
                                <input type="number" class="form-control" name="txtstock" placeholder="stock" required="" value="${Productoe.getProStok()}"> 
                            </div>
                            <div class="col-6">
                                <label>Categoria</label> 
                                <select class="form-control" name="categoria" id="categoriaSelect" onchange="actualizarInputsOcultos(this)" value="${Productoe.getTblCategoria()}">
                                    <c:forEach var="cat" items="${categorias}">
                                        <option value="${cat.getCatCodigo()}" data-nombre="${cat.getCatNombre()}">${cat.getCatNombre()}</option>
                                    </c:forEach>
                                </select>

                                <!-- Campo oculto para el código de la categoría -->
                                <input type="hidden" class="form-control" name="cat" id="cat" value="${Productoe.getTblCategoria()}"> 

                                <!-- Campo oculto para el nombre de la categoría -->
                                <input type="hidden" class="form-control" name="catNombre" id="catNombre">

                                <script>
                                    // Función para actualizar tanto el código como el nombre de la categoría
                                    function actualizarInputsOcultos(selectElement) {
                                        var selectedOption = selectElement.options[selectElement.selectedIndex];

                                        // Actualizar el valor del código de la categoría
                                        var inputOcultoCodigo = document.getElementById("cat");
                                        inputOcultoCodigo.value = selectElement.value;

                                        // Actualizar el valor del nombre de la categoría
                                        var inputOcultoNombre = document.getElementById("catNombre");
                                        inputOcultoNombre.value = selectedOption.getAttribute("data-nombre");
                                    }

                                    // Inicializar los valores cuando se cargue la página
                                    document.addEventListener('DOMContentLoaded', function () {
                                        var selectElement = document.getElementById("categoriaSelect");
                                        actualizarInputsOcultos(selectElement); // Actualiza con la categoría cargada
                                    });
                                </script>
                            </div>
                            <div class="col-6">
                                <label>Imagen</label> 
                                <input type="file" class="form-control" name="foto" id="foto" onchange="actualizarInputOculto2(this)">
                                <input type="hidden" class="form-control" value="${Productoe.getProFoto()}" name="foto2" id="foto2">
                                <script>
                                    function actualizarInputOculto2(selectElement) {
                                        var inputOculto = document.getElementById("foto2");
                                        var filePath = selectElement.value;
                                        var fileName = filePath.split('\\').pop().split('/').pop(); // Esto obtiene el nombre del archivo
                                        inputOculto.value = "Imagenes/" + fileName;
                                        //inputOculto.value = "Imagenes/" + selectElement.value;
                                    }
                                </script>
                            </div>
                        </div>    

                        <center>
                            <button type="submit" class="btn btn-primary mt-4 mb-2 formulario_btn" name="btnagregar" value="Agregar">Agregar <i class="bi bi-floppy"></i></button>
                            <a class="btn btn-danger formulario_btn mt-4 mb-2" name="regresar" href="/FarmaciaWeb/CtrProductoLi?accion=Listaradm">Regresar <i class="bi bi-box-arrow-left"></i></a>
                        </center>

                    </form>
                </div>
            </div>
        </div>
        <!-- Bootstrap JS, Popper.js, and jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="/FarmaciaWeb/JS/IndexAdmin.js" type="text/javascript"></script>

    </body>
</html>

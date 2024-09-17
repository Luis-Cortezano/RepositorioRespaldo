/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import static Controlador.CtrUsuarioCre.encriptarcontrasena;
import Modelo.Carrito;
import Modelo.Categoria;
import Modelo.CategoriaDAO;
import Modelo.DetallePedido;
import Modelo.DetallePedidoDAO;
import Modelo.PQR;
import Modelo.PQRDAO;
import Modelo.Pedidos;
import Modelo.PedidosDAO;
import Modelo.Producto;
import Modelo.ProductoDAO;
import Modelo.Proveedores;
import Modelo.ProveedoresDAO;
import Modelo.Usuario;
import Modelo.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SENA
 */
public class CtrProductoLi extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    ProductoDAO pdao = new ProductoDAO();
    CategoriaDAO cdao = new CategoriaDAO();
    PedidosDAO pedao = new PedidosDAO();
    List<Producto> list = pdao.listarT();
    List<Producto> productos = new ArrayList();
    List<CategoriaDAO> categoria = new ArrayList();
    List<Carrito> listacarrito = new ArrayList();
    List<Pedidos> pedidos = new ArrayList();
    Usuario us;
    List<Pedidos> listapedido = new ArrayList();
    List<DetallePedido> listadetped = new ArrayList();
    List<Proveedores> proveedores = new ArrayList();
    Proveedores prove = new Proveedores();
    ProveedoresDAO prodDao = new ProveedoresDAO();
    Pedidos ped = new Pedidos();
    DetallePedidoDAO dpdao = new DetallePedidoDAO();
    PedidosDAO peddao = new PedidosDAO();
    UsuarioDAO usudao = new UsuarioDAO();
    Carrito car;
    SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
    List<Categoria> listaCategorias = new ArrayList();
    Categoria categ = new Categoria();
    DetallePedido ddd = new DetallePedido();
    List<Producto> proDescuento = new ArrayList();
    List<Usuario> usuarioList = new ArrayList();

    int cantidad;
    Date fechavencimiento;
    int idp;
    int subtotal;
    int item;
    int total;
    Date dat;
    Date dato;

    int totalpagar, idusu;
    String nom, des, foto, fec, estado, idcliente, id, marca, fechaven, esss;
    int descuent;

    int pre, sto, cat, mon, idcli, provee;
    Date d = new Date();
    int descuento;
    int decuentototal = 0;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        String accion = request.getParameter("accion");
        System.out.println("accion= " + accion);
        HttpSession sesion = request.getSession();
        productos = pdao.listarS();
        categoria = cdao.listar();
        pedidos = pedao.listarT();

        System.out.println("producto " + productos.get(0).getProFoto());
        Producto p = new Producto();
        request.setAttribute("contador", listacarrito.size());
        switch (accion) {

            case "home":

                request.setAttribute("categorias", categoria);
                System.out.println("categoria " + categoria.size());
                request.setAttribute("productos", productos);
                proDescuento = pdao.listarDesc();
                request.setAttribute("descuento", proDescuento);
                System.out.println("producto " + productos.size());
                System.out.println("tipo " + sesion.getAttribute("tipo"));
                if (sesion.getAttribute("tipo") != null) {
                    if (sesion.getAttribute("tipo").equals("Administrador")) {
                        System.out.println("entro en administador");
                        request.getRequestDispatcher("Vistas/HomePageAdm.jsp").forward(request, response);
                    } else {
                        if (sesion.getAttribute("tipo").equals("Usuario")) {
                            request.getRequestDispatcher("Vistas/HomePage.jsp").forward(request, response);
                        }
                    }
                } else {
                    System.out.println("entro en inicio");
                    request.getRequestDispatcher("Vistas/HomePage.jsp").forward(request, response);
                }

                break;
            case "buscarcat":
                int idcat = Integer.parseInt(request.getParameter("catid"));
                productos = pdao.buscarCateg(idcat);
                request.setAttribute("categorias", categoria);
                request.setAttribute("productos", productos);

                if (sesion.getAttribute("tipo").equals("Usuario")) {
                    request.getRequestDispatcher("Vistas/HomePage.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("Vistas/HomePageAdm.jsp").forward(request, response);
                }
                break;
            case "buscar":
                String nombre = request.getParameter("busqueda");
                productos = pdao.buscarN(nombre);
                request.setAttribute("categorias", categoria);
                request.setAttribute("productos", productos);

                if (sesion.getAttribute("tipo").equals("Administrador")) {
                    request.getRequestDispatcher("Vistas/HomePageAdm.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("Vistas/HomePage.jsp").forward(request, response);
                }

                break;
            case "buscarn":
                nombre = request.getParameter("busqueda");
                System.out.println("nombre: " + nombre);
                productos = pdao.buscarN(nombre);
                request.setAttribute("categorias", categoria);
                request.setAttribute("productos", productos);
                System.out.println("prodductos" + productos);
                request.getRequestDispatcher("Vistas/ListarProductoAdm.jsp").forward(request, response);
                /* if (sesion.getAttribute("tipo").equals("Administrador")) {
                    request.getRequestDispatcher("Vistas/ListarProductoAdm.jsp").forward(request, response);
                }
               if (request.getParameter("busqueda") == null) {
                    response.sendRedirect("/FarmaciaWeb/Vistas/HomePage.jsp?busqued=0");
                }*/
                break;

            case "busquedaF":
                String fech = request.getParameter("fecha");
                dat = formatoFecha.parse(fech);
                java.sql.Date fechaVencimientoSql1 = new java.sql.Date(dat.getTime());

                String fech2 = request.getParameter("fecha2");
                dato = formatoFecha.parse(fech2);
                java.sql.Date fechaVencimientoSql3 = new java.sql.Date(dato.getTime());

                productos = pdao.buscarPorFecha(fechaVencimientoSql1, fechaVencimientoSql3);
                System.out.println("productos" + productos.size());
                request.setAttribute("productos", productos);
                request.getRequestDispatcher("Vistas/InventarioAdm.jsp").forward(request, response);
                //request.getRequestDispatcher("CtrProductoLi?accion=inventario").forward(request, response);
                break;

            case "salir":

                sesion.invalidate();
                response.sendRedirect("/FarmaciaWeb/Vistas/LogginPage.jsp");
                break;

            case "AgregarCarrito":
                System.out.println("agregar carrito");
                cantidad = 1;
                int pos = 0;
                descuento = 0;

                idp = Integer.parseInt(request.getParameter("id"));
                p = pdao.listaridp(idp);
                if (listacarrito.size() > 0) {
                    for (int i = 0; i < listacarrito.size(); i++) {
                        if (idp == listacarrito.get(i).getIdproducto()) {
                            pos = i;
                        }
                    }
                    if (idp == listacarrito.get(pos).getIdproducto()) {
                        cantidad = cantidad + listacarrito.get(pos).getCantidad();
                        if (listacarrito.get(pos).getDescuento() > 0) {
                            descuento = descuento + (listacarrito.get(pos).getDescuento() * listacarrito.get(pos).getPreciocompra() / 100);
                            decuentototal = decuentototal + descuento * cantidad;
                            listacarrito.get(pos).setDescuento(decuentototal);

                        }

                        subtotal = cantidad * listacarrito.get(pos).getPreciocompra();

                        listacarrito.get(pos).setCantidad(cantidad);
                        listacarrito.get(pos).setSubtotal(subtotal);
                        //total = subtotal - decuentototal;
                        System.out.println("total a pagar #1 : " + total);

                    } else {
                        item++;
                        car = new Carrito();
                        car.setItem(item);
                        car.setIdproducto(idp);
                        car.setNombre(p.getProNombre());
                        car.setDescripcion(p.getProDescripcion());
                        car.setFoto(p.getProFoto());
                        car.setPreciocompra(p.getProPrecio());
                        car.setCantidad(cantidad);
                        car.setStock(p.getProStok());
                        car.setSubtotal(cantidad * p.getProPrecio());
                        System.out.println("p descuento: " + p.getProDescuento());
                        if (p.getProDescuento() > 0) {
                            car.setDescuento(cantidad * p.getProDescuento() * p.getProPrecio() / 100);
                            System.out.println("descuento carrito  : " + car.getDescuento());
                            decuentototal = decuentototal + car.getDescuento();
                            System.out.println("decuento total pagar:" + decuentototal);
                        }
                        //total = car.getSubtotal() - decuentototal;
                        System.out.println("subtotal total : " + car.getSubtotal());
                        System.out.println("total a pagar #2 : " + total);
                        listacarrito.add(car);
                    }
                } else {
                    item++;
                    car = new Carrito();
                    car.setItem(item);
                    car.setIdproducto(idp);
                    car.setNombre(p.getProNombre());
                    car.setDescripcion(p.getProDescripcion());
                    car.setFoto(p.getProFoto());
                    car.setPreciocompra(p.getProPrecio());
                    car.setCantidad(cantidad);
                    car.setStock(p.getProStok());
                    car.setSubtotal(cantidad * p.getProPrecio());
                    System.out.println("descuento producto: " + p.getProDescuento());
                    System.out.println("cantidad : " + cantidad);
                    System.out.println("precio : " + p.getProPrecio());
                    System.out.println("descuento total: " + cantidad * p.getProDescuento() * p.getProPrecio() / 100);
                    if (p.getProDescuento() > 0) {
                        car.setDescuento(cantidad * p.getProDescuento() * p.getProPrecio() / 100);
                        decuentototal = decuentototal + car.getDescuento();
                        System.out.println("descuento carrito  : " + car.getDescuento());

                        System.out.println("decuento total pagar:" + decuentototal);
                    } else {

                    }
                    //  total = car.getSubtotal() - decuentototal;
                    System.out.println("total a pagar #3 : " + total);
                    listacarrito.add(car);
                }

                request.setAttribute("contador", listacarrito.size());
                request.setAttribute("totalpagar", totalpagar);
                // request.setAttribute("total", total);
                request.setAttribute("descuento", decuentototal);
                request.setAttribute("producto", productos);
                request.getRequestDispatcher("CtrProductoLi?accion=home").forward(request, response);
                break;
            case "Carrito":
                System.out.println("entro a carrito");
                request.setAttribute("categorias", categoria);
                System.out.println("categoria " + categoria.size());
                totalpagar = 0;
                for (int i = 0; i < listacarrito.size(); i++) {
                    totalpagar = totalpagar + listacarrito.get(i).getSubtotal();
                }
                request.setAttribute("totalpagar", totalpagar);
                request.setAttribute("carrito", listacarrito);
                request.setAttribute("descuento", decuentototal);

                request.getRequestDispatcher("Vistas/CarritoCliente.jsp").forward(request, response);

                break;
            case "carro":

                request.setAttribute("categorias", categoria);
                System.out.println("categoria " + categoria.size());
                totalpagar = 0;
                for (int i = 0; i < listacarrito.size(); i++) {
                    totalpagar = totalpagar + listacarrito.get(i).getSubtotal();
                }
                total = totalpagar - decuentototal;
                System.out.println("total a pagar es : " + total);
                request.setAttribute("totalpagar", totalpagar);
                request.setAttribute("carrito", listacarrito);
                request.setAttribute("total", total);
                //System.out.println("total pagar" + totalpagar);
                request.setAttribute("descuento", decuentototal);
                request.setAttribute("productoS", productos);
                System.out.println(sesion.getAttribute("tipo").equals("Usuario"));

                request.getRequestDispatcher("Vistas/CarritoCliente.jsp").forward(request, response);

                break;
            case "Comprar":
                totalpagar = 0;
                idp = Integer.parseInt(request.getParameter("id"));
                p = pdao.listaridp(idp);
                item++;
                car = new Carrito();
                car.setItem(item);
                car.setIdproducto(idp);
                car.setNombre(p.getProNombre());
                car.setDescripcion(p.getProDescripcion());
                car.setFoto(p.getProFoto());
                car.setPreciocompra(p.getProPrecio());
                car.setCantidad(cantidad);
                car.setSubtotal(cantidad * p.getProPrecio());
                boolean producto = false;
                int con = 0;
                for (int i = 0; i < listacarrito.size(); i++) {
                    if (listacarrito.get(i).getIdproducto() == idp) {
                        producto = true;
                        con = i;
                        System.out.println("entro al si");
                    }
                    totalpagar = totalpagar + listacarrito.get(i).getSubtotal();
                }
                if (producto == false) {
                    listacarrito.add(car);
                    totalpagar = totalpagar + listacarrito.get(listacarrito.size() - 1).getSubtotal();
                    System.out.println("entro al falso");
                } else {
                    listacarrito.get(con).setCantidad(listacarrito.get(con).getCantidad() + 1);
                    listacarrito.get(con).setSubtotal(listacarrito.get(con).getPreciocompra() * listacarrito.get(con).getCantidad());
                    int can = listacarrito.get(con).getCantidad();
                    totalpagar = totalpagar + (listacarrito.get(con).getPreciocompra() * (can - 1));
                    System.out.println("entro al sino");
                }
                request.setAttribute("totalpagar", totalpagar);
                request.setAttribute("carrito", listacarrito);
                request.setAttribute("contador", listacarrito.size());
                request.setAttribute("totalpagar", totalpagar);
                request.setAttribute("carrito", listacarrito);
                System.out.println(sesion.getAttribute("tipo").equals("Usuario"));

                request.getRequestDispatcher("Vistas/CarritoCliente.jsp").forward(request, response);

                break;
            case "admi":
                request.setAttribute("categorias", categoria);
                request.setAttribute("productos", productos);
                request.getRequestDispatcher("Vistas/WelcomeAdmin.jsp").forward(request, response);
                break;
            case "Listaradm":
                request.setAttribute("productos", productos);

                request.getRequestDispatcher("Vistas/ListarProductoAdm.jsp").forward(request, response);
                break;
            case "EditarPro":
                int idp = Integer.parseInt(request.getParameter("idpro"));
                System.out.println("id producto" + idp);
                p = pdao.listaridp(idp);
                request.setAttribute("Productoe", p);
                request.setAttribute("editarPro", true);
                productos = pdao.listarT();
                proveedores = prodDao.listarT();
                request.setAttribute("producto", productos);
                request.setAttribute("categorias", categoria);
                request.setAttribute("proveedores", proveedores);
                request.getRequestDispatcher("/Vistas/EditarProductoAdm.jsp").forward(request, response);
                break;

            case "actualizarpro":
                int idprodu = Integer.parseInt(request.getParameter("txtid"));
                String nompro = request.getParameter("txtnombre");
                int pro = Integer.parseInt(request.getParameter("prov"));
                int prepro = Integer.parseInt(request.getParameter("txtprecio"));
                int descu = Integer.parseInt(request.getParameter("txtdescuento"));
                String marcapro = request.getParameter("txtmarca");
                String despro = request.getParameter("txtdescripcion");
                String fecha = request.getParameter("txtfechavencimiento");
                fechavencimiento = formatoFecha.parse(fecha);
                java.sql.Date fechaVencimiento = new java.sql.Date(fechavencimiento.getTime());
                int stopro = Integer.parseInt(request.getParameter("txtstock"));
                int catpro = Integer.parseInt(request.getParameter("cat"));
                String categorinombre2 = request.getParameter("catNombre");
                System.out.println("nomrbed e la caaaa : " + categorinombre2);
                String fotpro = "Imagenes/" + categorinombre2 + "/" + request.getParameter("foto");
                System.out.println("direccion de la imagen:  " + fotpro);
                p.setProNombre(nompro);
                p.setTblProverdores(pro);
                p.setProPrecio(prepro);
                p.setProDescuento(descu);
                p.setProMarca(marcapro);
                p.setProDescripcion(despro);
                p.setProFechaVencimiento(fechaVencimiento);
                p.setProStok(stopro);
                p.setTblCategoria(catpro);
                p.setProFoto(fotpro);
                p.setProCodigo(idprodu);
                pdao.editar(p);

                request.getRequestDispatcher("CtrProductoLi?accion=Listaradm").forward(request, response);

                break;

            case "Agregar":
                System.out.println("entro Agregar AppWeb");
                nom = request.getParameter("txtnombre");
                System.out.println("nombre producto: " + nom);
                des = request.getParameter("txtdescripcion");
                marca = request.getParameter("txtmarca");
                fechaven = request.getParameter("txtfechavencimiento");
                fechavencimiento = formatoFecha.parse(fechaven);
                java.sql.Date fechaVencimientoSql = new java.sql.Date(fechavencimiento.getTime());
                pre = Integer.parseInt(request.getParameter("txtprecio"));
                sto = Integer.parseInt(request.getParameter("txtstock"));
                descuent = Integer.parseInt(request.getParameter("txtdescuento"));
                cat = Integer.parseInt(request.getParameter("categoria"));
                String categorinombre = request.getParameter("categoriaNombre");
                System.out.println("nombre de la categoria" + categorinombre);
                provee = Integer.parseInt(request.getParameter("proovedores"));
                foto = "Imagenes/" + categorinombre + "/" + request.getParameter("foto");
                System.out.println("direccion imagen" + foto);

                p.setProPrecio(pre);
                p.setProDescuento(descuent);
                p.setProMarca(marca);
                p.setProNombre(nom);
                p.setProFoto(foto);
                p.setProDescripcion(des);
                p.setTblProverdores(provee);
                p.setProFechaVencimiento(fechaVencimientoSql);
                p.setProStok(sto);
                p.setTblCategoria(cat);
                pdao.crear(p);
                request.getRequestDispatcher("CtrProductoLi?accion=Listaradm").forward(request, response);
                break;
            case "inventario":
                productos = pdao.listarT();
                request.setAttribute("productos", productos);
                request.setAttribute("categorias", categoria);
                request.getRequestDispatcher("Vistas/InventarioAdm.jsp").forward(request, response);
                break;
            case "ag":
                productos = pdao.listarT();
                proveedores = prodDao.listarT();
                request.setAttribute("productos", productos);
                request.setAttribute("categorias", categoria);
                request.setAttribute("proveedores", proveedores);
                System.out.println("proveedores : " + proveedores);
                request.getRequestDispatcher("Vistas/AdminiatracionProductosAdm.jsp").forward(request, response);
                break;

            case "eliminar":
                String id = request.getParameter("idp");
                System.out.println("id: " + id);
                pdao.eliminar(id);
                list = pdao.listarT();
                request.setAttribute("prducto", list);
                request.getRequestDispatcher("Vistas/ListarProductoAdm.jsp").forward(request, response);
                break;
            case "gestion":
                pedidos = peddao.listarT();
                request.setAttribute("pedido", pedidos);
                System.out.println("pedidos: " + pedidos);
                request.getRequestDispatcher("Vistas/GestionPedidoAdm.jsp").forward(request, response);
                break;
            case "ActualizarCantidad":
                System.out.println("entro actualizar cantidad ");
                int idpro = Integer.parseInt(request.getParameter("idp"));
                System.out.println("idpro = " + request.getParameter("idp"));
                int can = Integer.parseInt(request.getParameter("Cantidad"));
                System.out.println("entro actualizar cantidad cantidad = " + can);
                System.out.println("lista carrito : " + listacarrito.size());
                for (int i = 0; i < listacarrito.size(); i++) {
                    System.out.println("lista carrito descuento : " + i);

                    if (idpro == listacarrito.get(i).getIdproducto()) {
                        listacarrito.get(i).setCantidad(can);
                        listacarrito.get(i).setDescuento(listacarrito.get(i).getCantidad() * listacarrito.get(i).getPreciocompra() * listacarrito.get(i).getDescuento() / 100);
                        System.out.println("cantidad : " + listacarrito.get(i).getCantidad());
                        System.out.println("precio : " + listacarrito.get(i).getPreciocompra());
                        System.out.println("descuento : " + listacarrito.get(i).getDescuento());
                        int st = listacarrito.get(i).getPreciocompra() * can;
                        listacarrito.get(i).setSubtotal(st);
                        //decuentototal = listacarrito.get(i).getDescuento() / 1250;
                        System.out.println("lista carrito descuento : " + listacarrito.get(i).getDescuento());
                    }
                }
                break;

            case "Delete":
                int idproducto = Integer.parseInt(request.getParameter("idpp"));
                for (int i = 0; i < listacarrito.size(); i++) {
                    if (idproducto == listacarrito.get(i).getIdproducto()) {
                        listacarrito.remove(i);
                    }
                }
                break;

            case "pedido":
                if (listacarrito.size() > 0) {

                    idusu = Integer.parseInt(request.getParameter("idusu"));
                    String idu = request.getParameter("idusu");
                    System.out.println("usuario " + idusu);
                    fec = DateFormat.getDateInstance().format(d);
                    mon = Integer.parseInt(request.getParameter("totalp"));
                    String tipo = request.getParameter("tipos");
                    System.out.println("tipo : " + tipo);
                    esss = "en proceso";
                    ped.setTblUsuarios(idusu);
                    ped.setPedFecha(fec);
                    ped.setPedTotal(mon);
                    ped.setPedFormaDePago(tipo);
                    ped.setPedEstado(esss);
                    peddao.crear(ped);
                    int idpe = peddao.listarU();
                    System.out.println("idpedido: " + idpe);

                    for (int i = 0; i < listacarrito.size(); i++) {
                        DetallePedido dped = new DetallePedido();
                        dped.setTblProducto(listacarrito.get(i).getIdproducto());
                        dped.setTblPedido(idpe);
                        dped.setDpdCantidad(listacarrito.get(i).getCantidad());
                        dped.setDpdPrecioTotal(mon);
                        dped.setDpdNombreProducto(listacarrito.get(i).getNombre());
                        dped.setDpdPrecioUnitario(listacarrito.get(i).getPreciocompra());
                        dped.setDpdFecha(listacarrito.get(i).getFecha());
                        dpdao.crear(dped);
                    }
                    Properties propiedad = new Properties();
                    propiedad.setProperty("mail.smtp.host", "smtp.gmail.com");
                    propiedad.setProperty("mail.smtp.ssl.trust", "smtp.gmail.com");
                    propiedad.setProperty("mail.smtp.starttls.enable", "true");
                    propiedad.setProperty("mail.smtp.port", "587");
                    propiedad.setProperty("mail.smtp.auth", "true");

                    Session session1 = Session.getDefaultInstance(propiedad);
                    String correoenvio = "farmaciayasbel@gmail.com";
                    String contrasena = "xybdpcjtapwenajq";
                    String destinatario = sesion.getAttribute("correo").toString();
                    // String destinatario = us.getUsucorreo();

                    System.out.println("correo del usuario : " + sesion.getAttribute("correo").toString());
                    String Asunto = "Pedido Generado";
                    String Mensaje = "<!DOCTYPE html>\n"
                            + "<html lang='es'>\n"
                            + "<head>\n"
                            + "    <meta charset='UTF-8'>\n"
                            + "    <meta name='viewport' content='width=device-width, initial-scale=1.0'>\n"
                            + "    <title>Correo Empresarial</title>\n"
                            + "    <style>\n"
                            + "        body {\n"
                            + "            font-family: Arial, sans-serif;\n"
                            + "            margin: 0;\n"
                            + "            padding: 0;\n"
                            + "            background-color: #f4f4f4;\n"
                            + "        }\n"
                            + "        .container {\n"
                            + "            max-width: 600px;\n"
                            + "            margin: 0 auto;\n"
                            + "            background-color: #ffffff;\n"
                            + "            border: 1px solid #dddddd;\n"
                            + "            padding: 20px;\n"
                            + "        }\n"
                            + "        .header {\n"
                            + "            text-align: center;\n"
                            + "            padding: 10px 0;\n"
                            + "            background-color: #74BD64;\n"
                            + "            color: white;\n"
                            + "        }\n"
                            + "        .header img {\n"
                            + "            max-width: 570px;\n"
                            + "        }\n"
                            + "        .content {\n"
                            + "            text-align: center;\n"
                            + "            padding: 40px 20px;\n"
                            + "        }\n"
                            + "        .content h2 {\n"
                            + "            color: #333333;\n"
                            + "            font-size: 22px;\n"
                            + "            margin-bottom: 10px;\n"
                            + "        }\n"
                            + "        .content p {\n"
                            + "            color: #555555;\n"
                            + "            font-size: 16px;\n"
                            + "        }\n"
                            + "        .content img {\n"
                            + "            width: 100px;\n"
                            + "            height: 100px;\n"
                            + "            border-radius: 50%;\n"
                            + "            margin-bottom: 20px;\n"
                            + "            margin-top: 20px;\n"
                            + "        }\n"
                            + "        .footer {\n"
                            + "            background-color: #74BD64;\n"
                            + "            padding: 20px 0;\n"
                            + "            color: white;\n"
                            + "            text-align: center;\n"
                            + "        }\n"
                            + "        .footer .footer-lists {\n"
                            + "            display: flex;\n"
                            + "            justify-content: center;\n"
                            + "            text-align: center;\n"
                            + "            padding-bottom: 20px;\n"
                            + "        }\n"
                            + "        .footer .footer-lists > div {\n"
                            + "            margin: 0 20px;\n"
                            + "        }\n"
                            + "        .footer ul {\n"
                            + "            list-style: none;\n"
                            + "            padding: 0;\n"
                            + "        }\n"
                            + "        .footer h3 {\n"
                            + "            font-size: 18px;\n"
                            + "            margin-bottom: 10px;\n"
                            + "            color: #559D46;\n"
                            + "        }\n"
                            + "        .footer li {\n"
                            + "            font-size: 14px;\n"
                            + "            color: white;\n"
                            + "            margin-bottom: 8px;\n"
                            + "        }\n"
                            + "        .footer li img {\n"
                            + "            vertical-align: middle;\n"
                            + "            margin-right: 10px;\n"
                            + "            max-width: 20px;\n"
                            + "        }\n"
                            + "        .footer p {\n"
                            + "            text-align: center;\n"
                            + "            color: white;\n"
                            + "            margin: 10px 0 0;\n"
                            + "        }\n"
                            + "    </style>\n"
                            + "</head>\n"
                            + "<body>\n"
                            + "    <div class='container'>\n"
                            + "        <div class='header'>\n"
                            + "            <img src='https://i.pinimg.com/736x/be/7a/16/be7a16bf55b08da751bafcc4a5fec46f.jpg' alt='Logo de la Empresa'>\n"
                            + "        </div>\n"
                            + "        <div class='content'>\n"
                            + "            <h2>Estimado cliente</h2>\n"
                            + "            <img src='https://i.pinimg.com/originals/9c/15/16/9c15164f48b527ea72d6d1b418f910e0.gif' alt='imagen de contenido'>\n"
                            + "            <p>Su pedido está en proceso, por favor espere un tiempo máximo de 24 horas.</p>\n"
                            + "            <h3>Detalles de pedido:</h3>\n"
                            + "            <p>Número Pedido: " + idpe + "</p>\n"
                            + "            <p>Fecha: " + fec + "</p>\n"
                            + "            <p>Valor: " + mon + "</p>\n"
                            + "            <p>Estado: " + esss + "</p>\n"
                            + "        </div>\n"
                            + "        <div class='footer'>\n"
                            + "            <div class='footer-lists'>\n"
                            + "                <div>\n"
                            + "                    <h3>Información</h3>\n"
                            + "                    <ul>\n"
                            + "                        <li>Dirección: Calle 51d #2g-63</li>\n"
                            + "                        <li>Teléfono: 324 6794400</li>\n"
                            + "                    </ul>\n"
                            + "                </div>\n"
                            + "                <div>\n"
                            + "                    <h3>Redes Sociales</h3>\n"
                            + "                    <ul>\n"
                            + "                        <li><img src='https://static.vecteezy.com/system/resources/previews/016/716/447/non_2x/facebook-icon-free-png.png'/> Facebook</li>\n"
                            + "                        <li><img src='https://static.vecteezy.com/system/resources/previews/018/930/415/non_2x/instagram-logo-instagram-icon-transparent-free-png.png'/> Instagram</li>\n"
                            + "                    </ul>\n"
                            + "                </div>\n"
                            + "            </div>\n"
                            + "            <p>© 2024 FARMACIA YASBEL.</p>\n"
                            + "        </div>\n"
                            + "    </div>\n"
                            + "</body>\n"
                            + "</html>";

                    MimeMessage mail = new MimeMessage(session1);

                    try {
                        mail.setFrom(new InternetAddress(correoenvio));
                        mail.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));
                        mail.setSubject(Asunto);
                        //mail.setText(Mensaje);
                        mail.setContent(Mensaje, "text/html");

                        Transport transporte = session1.getTransport("smtp");
                        transporte.connect(correoenvio, contrasena);
                        transporte.sendMessage(mail, mail.getRecipients(Message.RecipientType.TO));
                        transporte.close();
                    } catch (Exception e) {
                        System.out.println("Error al enviar el correo: " + e);
                    }

                    Properties propiedad1 = new Properties();
                    propiedad.setProperty("mail.smtp.host", "smtp.gmail.com");
                    propiedad.setProperty("mail.smtp.ssl.trust", "smtp.gmail.com");
                    propiedad.setProperty("mail.smtp.starttls.enable", "true");
                    propiedad.setProperty("mail.smtp.port", "587");
                    propiedad.setProperty("mail.smtp.auth", "true");

                    Session session11 = Session.getDefaultInstance(propiedad);
                    String correoenvio1 = "farmaciayasbel@gmail.com";
                    String contrasena1 = "xybdpcjtapwenajq";
                    String destinatario1 = "rzdariana01@gmail.com";
                    // String destinatario = us.getUsucorreo();

                    System.out.println("correo del usuario : " + sesion.getAttribute("correo").toString());
                    String Asunto1 = "Pedido Generado";
                    String Mensaje1 = "<!DOCTYPE html>\n"
                            + "<html lang='es'>\n"
                            + "<head>\n"
                            + "    <meta charset='UTF-8'>\n"
                            + "    <meta name='viewport' content='width=device-width, initial-scale=1.0'>\n"
                            + "    <title>Correo Empresarial</title>\n"
                            + "    <style>\n"
                            + "        body {\n"
                            + "            font-family: Arial, sans-serif;\n"
                            + "            margin: 0;\n"
                            + "            padding: 0;\n"
                            + "            background-color: #f4f4f4;\n"
                            + "        }\n"
                            + "        .container {\n"
                            + "            max-width: 600px;\n"
                            + "            margin: 0 auto;\n"
                            + "            background-color: #ffffff;\n"
                            + "            border: 1px solid #dddddd;\n"
                            + "            padding: 20px;\n"
                            + "        }\n"
                            + "        .header {\n"
                            + "            text-align: center;\n"
                            + "            padding: 10px 0;\n"
                            + "            background-color: #74BD64;\n"
                            + "            color: white;\n"
                            + "        }\n"
                            + "        .header img {\n"
                            + "            max-width: 570px;\n"
                            + "        }\n"
                            + "        .content {\n"
                            + "            text-align: center;\n"
                            + "            padding: 40px 20px;\n"
                            + "        }\n"
                            + "        .content h2 {\n"
                            + "            color: #333333;\n"
                            + "            font-size: 22px;\n"
                            + "            margin-bottom: 10px;\n"
                            + "        }\n"
                            + "        .content p {\n"
                            + "            color: #555555;\n"
                            + "            font-size: 16px;\n"
                            + "        }\n"
                            + "        .content img {\n"
                            + "            width: 100px;\n"
                            + "            height: 100px;\n"
                            + "            border-radius: 50%;\n"
                            + "            margin-bottom: 20px;\n"
                            + "            margin-top: 20px;\n"
                            + "        }\n"
                            + "        .footer {\n"
                            + "            background-color: #74BD64;\n"
                            + "            padding: 20px 0;\n"
                            + "            color: white;\n"
                            + "            text-align: center;\n"
                            + "        }\n"
                            + "        .footer .footer-lists {\n"
                            + "            display: flex;\n"
                            + "            justify-content: center;\n"
                            + "            text-align: center;\n"
                            + "            padding-bottom: 20px;\n"
                            + "        }\n"
                            + "        .footer .footer-lists > div {\n"
                            + "            margin: 0 20px;\n"
                            + "        }\n"
                            + "        .footer ul {\n"
                            + "            list-style: none;\n"
                            + "            padding: 0;\n"
                            + "        }\n"
                            + "        .footer h3 {\n"
                            + "            font-size: 18px;\n"
                            + "            margin-bottom: 10px;\n"
                            + "            color: #559D46;\n"
                            + "        }\n"
                            + "        .footer li {\n"
                            + "            font-size: 14px;\n"
                            + "            color: white;\n"
                            + "            margin-bottom: 8px;\n"
                            + "        }\n"
                            + "        .footer li img {\n"
                            + "            vertical-align: middle;\n"
                            + "            margin-right: 10px;\n"
                            + "            max-width: 20px;\n"
                            + "        }\n"
                            + "        .footer p {\n"
                            + "            text-align: center;\n"
                            + "            color: white;\n"
                            + "            margin: 10px 0 0;\n"
                            + "        }\n"
                            + "    </style>\n"
                            + "</head>\n"
                            + "<body>\n"
                            + "    <div class='container'>\n"
                            + "        <div class='header'>\n"
                            + "            <img src='https://i.pinimg.com/736x/be/7a/16/be7a16bf55b08da751bafcc4a5fec46f.jpg' alt='Logo de la Empresa'>\n"
                            + "        </div>\n"
                            + "        <div class='content'>\n"
                            + "            <h2>Estimado Administrador</h2>\n"
                            + "            <img src='https://i.pinimg.com/originals/9c/15/16/9c15164f48b527ea72d6d1b418f910e0.gif' alt='imagen de contenido'>\n"
                            + "            <p>Hay un pedido en proceso esperando a ser gestionado.</p>\n"
                            + "            <h3>Detalles de pedido:</h3>\n"
                            + "            <p>Número Pedido: " + idpe + "</p>\n"
                            + "            <p>Fecha: " + fec + "</p>\n"
                            + "            <p>Valor: " + mon + "</p>\n"
                            + "            <p>Estado: " + esss + "</p>\n"
                            + "        </div>\n"
                            + "        <div class='footer'>\n"
                            + "            <div class='footer-lists'>\n"
                            + "                <div>\n"
                            + "                    <h3>Información</h3>\n"
                            + "                    <ul>\n"
                            + "                        <li>Dirección: Calle 51d #2g-63</li>\n"
                            + "                        <li>Teléfono: 324 6794400</li>\n"
                            + "                    </ul>\n"
                            + "                </div>\n"
                            + "                <div>\n"
                            + "                    <h3>Redes Sociales</h3>\n"
                            + "                    <ul>\n"
                            + "                        <li><img src='https://static.vecteezy.com/system/resources/previews/016/716/447/non_2x/facebook-icon-free-png.png'/> Facebook</li>\n"
                            + "                        <li><img src='https://static.vecteezy.com/system/resources/previews/018/930/415/non_2x/instagram-logo-instagram-icon-transparent-free-png.png'/> Instagram</li>\n"
                            + "                    </ul>\n"
                            + "                </div>\n"
                            + "            </div>\n"
                            + "            <p>© 2024 FARMACIA YASBEL.</p>\n"
                            + "        </div>\n"
                            + "    </div>\n"
                            + "</body>\n"
                            + "</html>";

                    MimeMessage mail1 = new MimeMessage(session1);

                    try {
                        mail1.setFrom(new InternetAddress(correoenvio));
                        mail1.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario1));
                        mail1.setSubject(Asunto);
                        //mail.setText(Mensaje);
                        mail1.setContent(Mensaje1, "text/html");

                        Transport transporte = session1.getTransport("smtp");
                        transporte.connect(correoenvio, contrasena);
                        transporte.sendMessage(mail1, mail1.getRecipients(Message.RecipientType.TO));
                        transporte.close();
                    } catch (Exception e) {
                        System.out.println("Error al enviar el correo: " + e);
                    }

                    listacarrito.removeAll(listacarrito);
                    pedidos = peddao.listarUsu(idu);
                    request.setAttribute("pedido", pedidos);
                    request.getRequestDispatcher("Vistas/HistorialPedido.jsp").forward(request, response);
                    break;

                }
            case "historial":
                String idUsu = request.getParameter("id");
                pedidos = peddao.listarUsu(idUsu);
                request.setAttribute("pedido", pedidos);
                request.setAttribute("detalle", pedidos);
                request.getRequestDispatcher("Vistas/HistorialPedido.jsp").forward(request, response);
                break;
            case "EditarDet":
                int idpd = Integer.parseInt(request.getParameter("idpro"));
                System.out.println("id del producto " + idpd);
                ped = peddao.listarIdp(idpd);
                System.out.println("lista pedidos" + ped);
                request.setAttribute("Detalle", ped);
                request.getRequestDispatcher("Vistas/HistorialPedido.jsp").forward(request, response);
                break;

            case "Epedidos":
                String idActu = request.getParameter("idp");
                System.out.println("entro a enviar correo");
                boolean actualizado = peddao.estadoPED(idActu, "enviado");

                if (actualizado) {
                    pedidos = peddao.listarT();
                    request.setAttribute("pedidos", pedidos);
                    request.getRequestDispatcher("CtrProductoLi?accion=gestion").forward(request, response);

                }
                int idUsuario = Integer.parseInt(request.getParameter("idUsu"));

                us = usudao.listarU(idUsuario);
                System.out.println(" usuario :" + us.getUsuid());
                if (us.getUsuid() != null) {
                    Properties propiedad = new Properties();
                    propiedad.setProperty("mail.smtp.host", "smtp.gmail.com");
                    propiedad.setProperty("mail.smtp.ssl.trust", "smtp.gmail.com");
                    propiedad.setProperty("mail.smtp.starttls.enable", "true");
                    propiedad.setProperty("mail.smtp.port", "587");
                    propiedad.setProperty("mail.smtp.auth", "true");

                    Session session1 = Session.getDefaultInstance(propiedad);
                    String correoenvio = "farmaciayasbel@gmail.com";
                    String contrasena = "xybdpcjtapwenajq";
                    String destinatario = us.getUsucorreo();

                    String Asunto = "Pedido Generado";
                    String Mensaje = "<!DOCTYPE html>\n"
                            + "<html lang='es'>\n"
                            + "<head>\n"
                            + "    <meta charset='UTF-8'>\n"
                            + "    <meta name='viewport' content='width=device-width, initial-scale=1.0'>\n"
                            + "    <title>Correo Empresarial</title>\n"
                            + "    <style>\n"
                            + "        body {\n"
                            + "            font-family: Arial, sans-serif;\n"
                            + "            margin: 0;\n"
                            + "            padding: 0;\n"
                            + "            background-color: #f4f4f4;\n"
                            + "        }\n"
                            + "        .container {\n"
                            + "            max-width: 600px;\n"
                            + "            margin: 0 auto;\n"
                            + "            background-color: #ffffff;\n"
                            + "            border: 1px solid #dddddd;\n"
                            + "            padding: 20px;\n"
                            + "        }\n"
                            + "        .header {\n"
                            + "            text-align: center;\n"
                            + "            padding: 10px 0;\n"
                            + "            background-color: #74BD64;\n"
                            + "            color: white;\n"
                            + "        }\n"
                            + "        .header img {\n"
                            + "            max-width: 570px;\n"
                            + "        }\n"
                            + "        .content {\n"
                            + "            text-align: center;\n"
                            + "            padding: 40px 20px;\n"
                            + "        }\n"
                            + "        .content h2 {\n"
                            + "            color: #333333;\n"
                            + "            font-size: 22px;\n"
                            + "            margin-bottom: 10px;\n"
                            + "        }\n"
                            + "        .content p {\n"
                            + "            color: #555555;\n"
                            + "            font-size: 16px;\n"
                            + "        }\n"
                            + "        .content img {\n"
                            + "            width: 300px;\n"
                            + "            height: 300px;\n"
                            + "            border-radius: 50%;\n"
                            + "            margin-bottom: 0px;\n"
                            + "            margin-top: 0px;\n"
                            + "        }\n"
                            + "        .footer {\n"
                            + "            background-color: #74BD64;\n"
                            + "            padding: 20px 0;\n"
                            + "            color: white;\n"
                            + "            text-align: center;\n"
                            + "        }\n"
                            + "        .footer .footer-lists {\n"
                            + "            display: flex;\n"
                            + "            justify-content: center;\n"
                            + "            text-align: center;\n"
                            + "            padding-bottom: 20px;\n"
                            + "        }\n"
                            + "        .footer .footer-lists > div {\n"
                            + "            margin: 0 20px;\n"
                            + "        }\n"
                            + "        .footer ul {\n"
                            + "            list-style: none;\n"
                            + "            padding: 0;\n"
                            + "        }\n"
                            + "        .footer h3 {\n"
                            + "            font-size: 18px;\n"
                            + "            margin-bottom: 10px;\n"
                            + "            color: #559D46;\n"
                            + "        }\n"
                            + "        .footer li {\n"
                            + "            font-size: 14px;\n"
                            + "            color: white;\n"
                            + "            margin-bottom: 8px;\n"
                            + "        }\n"
                            + "        .footer li img {\n"
                            + "            vertical-align: middle;\n"
                            + "            margin-right: 10px;\n"
                            + "            max-width: 20px;\n"
                            + "        }\n"
                            + "        .footer p {\n"
                            + "            text-align: center;\n"
                            + "            color: white;\n"
                            + "            margin: 10px 0 0;\n"
                            + "        }\n"
                            + "    </style>\n"
                            + "</head>\n"
                            + "<body>\n"
                            + "    <div class='container'>\n"
                            + "        <div class='header'>\n"
                            + "            <img src='https://i.pinimg.com/736x/be/7a/16/be7a16bf55b08da751bafcc4a5fec46f.jpg' alt='Logo de la Empresa'>\n"
                            + "        </div>\n"
                            + "        <div class='content'>\n"
                            + "            <h2>Estimado cliente, " + us.getUsunombre() + "</h2>\n"
                            + "            <img src='https://lcpdecoracion.es/wp-content/uploads/2020/06/envio-animacion.gif' alt='imagen de contenido'>\n"
                            + "            <p>Su pedido está en camino! Pronto estará en la puerta de su casa.</p>\n"
                            + "            <h3>Detalles de pedido:</h3>\n"
                            + "            <p>Número Pedido: " + idActu + "</p>\n"
                            + "            <p>Fecha: " + new Date() + "</p>\n"
                            + "            <p>Valor: $" + mon + "</p>\n"
                            + "            <p>Estado: " + estado + "</p>\n"
                            + "        </div>\n"
                            + "        <div class='footer'>\n"
                            + "            <div class='footer-lists'>\n"
                            + "                <div>\n"
                            + "                    <h3>Información</h3>\n"
                            + "                    <ul>\n"
                            + "                        <li>Dirección: Calle 51d #2g-63</li>\n"
                            + "                        <li>Teléfono: 324 6794400</li>\n"
                            + "                    </ul>\n"
                            + "                </div>\n"
                            + "                <div>\n"
                            + "                    <h3>Redes Sociales</h3>\n"
                            + "                    <ul>\n"
                            + "                        <li><img src='https://static.vecteezy.com/system/resources/previews/016/716/447/non_2x/facebook-icon-free-png.png' alt='Facebook'/> Facebook</li>\n"
                            + "                        <li><img src='https://static.vecteezy.com/system/resources/previews/018/930/415/non_2x/instagram-logo-instagram-icon-transparent-free-png.png' alt='Instagram'/> Instagram</li>\n"
                            + "                    </ul>\n"
                            + "                </div>\n"
                            + "            </div>\n"
                            + "            <p>© 2024 FARMACIA YASBEL.</p>\n"
                            + "        </div>\n"
                            + "    </div>\n"
                            + "</body>\n"
                            + "</html>";

                    MimeMessage mail = new MimeMessage(session1);

                    try {
                        mail.setFrom(new InternetAddress(correoenvio));
                        mail.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));
                        mail.setSubject(Asunto);
                        mail.setContent(Mensaje, "text/html");

                        Transport transporte = session1.getTransport("smtp");
                        transporte.connect(correoenvio, contrasena);
                        transporte.sendMessage(mail, mail.getRecipients(Message.RecipientType.TO));
                        transporte.close();
                    } catch (Exception e) {
                        System.out.println("Error al enviar el correo: " + e);
                    }
                    request.getRequestDispatcher("Vistas/LogginPage.jsp").forward(request, response);
                } else {

                }

                break;

            case "Entregado":

                String idAct = request.getParameter("idp");
                System.out.println("Actualizar tipo Usuario " + idAct);
                boolean actualizad = peddao.estadoPED(idAct, "Entregado");
                if (actualizad) {
                    pedidos = peddao.listarT();
                    request.setAttribute("pedidos", ped);
                    request.getRequestDispatcher("CtrProductoLi?accion=gestion").forward(request, response);
                }
                break;
            case "Cancelado":

                String idAc = request.getParameter("idp");

                boolean actualiz = peddao.estadoPED(idAc, "cancelado");

                if (actualiz) {
                    pedidos = peddao.listarT();
                    request.setAttribute("pedidos", ped);
                    request.getRequestDispatcher("CtrProductoLi?accion=gestion").forward(request, response);

                    int idUsuarios = Integer.parseInt(request.getParameter("idUsu"));

                    us = usudao.listarU(idUsuarios);
                    System.out.println(" usuario :" + us.getUsuid());
                    if (us.getUsuid() != null) {
                        Properties propiedad = new Properties();
                        propiedad.setProperty("mail.smtp.host", "smtp.gmail.com");
                        propiedad.setProperty("mail.smtp.ssl.trust", "smtp.gmail.com");
                        propiedad.setProperty("mail.smtp.starttls.enable", "true");
                        propiedad.setProperty("mail.smtp.port", "587");
                        propiedad.setProperty("mail.smtp.auth", "true");

                        Session session1 = Session.getDefaultInstance(propiedad);
                        String correoenvio = "farmaciayasbel@gmail.com";
                        String contrasena = "xybdpcjtapwenajq";
                        String destinatario = us.getUsucorreo();

                        String Asunto = "Pedido Cancelado";
                        String Mensaje = "<!DOCTYPE html>\n"
                                + "<html lang='es'>\n"
                                + "<head>\n"
                                + "    <meta charset='UTF-8'>\n"
                                + "    <meta name='viewport' content='width=device-width, initial-scale=1.0'>\n"
                                + "    <title>Correo Empresarial</title>\n"
                                + "    <style>\n"
                                + "        body {\n"
                                + "            font-family: Arial, sans-serif;\n"
                                + "            margin: 0;\n"
                                + "            padding: 0;\n"
                                + "            background-color: #f4f4f4;\n"
                                + "        }\n"
                                + "        .container {\n"
                                + "            max-width: 600px;\n"
                                + "            margin: 0 auto;\n"
                                + "            background-color: #ffffff;\n"
                                + "            border: 1px solid #dddddd;\n"
                                + "            padding: 20px;\n"
                                + "        }\n"
                                + "        .header {\n"
                                + "            text-align: center;\n"
                                + "            padding: 10px 0;\n"
                                + "            background-color: #74BD64;\n"
                                + "            color: white;\n"
                                + "        }\n"
                                + "        .header img {\n"
                                + "            max-width: 570px;\n"
                                + "        }\n"
                                + "        .content {\n"
                                + "            text-align: center;\n"
                                + "            padding: 40px 20px;\n"
                                + "        }\n"
                                + "        .content h2 {\n"
                                + "            color: #333333;\n"
                                + "            font-size: 22px;\n"
                                + "            margin-bottom: 10px;\n"
                                + "        }\n"
                                + "        .content p {\n"
                                + "            color: #555555;\n"
                                + "            font-size: 16px;\n"
                                + "        }\n"
                                + "        .content img {\n"
                                + "            width: 100px;\n"
                                + "            height: 100px;\n"
                                + "            border-radius: 50%;\n"
                                + "            margin-bottom: 20px;\n"
                                + "            margin-top: 20px;\n"
                                + "        }\n"
                                + "        .footer {\n"
                                + "            background-color: #74BD64;\n"
                                + "            padding: 20px 0;\n"
                                + "            color: white;\n"
                                + "            text-align: center;\n"
                                + "        }\n"
                                + "        .footer .footer-lists {\n"
                                + "            display: flex;\n"
                                + "            justify-content: center;\n"
                                + "            text-align: center;\n"
                                + "            padding-bottom: 20px;\n"
                                + "        }\n"
                                + "        .footer .footer-lists > div {\n"
                                + "            margin: 0 20px;\n"
                                + "        }\n"
                                + "        .footer ul {\n"
                                + "            list-style: none;\n"
                                + "            padding: 0;\n"
                                + "        }\n"
                                + "        .footer h3 {\n"
                                + "            font-size: 18px;\n"
                                + "            margin-bottom: 10px;\n"
                                + "            color: #559D46;\n"
                                + "        }\n"
                                + "        .footer li {\n"
                                + "            font-size: 14px;\n"
                                + "            color: white;\n"
                                + "            margin-bottom: 8px;\n"
                                + "        }\n"
                                + "        .footer li img {\n"
                                + "            vertical-align: middle;\n"
                                + "            margin-right: 10px;\n"
                                + "            max-width: 20px;\n"
                                + "        }\n"
                                + "        .footer p {\n"
                                + "            text-align: center;\n"
                                + "            color: white;\n"
                                + "            margin: 10px 0 0;\n"
                                + "        }\n"
                                + "    </style>\n"
                                + "</head>\n"
                                + "<body>\n"
                                + "    <div class='container'>\n"
                                + "        <div class='header'>\n"
                                + "            <img src='https://i.pinimg.com/736x/be/7a/16/be7a16bf55b08da751bafcc4a5fec46f.jpg' alt='Logo de la Empresa'>\n"
                                + "        </div>\n"
                                + "        <div class='content'>\n"
                                + "            <h2>Estimado cliente," + us.getUsunombre() + "</h2>\n"
                                + "            <img src='https://www.iconsdb.com/icons/preview/red/x-mark-3-xxl.png' alt='imagen de contenido'>\n"
                                + "            <p>Su pedido has sido cancelado</p>\n"
                                + "        </div>\n"
                                + "        <div class='footer'>\n"
                                + "            <div class='footer-lists'>\n"
                                + "                <div>\n"
                                + "                    <h3>Información</h3>\n"
                                + "                    <ul>\n"
                                + "                        <li>Dirección: Calle 51d #2g-63</li>\n"
                                + "                        <li>Teléfono: 324 6794400</li>\n"
                                + "                    </ul>\n"
                                + "                </div>\n"
                                + "                <div>\n"
                                + "                    <h3>Redes Sociales</h3>\n"
                                + "                    <ul>\n"
                                + "                        <li><img src='https://static.vecteezy.com/system/resources/previews/016/716/447/non_2x/facebook-icon-free-png.png'/> Facebook</li>\n"
                                + "                        <li><img src='https://static.vecteezy.com/system/resources/previews/018/930/415/non_2x/instagram-logo-instagram-icon-transparent-free-png.png'/> Instagram</li>\n"
                                + "                    </ul>\n"
                                + "                </div>\n"
                                + "            </div>\n"
                                + "            <p>© 2024 FARMACIA YASBEL.</p>\n"
                                + "        </div>\n"
                                + "    </div>\n"
                                + "</body>\n";

                        MimeMessage mail = new MimeMessage(session1);

                        try {
                            mail.setFrom(new InternetAddress(correoenvio));
                            mail.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));
                            mail.setSubject(Asunto);
                            mail.setContent(Mensaje, "text/html");

                            Transport transporte = session1.getTransport("smtp");
                            transporte.connect(correoenvio, contrasena);
                            transporte.sendMessage(mail, mail.getRecipients(Message.RecipientType.TO));
                            transporte.close();
                        } catch (Exception e) {
                            System.out.println("Error al enviar el correo: " + e);
                        }
                        request.getRequestDispatcher("Vistas/LogginPage.jsp").forward(request, response);
                    } else {

                    }

                }

                break;

            case "olvido":

                request.getRequestDispatcher("Vistas/RecuperarContrs.jsp").forward(request, response);
                break;
            case "nuevacont":
                System.out.println("entro en nuevacont");
                int idc = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("id", idc);
                request.getRequestDispatcher("Vistas/NewContrase.jsp").forward(request, response);
                break;
            case "login":
                request.getRequestDispatcher("Vistas/LogginPage.jsp").forward(request, response);
                break;
            case "RecuperarCont":
                System.out.println("identificacion: " + request.getParameter("id"));
                int idus = Integer.parseInt(request.getParameter("id"));
                us = usudao.listarU(idus);
                System.out.println(" usuario :" + us.getUsuid());
                if (us.getUsuid() != null) {
                    Properties propiedad = new Properties();
                    propiedad.setProperty("mail.smtp.host", "smtp.gmail.com");
                    propiedad.setProperty("mail.smtp.ssl.trust", "smtp.gmail.com");
                    propiedad.setProperty("mail.smtp.starttls.enable", "true");
                    propiedad.setProperty("mail.smtp.port", "587");
                    propiedad.setProperty("mail.smtp.auth", "true");

                    Session session1 = Session.getDefaultInstance(propiedad);
                    String correoenvio = "farmaciayasbel@gmail.com";
                    String contrasena = "xybdpcjtapwenajq";
                    String destinatario = us.getUsucorreo();

                    String Asunto = "Pedido Generado";
                    String Mensaje
                            = "<!DOCTYPE html>\n"
                            + "<html lang='es'>\n"
                            + "<head>\n"
                            + "    <meta charset='UTF-8'>\n"
                            + "    <meta name='viewport' content='width=device-width, initial-scale=1.0'>\n"
                            + "    <title>Correo Empresarial</title>\n"
                            + "    <style>\n" 
                            + "        body { font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f4f4; }\n"
                            + "        .container { max-width: 600px; margin: 0 auto; background-color: #ffffff; border: 1px solid #dddddd; padding: 20px; }\n"
                            + "        .header { text-align: center; padding: 10px 0; background-color: #74BD64; color: white; }\n"
                            + "        .header img { max-width: 570px; }\n"
                            + "        .content { text-align: center; padding: 40px 20px; }\n"
                            + "        .content h2 { color: #333333; font-size: 22px; margin-bottom: 10px; }\n"
                            + "        .content p { color: #555555; font-size: 16px; }\n"
                            + "        .footer { background-color: #74BD64; padding: 20px 0; color: white; text-align: center; }\n"
                            + "        .footer .footer-lists { display: flex; justify-content: center; text-align: center; padding-bottom: 20px; }\n"
                            + "        .footer .footer-lists > div { margin: 0 20px; }\n"
                            + "        .footer ul { list-style: none; padding: 0; }\n"
                            + "        .footer h3 { font-size: 18px; margin-bottom: 10px; color: #559D46; }\n"
                            + "        .footer li { font-size: 14px; color: white; margin-bottom: 8px; }\n"
                            + "        .footer li img { vertical-align: middle; margin-right: 10px; max-width: 20px; }\n"
                            + "        .footer p { text-align: center; color: white; margin: 10px 0 0; }\n"
                            + "    </style>\n"
                            + "</head>\n"
                            + "<body>\n"
                            + "    <div class='container'>\n"
                            + "        <div class='header'>\n"
                            + "            <img src='https://i.pinimg.com/736x/be/7a/16/be7a16bf55b08da751bafcc4a5fec46f.jpg' alt='Logo de la Empresa'>\n"
                            + "        </div>\n"
                            + "        <div class='content'>\n"
                            + "            <h2>Estimado cliente, " + us.getUsunombre() + "</h2>\n"
                            + "            <p>Por favor, si desea cambiar su contraseña, ingrese al siguiente enlace:</p>\n"
                            + "            <p><a href='http://localhost:8080/FarmaciaWeb/CtrProductoLi?accion=nuevacont&id=" + us.getUsuid() + "'>Cambiar contraseña</a></p>\n"
                            + "        </div>\n"
                            + "        <div class='footer'>\n"
                            + "            <div class='footer-lists'>\n"
                            + "                <div>\n"
                            + "                    <h3>Información</h3>\n"
                            + "                    <ul>\n"
                            + "                        <li>Dirección: Calle 51d #2g-63</li>\n"
                            + "                        <li>Teléfono: 324 6794400</li>\n"
                            + "                    </ul>\n"
                            + "                </div>\n"
                            + "                <div>\n"
                            + "                    <h3>Redes Sociales</h3>\n"
                            + "                    <ul>\n"
                            + "                        <li><img src='https://static.vecteezy.com/system/resources/previews/016/716/447/non_2x/facebook-icon-free-png.png'/> Facebook</li>\n"
                            + "                        <li><img src='https://static.vecteezy.com/system/resources/previews/018/930/415/non_2x/instagram-logo-instagram-icon-transparent-free-png.png'/> Instagram</li>\n"
                            + "                    </ul>\n"
                            + "                </div>\n"
                            + "            </div>\n"
                            + "            <p>© 2024 FARMACIA YASBEL. Todos los derechos reservados.</p>\n"
                            + "        </div>\n"
                            + "    </div>\n"
                            + "</body>\n"
                            + "</html>";

                    
                    
                    
                    //"http://localhost:8080/FarmaciaWeb/CtrProductoLi?accion=nuevacont&id=" + us.getUsuid();
                    MimeMessage mail = new MimeMessage(session1);

                    try {
                        mail.setFrom(new InternetAddress(correoenvio));
                        mail.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));
                        mail.setSubject(Asunto);
                        //mail.setText(Mensaje);
                        mail.setContent(Mensaje, "text/html");

                        Transport transporte = session1.getTransport("smtp");
                        transporte.connect(correoenvio, contrasena);
                        transporte.sendMessage(mail, mail.getRecipients(Message.RecipientType.TO));
                        transporte.close();
                    } catch (Exception e) {
                        System.out.println("Error al enviar el correo: " + e);
                    }
                    request.getRequestDispatcher("Vistas/LogginPage.jsp").forward(request, response);
                } else {

                }

                break;
            case "ActualizarCont":
                String contrase = request.getParameter("contra");
                System.out.println("id  del uauario : " + request.getParameter("id"));
                int idcu = Integer.parseInt(request.getParameter("id"));

                String contrasenaencriptada = encriptarcontrasena(contrase);
                boolean cont = usudao.ActualizarCon(idcu, contrasenaencriptada);
                request.getRequestDispatcher("Vistas/LogginPage.jsp").forward(request, response);
                break;
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(CtrProductoLi.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(CtrProductoLi.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

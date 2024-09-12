/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Configuracion.Conectar;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HPLAPTOP01
 */
public class ProductoDAO {

    Connection con;
    PreparedStatement pstm;
    Conectar Conexcion;
    ResultSet resul;

    public List listarS() {
        List<Producto> producto = new ArrayList();
        try {
            Conexcion = new Conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("select * from tblproductos where ProStock > 0");
            resul = pstm.executeQuery();
            while (resul.next()) {
                Producto prod = new Producto();
                prod.setProCodigo(resul.getInt(1));
                prod.setTblProverdores(resul.getInt(2));
                prod.setProPrecio(resul.getInt(3));
                prod.setProDescuento(resul.getString(4));
                prod.setProMarca(resul.getString(5));
                prod.setProNombre(resul.getString(6));
                prod.setProFoto(resul.getString(7));
                prod.setProDescripcion(resul.getString(8));
                prod.setProFechaVencimiento(resul.getDate(9));
                prod.setProStok(resul.getInt(10));
                prod.setProVendido(resul.getInt(11));
                prod.setTblCategoria(resul.getInt(12));
                producto.add(prod);
            }

        } catch (Exception e) {
            System.out.println("Error al listar los productos por stock" + e);
        }
        return producto;
    }

    public List listarT() {
        List<Producto> producto = new ArrayList();
        try {
            Conexcion = new Conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("select * from tblproductos");
            resul = pstm.executeQuery();
            while (resul.next()) {
                Producto prod = new Producto();
                prod.setProCodigo(resul.getInt(1));
                prod.setTblProverdores(resul.getInt(2));
                prod.setProPrecio(resul.getInt(3));
                prod.setProDescuento(resul.getString(4));
                prod.setProMarca(resul.getString(5));
                prod.setProNombre(resul.getString(6));
                prod.setProFoto(resul.getString(7));
                prod.setProDescripcion(resul.getString(8));
                prod.setProFechaVencimiento(resul.getDate(9));
                prod.setProStok(resul.getInt(10));
                prod.setProVendido(resul.getInt(11));
                prod.setTblCategoria(resul.getInt(12));
                producto.add(prod);
            }

        } catch (Exception e) {
            System.out.println("Error al listarT los productos " + e);
        }
        return producto;
    }

    public List listarN(String nombre) {
        List<Producto> producto = new ArrayList();
        nombre = "%" + nombre + "%";
        try {
            Conexcion = new Conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("select * from tblproductos where ProNombre like ?");
            pstm.setString(1, nombre);
            resul = pstm.executeQuery();
            while (resul.next()) {
                Producto prod = new Producto();
                prod.setProCodigo(resul.getInt(1));
                prod.setTblProverdores(resul.getInt(2));
                prod.setProPrecio(resul.getInt(3));
                prod.setProDescuento(resul.getString(4));
                prod.setProMarca(resul.getString(5));
                prod.setProNombre(resul.getString(6));
                prod.setProFoto(resul.getString(7));
                prod.setProDescripcion(resul.getString(8));
                prod.setProFechaVencimiento(resul.getDate(9));
                prod.setProStok(resul.getInt(10));
                prod.setProVendido(resul.getInt(11));
                prod.setTblCategoria(resul.getInt(12));
                producto.add(prod);
            }

        } catch (Exception e) {
            System.out.println("Error al listarN los productos " + e);
        }
        return producto;
    }

    public Producto listarI(int id) {
        Producto prod = new Producto();
        try {
            Conexcion = new Conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("select * from tblproductos where ProCodigo = ?");
            pstm.setInt(1, id);
            resul = pstm.executeQuery();
            while (resul.next()) {

                prod.setProCodigo(resul.getInt(1));
                prod.setTblProverdores(resul.getInt(2));
                prod.setProPrecio(resul.getInt(3));
                prod.setProDescuento(resul.getString(4));
                prod.setProMarca(resul.getString(5));
                prod.setProNombre(resul.getString(6));
                prod.setProFoto(resul.getString(7));
                prod.setProDescripcion(resul.getString(8));
                prod.setProFechaVencimiento(resul.getDate(9));
                prod.setProStok(resul.getInt(10));
                prod.setProVendido(resul.getInt(11));
                prod.setTblCategoria(resul.getInt(12));
            }

        } catch (Exception e) {
            System.out.println("Error al listarI los productos " + e);
        }
        return prod;
    }

    public Producto listaridp(int idp) {
        Producto prod = new Producto();
        try {
            Conexcion = new Conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("select * from tblproductos where ProStock > 0 and ProCodigo = ?");
            pstm.setInt(1, idp);
            resul = pstm.executeQuery();
            while (resul.next()) {

                prod.setProCodigo(resul.getInt(1));
                prod.setTblProverdores(resul.getInt(2));
                prod.setProPrecio(resul.getInt(3));
                prod.setProDescuento(resul.getString(4));
                prod.setProMarca(resul.getString(5));
                prod.setProNombre(resul.getString(6));
                prod.setProFoto(resul.getString(7));
                prod.setProDescripcion(resul.getString(8));
                prod.setProFechaVencimiento(resul.getDate(9));
                prod.setProStok(resul.getInt(10));
                prod.setProVendido(resul.getInt(11));
                prod.setTblCategoria(resul.getInt(12));

            }

        } catch (Exception e) {
            System.out.println("Error al listar con idp los productos " + e);
        }
        return prod;
    }

    public List buscarCateg(int idcat) {
        List<Producto> producto = new ArrayList();
        try {
            Conexcion = new Conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("select * from tblproductos where ProStock > 0 and tblcategorias = ?");
            pstm.setInt(1, idcat);
            resul = pstm.executeQuery();
            while (resul.next()) {
                Producto prod = new Producto();
                prod.setProCodigo(resul.getInt(1));
                prod.setTblProverdores(resul.getInt(2));
                prod.setProPrecio(resul.getInt(3));
                prod.setProDescuento(resul.getString(4));
                prod.setProMarca(resul.getString(5));
                prod.setProNombre(resul.getString(6));
                prod.setProFoto(resul.getString(7));
                prod.setProDescripcion(resul.getString(8));
                prod.setProFechaVencimiento(resul.getDate(9));
                prod.setProStok(resul.getInt(10));
                prod.setProVendido(resul.getInt(11));
                prod.setTblCategoria(resul.getInt(12));
                producto.add(prod);
            }

        } catch (Exception e) {
            System.out.println("Error al listar los productos por categoria " + e);
        }
        return producto;
    }

    public List<Producto> buscarN(String nombre) {
        List<Producto> productos = new ArrayList<>();
        try {
            Conexcion = new Conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexión con la base de datos");
            }
            nombre = "%" + nombre + "%";  // Agregar el comodín para la búsqueda
            System.out.println("Consulta SQL: select * from tblproductos where ProStock > 0 and ProNombre like " + nombre);

            pstm = con.prepareStatement("select * from tblproductos where ProStock > 0 and ProNombre like ?");
            pstm.setString(1, nombre);
            resul = pstm.executeQuery();

            while (resul.next()) {
                Producto prod = new Producto();
                prod.setProCodigo(resul.getInt(1));
                prod.setTblProverdores(resul.getInt(2));
                prod.setProPrecio(resul.getInt(3));
                prod.setProDescuento(resul.getString(4));
                prod.setProMarca(resul.getString(5));
                prod.setProNombre(resul.getString(6));
                prod.setProFoto(resul.getString(7));
                prod.setProDescripcion(resul.getString(8));
                prod.setProFechaVencimiento(resul.getDate(9));
                prod.setProStok(resul.getInt(10));
                prod.setProVendido(resul.getInt(11));
                prod.setTblCategoria(resul.getInt(12));

                productos.add(prod);
            }

            System.out.println("Productos obtenidos: " + productos.size());
            for (Producto p : productos) {
                System.out.println("Producto encontrado: " + p.getProNombre());
            }

        } catch (Exception e) {
            System.out.println("Error al buscar los productos: " + e);
        }
        return productos;
    }

    public void crear(Producto pro) {
        try {
            Conexcion = new Conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("insert into tblproductos (ProPrecio, ProDescuento, ProMarca, ProNombre, ProFoto, ProDescripcion, ProFechaVencimiento, ProStock, tblcategorias , tblProveedores) Value(?,?,?,?,?,?,?,?,? , ?)");
            pstm.setInt(1, pro.getProPrecio());
            pstm.setString(2, pro.getProDescuento());
            pstm.setString(3, pro.getProMarca());
            pstm.setString(4, pro.getProNombre());
            pstm.setString(5, pro.getProFoto());
            pstm.setString(6, pro.getProDescripcion());
            pstm.setDate(7, (Date) pro.getProFechaVencimiento());
            pstm.setInt(8, pro.getProStok());
            pstm.setInt(9, pro.getTblCategoria());
            pstm.setInt(10, pro.getTblProverdores());
            pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al crear los productos" + e);
        }
    }

    public void editar(Producto pro) {
        try {
            Conexcion = new Conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("update tblproductos set ProPrecio = ? , ProDescuento = ? , ProMarca = ? , ProNombre = ? , ProFoto = ? , ProDescripcion = ? , ProFechaVencimiento = ? , ProStock = ? , tblcategorias = ? , tblProveedores = ?   where ProCodigo = ?");

            pstm.setInt(1, pro.getProPrecio());
            pstm.setString(2, pro.getProDescuento());
            pstm.setString(3, pro.getProMarca());
            pstm.setString(4, pro.getProNombre());
            pstm.setString(5, pro.getProFoto());
            pstm.setString(6, pro.getProDescripcion());
            pstm.setDate(7, (Date) pro.getProFechaVencimiento());
            pstm.setInt(8, pro.getProStok());
            pstm.setInt(9, pro.getTblCategoria());
            pstm.setInt(10, pro.getTblProverdores());
            pstm.setInt(11, pro.getProCodigo());

            pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al editar los productos " + e);
        }
    }

    public boolean eliminar(String id) {
        try {
            Conexcion = new Conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");
            }
            pstm = con.prepareStatement("delete from tblproductos where ProCodigo = ?");
            pstm.setString(1, id);
            pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al eliminar el producto " + e);
        }
        return true;
    }

    public List listarDesc() {
        List<Producto> producto = new ArrayList();
        try {
            Conexcion = new Conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("select * from tblproductos where ProStock > 0 and ProDescuento > 0");
            resul = pstm.executeQuery();
            while (resul.next()) {
                Producto prod = new Producto();
                prod.setProCodigo(resul.getInt(1));
                prod.setTblProverdores(resul.getInt(2));
                prod.setProPrecio(resul.getInt(3));
                prod.setProDescuento(resul.getString(4));
                prod.setProMarca(resul.getString(5));
                prod.setProNombre(resul.getString(6));
                prod.setProFoto(resul.getString(7));
                prod.setProDescripcion(resul.getString(8));
                prod.setProFechaVencimiento(resul.getDate(9));
                prod.setProStok(resul.getInt(10));
                prod.setProVendido(resul.getInt(11));
                prod.setTblCategoria(resul.getInt(12));
                producto.add(prod);
            }

        } catch (Exception e) {
            System.out.println("Error al listar los productos por stock" + e);
        }
        return producto;
    }

}

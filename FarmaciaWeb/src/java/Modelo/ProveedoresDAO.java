/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Configuracion.Conectar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author samuel
 */
public class ProveedoresDAO {

    Connection con;
    PreparedStatement pstm;
    Conectar Conexion;
    ResultSet resul;
   
    public void crearProveedor(Proveedores proveedor) {
        try {
            Conexion = new Conectar();
            con = Conexion.crearconexion();
            if (con != null) {
                System.out.println("Conexión establecida con la base de datos");
            }

            pstm = con.prepareStatement("INSERT INTO tblproveedores (Nombre, Direccion, Ciudad, Correo, Telefono, Contacto) VALUES (?, ?, ?, ?, ?, ?)");

            pstm.setString(1, proveedor.getNombre());
            pstm.setString(2, proveedor.getDireccion());
            pstm.setString(3, proveedor.getCiudad());
            pstm.setString(4, proveedor.getCorreo());
            pstm.setString(5, proveedor.getTelefono());
            pstm.setString(6, proveedor.getContacto());

            pstm.executeUpdate();
            System.out.println("Proveedor creado exitosamente");
        } catch (Exception e) {
            System.out.println("Error al crear el proveedor: " + e);
        }
    }


    public List<Proveedores> listarT() {
        List<Proveedores> proList = new ArrayList<>();
        try {
            Conexion = new Conectar();
            con = Conexion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexión con la base de datos");
            }
            pstm = con.prepareStatement("SELECT * FROM tblproveedores");
            ResultSet resul = pstm.executeQuery();
            while (resul.next()) {
                Proveedores prov = new Proveedores();
                prov.setId(resul.getInt("ID"));
                prov.setNombre(resul.getString("Nombre"));
                prov.setDireccion(resul.getString("Direccion"));
                prov.setCiudad(resul.getString("Ciudad"));
                prov.setCorreo(resul.getString("Correo"));
                prov.setTelefono(resul.getString("Telefono"));
                prov.setContacto(resul.getString("Contacto"));
                System.out.println("entro a proveedores");
                proList.add(prov);
            }
        } catch (Exception e) {
            System.out.println("Error al listar los Proveedores: " + e);
        }
        return proList;
    }
    
    public boolean eliminarPro(int id) {
        try {
            Conexion = new Conectar();
            con = Conexion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");
            }
            pstm = con.prepareStatement("delete from tblproveedores where ID = ?");
            pstm.setInt(1, id);
            pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al eliminar el proveedor" + e);
        }
        return true;
    }
    
    public List listarN(String nombre) {
        List<Proveedores> proveedores = new ArrayList();
        nombre = "%" + nombre + "%";
        try {
            Conexion = new Conectar();
            con = Conexion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("select * from tblproveedores where Nombre like ?");
            pstm.setString(1, nombre);
            resul = pstm.executeQuery();
            while (resul.next()) {
                Proveedores prove = new Proveedores();
                prove.setId(resul.getInt(1));
                prove.setNombre(resul.getString(2));
                prove.setDireccion(resul.getString(3));
                prove.setCiudad(resul.getString(4));
                prove.setCorreo(resul.getString(5));
                prove.setTelefono(resul.getString(6));
                prove.setContacto(resul.getString(7));
                proveedores.add(prove);
            }

        } catch (Exception e) {
            System.out.println("Error al listarN los Proveedores " + e);
        }
        return proveedores;
    }
    
    public Proveedores listaridp(int idp) {
        Proveedores prod = new Proveedores();
        try {
            Conexion = new Conectar();
            con = Conexion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("select * from tblproveedores where  ID = ?");
            pstm.setInt(1, idp);
            resul = pstm.executeQuery();
            while (resul.next()) {

                prod.setId(resul.getInt(1));
                prod.setNombre(resul.getString(2));
                prod.setDireccion(resul.getString(3));
                prod.setCiudad(resul.getString(4));
                prod.setCorreo(resul.getString(5));
                prod.setTelefono(resul.getString(6));
                prod.setContacto(resul.getString(7));

            }

        } catch (Exception e) {
            System.out.println("Error al listar con idp los Proveedores " + e);
        }
        return prod;
    }
    
    
    public void editar(Proveedores pro) {
        
        try {
            Conexion = new Conectar();
            con = Conexion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
           
                pstm = con.prepareStatement("UPDATE tblproveedores SET Nombre = ?, Direccion = ?, Ciudad = ?, Correo = ?, Telefono = ?, Contacto = ? WHERE ID = ?");
                
                pstm.setString(1, pro.getNombre());     
                pstm.setString(2, pro.getDireccion());
                pstm.setString(3, pro.getCiudad());
                pstm.setString(4, pro.getCorreo());
                pstm.setString(5, pro.getTelefono());
                pstm.setString(6, pro.getContacto());
                pstm.setInt(7, pro.getId());
           
              pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al editar los Proveedores " + e);
        }
        
    }
}
    
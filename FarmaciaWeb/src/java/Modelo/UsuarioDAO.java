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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HPLAPTOP01
 */
public class UsuarioDAO {

    Connection con;
    PreparedStatement pstm;
    Conectar Conexcion;
    ResultSet resul;
    Usuario us = new Usuario();
    Usuario usua;

    public Usuario validar(String usu, String pass) {
        usua = new Usuario();
        try {
            Conexcion = new Conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");
                pstm = con.prepareStatement("select * from tblusuarios where Usuusuario = ? ");
                pstm.setString(1, usu);
                resul = pstm.executeQuery();
                while (resul.next()) {
                    if (!resul.getString("Usuusuario").equals("")) {
                        usua.setUsuid(resul.getString("UsuId"));
                        usua.setUsunombre(resul.getString("UsuNombre"));
                        usua.setUsuapellido(resul.getString("UsuApellido"));
                        usua.setUsudireccion(resul.getString("UsuDireccion"));
                        usua.setUsutelefono(resul.getString("UsuTelefono"));
                        usua.setUsuusuario(resul.getString("Usuusuario"));
                        usua.setUsucorreo(resul.getString("UsuCorreo"));
                        usua.setUsucontrasena(resul.getString("UsuContrasena"));
                        usua.setUsutipo(resul.getString("UsuUsuarioTipo"));
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("Error al Validar el usuario en la base de datos: " + e);
        }
        return usua;
    }

    public List listarT() {
        ArrayList<Usuario> list = new ArrayList<>();
        try {
            Conexcion = new Conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");
            }
            pstm = con.prepareStatement("select * from tblusuarios");
            resul = pstm.executeQuery();
            while (resul.next()) {
                Usuario usu = new Usuario();
                usu.setUsuid(resul.getString(1));
                usu.setUsutipo(resul.getString(2));
                usu.setUsuusuario(resul.getString(3));
                usu.setUsunombre(resul.getString(4));
                usu.setUsuapellido(resul.getString(5));
                usu.setUsucorreo(resul.getString(6));
                usu.setUsutelefono(resul.getString(8));
                usu.setUsudireccion(resul.getString(9));
                list.add(usu);
            }
        } catch (Exception e) {
            System.out.println("Error al listarT los usuarios" + e);
        }
        return list;
    }

    public List listarN(String nombre) {
        ArrayList<Usuario> list = new ArrayList<>();
        nombre = "%" + nombre + "%";
        try {
            Conexcion = new Conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");
            }
            pstm = con.prepareStatement("select * from tblusuarios where UsuNombre like ?");
            pstm.setString(1, nombre);
            resul = pstm.executeQuery();
            while (resul.next()) {
                Usuario usu = new Usuario();
                usu.setUsuid(resul.getString(1));
                usu.setUsutipo(resul.getString(2));
                usu.setUsuusuario(resul.getString(3));
                usu.setUsunombre(resul.getString(4));
                usu.setUsuapellido(resul.getString(5));
                usu.setUsucorreo(resul.getString(6));
                usu.setUsutelefono(resul.getString(8));
                usu.setUsudireccion(resul.getString(9));
                list.add(usu);
            }
        } catch (Exception e) {
            System.out.println("Error al listarN los usuarios por nombre" + e);
        }
        return list;
    }

    public boolean crear(Usuario us) {
        try {
            Conexcion = new Conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");
            }
            pstm = con.prepareStatement("insert into tblusuarios values(?,?,?,?,?,?,?,?,?)");
            pstm.setString(1, us.getUsuid());
            pstm.setString(2, us.getUsutipo());
            pstm.setString(3, us.getUsuusuario());
            pstm.setString(4, us.getUsunombre());
            pstm.setString(5, us.getUsuapellido());
            pstm.setString(6, us.getUsucorreo());
            pstm.setString(7, us.getUsucontrasena());
            pstm.setString(8, us.getUsutelefono());
            pstm.setString(9, us.getUsudireccion());
            pstm.executeUpdate();
            System.out.println("usuario creado");
        } catch (Exception e) {
            System.out.println("Error al crear usuarios " + e);
        }
        return true;
    }

    public Usuario listarI(String id) {
        Usuario usu = new Usuario();
        try {
            Conexcion = new Conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");
            }
            pstm = con.prepareStatement("select * from tblusuarios where UsuId = ?");
            pstm.setString(1, id);
            resul = pstm.executeQuery();
            while (resul.next()) {
                usu.setUsuid(resul.getString(1));
                usu.setUsutipo(resul.getString(2));
                usu.setUsuusuario(resul.getString(3));
                usu.setUsunombre(resul.getString(4));
                usu.setUsuapellido(resul.getString(5));
                usu.setUsucorreo(resul.getString(6));
                usu.setUsucontrasena(resul.getString(7));
                usu.setUsutelefono(resul.getString(8));
                usu.setUsudireccion(resul.getString(9));
            }
        } catch (Exception e) {
            System.out.println("Error al listarI los usuarios por identificacion");
        }
        return usu;
    }

    

public boolean eliminarUsu(String ide) {
    try {
        Conexcion = new Conectar();
        Connection con = Conexcion.crearconexion();
        if (con != null) {
            System.out.println("Se ha establecido una conexion con la base de datos");
        }
        int idInt = Integer.parseInt(ide);
        pstm = con.prepareStatement("DELETE FROM tblusuarios WHERE UsuID = ?");
        pstm.setInt(1, idInt);  
        pstm.executeUpdate();
        return true;
    } catch (Exception e) {
        System.out.println("Error al eliminar el usuario: " + e);
        return false;
    } finally {
        try {
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (Exception e) {
            System.out.println("Error al cerrar los recursos: " + e);
        }
    }
}

    
    public boolean tipoUsu(String id, String nuevoTipo){
        try{
         Conexcion = new Conectar();
         con = Conexcion.crearconexion();
         if(con != null){
             System.out.println("Se ha es establecido una conexión con la base de datos");
         }
         pstm = con.prepareStatement("UPDATE tblusuarios SET UsuUsuarioTipo = ? WHERE UsuID = ?");
         pstm.setString(1, nuevoTipo);
         pstm.setString(2, id);
         pstm.execute();
         return true;
        }catch(Exception e){
            System.out.println("Error en cambiar el tipo" + e);
            return false;
        }
    
    }
    
    public Usuario listarU(int id) {
        Usuario usu = new Usuario();
        System.out.println("idao : " + id);
        try {
            Conexcion = new Conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");
            }
            pstm = con.prepareStatement("select * from tblusuarios where UsuID = ?");
            pstm.setInt(1, id);
            resul = pstm.executeQuery();
            while (resul.next()) {
                
                usu.setUsuid(resul.getString(1));
                usu.setUsutipo(resul.getString(2));
                usu.setUsuusuario(resul.getString(3));
                usu.setUsunombre(resul.getString(4));
                usu.setUsuapellido(resul.getString(5));
                usu.setUsucorreo(resul.getString(6));
                usu.setUsutelefono(resul.getString(8));
                usu.setUsudireccion(resul.getString(9));
                
            }
        } catch (Exception e) {
            System.out.println("Error al listarN los usuarios por nombre" + e);
        }
        return usu;
    }
    
    public boolean ActualizarCon(int id , String cont ){
        try{
         Conexcion = new Conectar();
         con = Conexcion.crearconexion();
         if(con != null){
             System.out.println("Se ha es establecido una conexión con la base de datos");
         }
         pstm = con.prepareStatement("UPDATE tblusuarios SET UsuContrasena = ? WHERE UsuID = ?");
         pstm.setString(1, cont);
         pstm.setInt(2, id);
         pstm.execute();
         return true;
        }catch(Exception e){
            System.out.println("Error en cambiar el tipo" + e);
            return false;
        }
    
    }

}

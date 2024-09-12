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
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author samuel
 */
public class PedidosDAO {

    Connection con;
    PreparedStatement pstm;
    Conectar Conexion;
    Statement stm;
    ResultSet rs;

    public List<Pedidos> listarT() {
        List<Pedidos> pqrList = new ArrayList<>();
        try {
            Conexion = new Conectar();
            con = Conexion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexión con la base de datos");
            }
            pstm = con.prepareStatement("select * from tblpedidos");
            ResultSet resul = pstm.executeQuery();
            while (resul.next()) {
                Pedidos ped = new Pedidos();
                ped.setPedCodigo(resul.getInt("PedCodigo"));
                ped.setTblUsuarios(resul.getInt("tblUsuarios"));
                ped.setPedFormaDePago(resul.getString("PedFormaDePago"));
                ped.setPedFecha(resul.getString("PedFecha"));
                ped.setPedTotal(resul.getDouble("PedTotal"));
                ped.setPedEstado(resul.getString("PedEstado"));
                pqrList.add(ped);
            }
        } catch (Exception e) {
            System.out.println("Error al listar las PQR: " + e);
        }
        return pqrList;
    }

    public void crear(Pedidos ped) {
        try {
            Conexion = new Conectar();
            con = Conexion.crearconexion();
            if (con != null) {
                System.out.println("Se establecio una conexcion con la base de datos pedido");
            }
            pstm = con.prepareStatement("insert into tblpedidos (tblUsuarios, PedFormaDePago, PedFecha, PedTotal, PedEstado) values (?, ?, ?, ?, ?)");
            pstm.setInt(1, ped.getTblUsuarios());
            pstm.setString(2, ped.getPedFormaDePago());
            pstm.setTimestamp(3, new Timestamp(new Date().getTime()));
            pstm.setDouble(4, ped.getPedTotal());
            pstm.setString(5, ped.getPedEstado());
            pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al crear pedidos en la base de datos " + e.getMessage());
        }
    }

    public int listarMx() {
        int idp = 0;
        try {
            Conexion = new Conectar();
            con = Conexion.crearconexion();
            if (con != null) {
                System.out.println("Se establecio una conexcion con la base de datos pedido");
            }
            pstm = con.prepareStatement("select MAX(PedCodigo) from tblpedidos");
            rs = pstm.executeQuery();
            while (rs.next()) {
                idp = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("Error al listar IdPedido maximo en la base de datos " + e.getMessage());
        }
        return idp;
    }

    public Pedidos listarIdp(int idp) {
        Pedidos p = new Pedidos();
        try {
            Conexion = new Conectar();
            con = Conexion.crearconexion();
            if (con != null) {
                System.out.println("Se establecio una conexcion con la base de datos pedido");
            }
            pstm = con.prepareStatement("select * from tblpedidos where PedCodigo = ?");
            pstm.setInt(1, idp);
            rs = pstm.executeQuery();
            while (rs.next()) {
                p.setPedCodigo(rs.getInt(1));
                p.setTblUsuarios(rs.getInt(2));
                p.setPedFormaDePago(rs.getString(3));
                p.setPedFecha(rs.getString(4));
                p.setPedTotal(rs.getInt(5));
                p.setPedEstado(rs.getString(6));
            }
        } catch (Exception e) {
            System.out.println("Error al listar Idp Pedido en la base de datos " + e.getMessage());
        }
        return p;
    }

    public List listarUsu(String idcliente) {
        List<Pedidos> pedido = new ArrayList();
        try {
            Conexion = new Conectar();
            con = Conexion.crearconexion();
            if (con != null) {
                System.out.println("Se establecio una conexcion con la base de datos pedido");
            }
            pstm = con.prepareStatement("select * from tblpedidos where tblUsuarios = ?");
            pstm.setString(1, idcliente);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Pedidos p = new Pedidos();
                p.setPedCodigo(rs.getInt(1));
                p.setTblUsuarios(rs.getInt(2));
                p.setPedFormaDePago(rs.getString(3));
                p.setPedFecha(rs.getString(4));
                p.setPedTotal(rs.getInt(5));
                p.setPedEstado(rs.getString(6));
                pedido.add(p);
            }
        } catch (Exception e) {
            System.out.println("Error al listar Idusu Pedido en la base de datos " + e.getMessage());
        }
        return pedido;
    }

    public void actualizar(String es, int idped) {
        try {
            Conexion = new Conectar();
            con = Conexion.crearconexion();
            if (con != null) {
                System.out.println("Se establecio una conexcion con la base de datos pedido");
            }
            pstm = con.prepareStatement("Update tblpedidos set PedEstado = ? where PedCodigo = ?");
            pstm.setString(1, es);
            pstm.setInt(2, idped);
            pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al actualizar el estado del pedido en la base de datos " + e.getMessage());
        }
    }

    public List buscarEst(String est) {
        List<Pedidos> pedido = new ArrayList();
        try {
            Conexion = new Conectar();
            con = Conexion.crearconexion();
            if (con != null) {
                System.out.println("Se establecio una conexcion con la base de datos pedido");
            }
            pstm = con.prepareStatement("select * from tblpedidos where PedEstado = ?");
            pstm.setString(1, est);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Pedidos p = new Pedidos();
                p.setPedCodigo(rs.getInt(1));
                p.setTblUsuarios(rs.getInt(2));
                p.setPedFormaDePago(rs.getString(3));
                p.setPedFecha(rs.getString(4));
                p.setPedTotal(rs.getInt(5));
                p.setPedEstado(rs.getString(6));
                pedido.add(p);
            }
        } catch (Exception e) {
            System.out.println("Error al listar Buscar por estado en la base de datos " + e.getMessage());
        }
        return pedido;
    }

    public int listarU() {
        int id = 0;
        try {
            Conexion = new Conectar();
            con = Conexion.crearconexion();
            if (con != null) {
                System.out.println("Se establecio una conexcion con la base de datos pedido");
            }
            pstm = con.prepareStatement("SELECT * FROM tblpedidos ORDER BY PedCodigo DESC LIMIT 1");
            rs = pstm.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("Error al listar IdPedido maximo en la base de datos " + e.getMessage());
        }
        return id;
    }
    
    public boolean estadoPED(String id, String nuevoEstado) {
        try {
            Conexion = new Conectar();
            con = Conexion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexión con la base de datos");
            }
            pstm = con.prepareStatement("UPDATE tblpedidos SET PedEstado = ? WHERE PedCodigo = ?");
             pstm.setString(1, nuevoEstado); 
             pstm.setString(2, id); 
            pstm.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error al actualizar el estado de la PQR: " + e);
            return false;
        } 
        
    }
}

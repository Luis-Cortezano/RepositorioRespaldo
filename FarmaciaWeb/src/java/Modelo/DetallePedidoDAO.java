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
public class DetallePedidoDAO {

    Connection con;
    PreparedStatement pstm;
    Statement stm;
    Conectar cone;
    ResultSet rs;

    public void crear(DetallePedido dp) {
        try {
            cone = new Conectar();
            con = cone.crearconexion();
            if (con != null) {
                System.out.println("Se establecio una conexcion con la base de datos");
            }
            pstm = con.prepareStatement("insert into tbldetallesdepedidos ( tblProducto , tblPedido, DpdCantidad , DpdPrecioTotal , DpdNombreProducto , DpdPrecioUnitario , DpdFecha) values (?, ?, ?, ?, ? , ? , ? )");
            pstm.setInt(1, dp.getTblProducto());
            pstm.setInt(2, dp.getTblPedido());
            pstm.setInt(3, dp.getDpdCantidad());
            pstm.setInt(4, dp.getDpdPrecioTotal());
            pstm.setString(5, dp.getDpdNombreProducto());
            pstm.setInt(6, dp.getDpdPrecioUnitario());
            pstm.setTimestamp(7, new Timestamp(new Date().getTime())); 
            pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al crear en la base de datos " + e.getMessage());
        }
    }

    public List Listar(int idp) {
        List<DetallePedido> detped = new ArrayList();
        try {
            cone = new Conectar();
            con = cone.crearconexion();
            if (con != null) {
                System.out.println("Se establecio una conexcion con la base de datos");
            }
            pstm = con.prepareStatement("select * from tbldetallesdepedidos where tblPedido = ?");
            pstm.setInt(1, idp);
            rs = pstm.executeQuery();
            while (rs.next()) {
                DetallePedido dep = new DetallePedido();
                dep.setDpdCodigo(rs.getInt(1));
                dep.setTblProducto(rs.getInt(2));
                dep.setTblPedido(rs.getInt(3));
                dep.setDpdCantidad(rs.getInt(4));
                dep.setDpdPrecioTotal(rs.getInt(5));
                dep.setDpdNombreProducto(rs.getString(6));
                dep.setDpdPrecioUnitario(rs.getInt(7));
                dep.setDpdFecha(rs.getDate(8));
                detped.add(dep);
            }
        } catch (Exception e) {
            System.out.println("Error al listar los detalles de pedido" + e.getMessage());
        }
        return detped;
    }
}

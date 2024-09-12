/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.Date;

/**
 *
 * @author samuel
 */
public class DetallePedido {
    
    private int dpdCodigo;
    private int tblProducto;
    private int tblPedido;
    private int dpdCantidad;
    private int dpdPrecioTotal;
    private String dpdNombreProducto;
    private int dpdPrecioUnitario;
    private Date dpdFecha;

    public DetallePedido() {
    }

    public DetallePedido(int dpdCodigo, int tblProducto, int tblPedido, int dpdCantidad, int dpdPrecioTotal, String dpdNombreProducto, int dpdPrecioUnitario, Date dpdFecha) {
        this.dpdCodigo = dpdCodigo;
        this.tblProducto = tblProducto;
        this.tblPedido = tblPedido;
        this.dpdCantidad = dpdCantidad;
        this.dpdPrecioTotal = dpdPrecioTotal;
        this.dpdNombreProducto = dpdNombreProducto;
        this.dpdPrecioUnitario = dpdPrecioUnitario;
        this.dpdFecha = dpdFecha;
    }

    public int getDpdCodigo() {
        return dpdCodigo;
    }

    public void setDpdCodigo(int dpdCodigo) {
        this.dpdCodigo = dpdCodigo;
    }

    public int getTblProducto() {
        return tblProducto;
    }

    public void setTblProducto(int tblProducto) {
        this.tblProducto = tblProducto;
    }

    public int getTblPedido() {
        return tblPedido;
    }

    public void setTblPedido(int tblPedido) {
        this.tblPedido = tblPedido;
    }

    public int getDpdCantidad() {
        return dpdCantidad;
    }

    public void setDpdCantidad(int dpdCantidad) {
        this.dpdCantidad = dpdCantidad;
    }

    public int getDpdPrecioTotal() {
        return dpdPrecioTotal;
    }

    public void setDpdPrecioTotal(int dpdPrecioTotal) {
        this.dpdPrecioTotal = dpdPrecioTotal;
    }

    public String getDpdNombreProducto() {
        return dpdNombreProducto;
    }

    public void setDpdNombreProducto(String dpdNombreProducto) {
        this.dpdNombreProducto = dpdNombreProducto;
    }

    public int getDpdPrecioUnitario() {
        return dpdPrecioUnitario;
    }

    public void setDpdPrecioUnitario(int dpdPrecioUnitario) {
        this.dpdPrecioUnitario = dpdPrecioUnitario;
    }

    public Date getDpdFecha() {
        return dpdFecha;
    }

    public void setDpdFecha(Date dpdFecha) {
        this.dpdFecha = dpdFecha;
    }

   
    
}

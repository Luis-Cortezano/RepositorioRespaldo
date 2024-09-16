/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author samuel
 */
public class Pedidos {

    private int pedCodigo;
    private int tblUsuarios;
    private String PedFormaDePago;
    private String PedFecha;
    private double pedTotal;
    private String PedEstado;
    private String  usuNombre;
    private String  usuDireccion;
    private String  usuTelefono;
    public Pedidos() {
    }

    public Pedidos(int pedCodigo, int tblUsuarios, String PedFormaDePago, String PedFecha, double pedTotal, String PedEstado, String usuNombre, String usuDireccion, String usuTelefono) {
        this.pedCodigo = pedCodigo;
        this.tblUsuarios = tblUsuarios;
        this.PedFormaDePago = PedFormaDePago;
        this.PedFecha = PedFecha;
        this.pedTotal = pedTotal;
        this.PedEstado = PedEstado;
        this.usuNombre = usuNombre;
        this.usuDireccion = usuDireccion;
        this.usuTelefono = usuTelefono;
    }

    public int getPedCodigo() {
        return pedCodigo;
    }

    public void setPedCodigo(int pedCodigo) {
        this.pedCodigo = pedCodigo;
    }

    public int getTblUsuarios() {
        return tblUsuarios;
    }

    public void setTblUsuarios(int tblUsuarios) {
        this.tblUsuarios = tblUsuarios;
    }

    public String getPedFormaDePago() {
        return PedFormaDePago;
    }

    public void setPedFormaDePago(String PedFormaDePago) {
        this.PedFormaDePago = PedFormaDePago;
    }

    public String getPedFecha() {
        return PedFecha;
    }

    public void setPedFecha(String PedFecha) {
        this.PedFecha = PedFecha;
    }

    public double getPedTotal() {
        return pedTotal;
    }

    public void setPedTotal(double pedTotal) {
        this.pedTotal = pedTotal;
    }

    public String getPedEstado() {
        return PedEstado;
    }

    public void setPedEstado(String PedEstado) {
        this.PedEstado = PedEstado;
    }

    public String getUsuNombre() {
        return usuNombre;
    }

    public void setUsuNombre(String usuNombre) {
        this.usuNombre = usuNombre;
    }

    public String getUsuDireccion() {
        return usuDireccion;
    }

    public void setUsuDireccion(String usuDireccion) {
        this.usuDireccion = usuDireccion;
    }

    public String getUsuTelefono() {
        return usuTelefono;
    }

    public void setUsuTelefono(String usuTelefono) {
        this.usuTelefono = usuTelefono;
    }



    
}

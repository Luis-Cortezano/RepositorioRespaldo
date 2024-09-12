/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.Date;

/**
 *
 * @author SENA
 */
public class Producto {

    private int proCodigo;
    private int tblProverdores;
    private int proPrecio;
    private int proDescuento;
    private String proMarca;
    private String proNombre;
    private String proFoto;
    private String proDescripcion;
    private Date proFechaVencimiento;
    private int proStok;
    private int tblCategoria;
    private int proVendido;

    public Producto() {
    }

    public Producto(int proCodigo, int tblProverdores, int proPrecio, int proDescuento, String proMarca, String proNombre, String proFoto, String proDescripcion, Date proFechaVencimiento, int proStok, int tblCategoria, int proVendido) {
        this.proCodigo = proCodigo;
        this.tblProverdores = tblProverdores;
        this.proPrecio = proPrecio;
        this.proDescuento = proDescuento;
        this.proMarca = proMarca;
        this.proNombre = proNombre;
        this.proFoto = proFoto;
        this.proDescripcion = proDescripcion;
        this.proFechaVencimiento = proFechaVencimiento;
        this.proStok = proStok;
        this.tblCategoria = tblCategoria;
        this.proVendido = proVendido;
    }

    public int getProCodigo() {
        return proCodigo;
    }

    public void setProCodigo(int proCodigo) {
        this.proCodigo = proCodigo;
    }

    public int getTblProverdores() {
        return tblProverdores;
    }

    public void setTblProverdores(int tblProverdores) {
        this.tblProverdores = tblProverdores;
    }

    public int getProPrecio() {
        return proPrecio;
    }

    public void setProPrecio(int proPrecio) {
        this.proPrecio = proPrecio;
    }

    public int getProDescuento() {
        return proDescuento;
    }

    public void setProDescuento(int proDescuento) {
        this.proDescuento = proDescuento;
    }

    public String getProMarca() {
        return proMarca;
    }

    public void setProMarca(String proMarca) {
        this.proMarca = proMarca;
    }

    public String getProNombre() {
        return proNombre;
    }

    public void setProNombre(String proNombre) {
        this.proNombre = proNombre;
    }

    public String getProFoto() {
        return proFoto;
    }

    public void setProFoto(String proFoto) {
        this.proFoto = proFoto;
    }

    public String getProDescripcion() {
        return proDescripcion;
    }

    public void setProDescripcion(String proDescripcion) {
        this.proDescripcion = proDescripcion;
    }

    public Date getProFechaVencimiento() {
        return proFechaVencimiento;
    }

    public void setProFechaVencimiento(Date proFechaVencimiento) {
        this.proFechaVencimiento = proFechaVencimiento;
    }

    public int getProStok() {
        return proStok;
    }

    public void setProStok(int proStok) {
        this.proStok = proStok;
    }

    public int getTblCategoria() {
        return tblCategoria;
    }

    public void setTblCategoria(int tblCategoria) {
        this.tblCategoria = tblCategoria;
    }

    public int getProVendido() {
        return proVendido;
    }

    public void setProVendido(int proVendido) {
        this.proVendido = proVendido;
    }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author SENA
 */
public class Categoria {
    private int CatCodigo;
    private String CatNombre;
    private String CatDescripcion;

    public Categoria() {
    }

    public Categoria(int CatCodigo, String CatNombre, String CatDescripcion) {
        this.CatCodigo = CatCodigo;
        this.CatNombre = CatNombre;
        this.CatDescripcion = CatDescripcion;
    }

    public int getCatCodigo() {
        return CatCodigo;
    }

    public void setCatCodigo(int CatCodigo) {
        this.CatCodigo = CatCodigo;
    }

    public String getCatNombre() {
        return CatNombre;
    }

    public void setCatNombre(String CatNombre) {
        this.CatNombre = CatNombre;
    }

    public String getCatDescripcion() {
        return CatDescripcion;
    }

    public void setCatDescripcion(String CatDescripcion) {
        this.CatDescripcion = CatDescripcion;
    }
    
    
    
}

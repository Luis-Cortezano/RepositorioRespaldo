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
public class Usuario {

    private String usuId;
    private String usuTipo;
    private String usuUsuario;
    private String usuNombre;
    private String usuApellido;
    private String usuCorreo;
    private String usuContrasena;
    private String usuTelefono;
    private String usuDireccion;

    public Usuario() {
    }

    public Usuario(String usuId, String usuNombre, String usuApellido, String usuDireccion, String usuTelefono, String usuCorreo, String usuUsuario, String usuContrasena, String usuTipo) {
        this.usuId = usuId;
        this.usuNombre = usuNombre;
        this.usuApellido = usuApellido;
        this.usuDireccion = usuDireccion;
        this.usuTelefono = usuTelefono;
        this.usuCorreo = usuCorreo;
        this.usuUsuario = usuUsuario;
        this.usuContrasena = usuContrasena;
        this.usuTipo = usuTipo;
    }

    public String getUsuid() {
        return usuId;
    }

    public void setUsuid(String usuId) {
        this.usuId = usuId;
    }

    public String getUsunombre() {
        return usuNombre;
    }

    public void setUsunombre(String usuNombre) {
        this.usuNombre = usuNombre;
    }

    public String getUsuapellido() {
        return usuApellido;
    }

    public void setUsuapellido(String usuApellido) {
        this.usuApellido = usuApellido;
    }

    public String getUsudireccion() {
        return usuDireccion;
    }

    public void setUsudireccion(String usuDireccion) {
        this.usuDireccion = usuDireccion;
    }

    public String getUsutelefono() {
        return usuTelefono;
    }

    public void setUsutelefono(String usuTelefono) {
        this.usuTelefono = usuTelefono;
    }

    public String getUsucorreo() {
        return usuCorreo;
    }

    public void setUsucorreo(String usuCorreo) {
        this.usuCorreo = usuCorreo;
    }

    public String getUsuusuario() {
        return usuUsuario;
    }

    public void setUsuusuario(String usuUsuario) {
        this.usuUsuario = usuUsuario;
    }

    public String getUsucontrasena() {
        return usuContrasena;
    }

    public void setUsucontrasena(String usuContrasena) {
        this.usuContrasena = usuContrasena;
    }

    public String getUsutipo() {
        return usuTipo;
    }

    public void setUsutipo(String usuTipo) {
        this.usuTipo = usuTipo;
    }

    

}

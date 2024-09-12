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
 * @author SENA
 */
public class CategoriaDAO {

    Connection con;
    PreparedStatement pstm;
    Conectar Conexcion;
    ResultSet resul;

    public List listar() {
        List<Categoria> categoria = new ArrayList();
        try {
            Conexcion = new Conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("select * from tblcategorias");
            resul = pstm.executeQuery();
            while (resul.next()) {
                Categoria cat = new Categoria();
                cat.setCatCodigo(resul.getInt(1));
                cat.setCatNombre(resul.getString(2));
                cat.setCatDescripcion(resul.getString(3));
                categoria.add(cat);
            }

        } catch (Exception e) {
            System.out.println("Error al listar las categorias " + e);
        }
        return categoria;
    }
}

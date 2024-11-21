/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Timestamp;

/**
 *
 * @author rendo
 */
public class Animale {

    private int id;
    private String especie;
    private String nombre;
    private String color;
    private Double peso;
    private String diagnostico;
    private String estado;

    public Animale() {
    }

    public Animale(int id, String especie, String nombre, String color, Double peso, String diagnostico, String estado) {
        this.id = id;
        this.especie = especie;
        this.nombre = nombre;
        this.color = color;
        this.peso = peso;
        this.diagnostico = diagnostico;
        this.estado = estado;
    }

    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEspecie() {
        return especie;
    }

    public void setEspecie(String especie) {
        this.especie = especie;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public Double getPeso() {
        return peso;
    }

    public void setPeso(Double peso) {
        this.peso = peso;
    }

    public String getDiagnostico() {
        return diagnostico;
    }

    public void setDiagnostico(String diagnostico) {
        this.diagnostico = diagnostico;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }


    @Override
    public String toString() {
        return "Animale{" + "id=" + id + ", especie=" + especie + ", nombre=" + nombre + ", color=" + color + ", peso=" + peso + ", diagnostico=" + diagnostico + ", estado=" + estado + '}';
    }

}

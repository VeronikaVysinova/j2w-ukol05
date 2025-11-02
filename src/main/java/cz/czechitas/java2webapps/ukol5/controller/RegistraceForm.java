package cz.czechitas.java2webapps.ukol5.controller;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.time.Period;
import java.util.EnumSet;

public class RegistraceForm {
    @NotBlank
    private String jmeno;
    @NotBlank
    private String prijmeni;
    @NotNull
    private LocalDate datumNarozeni;
    @Email
    private String email;
    private String telefon;

    private int vek;

    @NotNull
    private PohlaviEnum pohlavi;
    public PohlaviEnum getPohlavi() {
        return pohlavi;
    }

    public void setPohlavi(PohlaviEnum pohlavi) {
        this.pohlavi = pohlavi;
    }

    @NotNull
    private TurnusEnum turnus;

    public TurnusEnum getTurnus() {
        return turnus;
    }
    public void setTurnus(TurnusEnum turnus) {
        this.turnus = turnus;
    }

    public String getJmeno() {
        return jmeno;
    }

    public void setJmeno(String jmeno) {
        this.jmeno = jmeno;
    }

    public String getPrijmeni() {
        return prijmeni;
    }

    public void setPrijmeni(String prijmeni) {
        this.prijmeni = prijmeni;
    }

    public LocalDate getDatumNarozeni() {
        return datumNarozeni;
    }

    public void setDatumNarozeni(LocalDate datumNarozeni) {
        this.datumNarozeni = datumNarozeni;
    }



    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefon() {
        return telefon;
    }

    public void setTelefon(String telefon) {
        this.telefon = telefon;
    }

    public int getVek() {
        Period period = Period.between(datumNarozeni, LocalDate.now());
        int vek = period.getYears();
        return vek;
    }



}

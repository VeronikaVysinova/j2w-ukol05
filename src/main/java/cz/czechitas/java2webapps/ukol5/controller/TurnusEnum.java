package cz.czechitas.java2webapps.ukol5.controller;

public enum TurnusEnum {
   TURNUS_1("5.–11.7.2026"),
   TURNUS_2("12.–18.7.2026"),
   TURNUS_3("19.–25.7.2026");

   private final String datum;

   TurnusEnum(String datum) {
      this.datum = datum;
   }

   public String getDatum() {
      return datum;
   }
}


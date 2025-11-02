package cz.czechitas.java2webapps.ukol5.controller;

import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Random;

/**
 * Kontroler obsluhující registraci účastníků dětského tábora.
 */
@Controller
@RequestMapping("/")
public class RegistraceController {
  private final Random random = new Random();

  @GetMapping("")
  public ModelAndView index() {
    ModelAndView modelAndView = new ModelAndView("/formular");
    modelAndView.addObject("form", new RegistraceForm());

    // Přidání enumu do šablony pro výběr pohlaví
    modelAndView.addObject("PohlaviEnum", PohlaviEnum.values());
    //Přidání enumu do šablony pro výběr turnusu
    modelAndView.addObject("TurnusEnum", TurnusEnum.values());

    return modelAndView;
  }


  @PostMapping("/")
  public Object form(@Valid @ModelAttribute("form") RegistraceForm form, BindingResult bindingResult) {

    /* kontrola pro zadany vek
    System.out.println("Zadané datum narození: " + form.getDatumNarozeni());
    System.out.println("Věk: " + form.getVek()); */


    if (form.getDatumNarozeni() == null || form.getVek() < 9 || form.getVek() > 15) {
      return new ModelAndView("/nespravny-vek");
    }

    if (bindingResult.hasErrors()) { //metoda, ktera rika, jestli tam jsou chyby. Kdyz ano, zobrazi se znovu ten formular a zobrazi chyby v okne s formularem
      return new ModelAndView( "/formular")
              .addObject("form", form)
              .addObject("TurnusEnum", TurnusEnum.values())
              .addObject("PohlaviEnum", PohlaviEnum.values());
    }

    return new ModelAndView("/rekapitulace")
            .addObject("form", form)
            .addObject("TurnusEnum", TurnusEnum.values());

  }


  @RequestMapping(value = "/objednano", method = RequestMethod.POST, params = "submit")
  public ModelAndView odeslano (@Valid @ModelAttribute("form") RegistraceForm form, BindingResult bindingResult) {
    return new ModelAndView("/objednano")
            .addObject("jmeno",form.getJmeno()+" "+ form.getPrijmeni())
            .addObject("turnus", form.getTurnus());

  }

  @RequestMapping(value = "/formular", method = RequestMethod.POST, params = "cancel")
  public ModelAndView vratitNaFormular(@ModelAttribute("form") RegistraceForm form) {
    return new ModelAndView("/formular")
            .addObject("form", form)
            .addObject("PohlaviEnum", PohlaviEnum.values())
            .addObject("TurnusEnum", TurnusEnum.values());
  }
}

int kleurTitel = #0000FF;
int kleurKnoppenAantalMijnen = #00FFFF;
int kleurKnoppenAantalMunten = #FFFF00;
int kleurStartKnop = #FF9900;

void tekenStartScherm() {
  background(#88AADD);
  tekenTekst(xTitel, yTitel, grootteTitel, "Diving for Treasure", kleurTitel);
  
  tekenTekst(xKnoppenAantalMijnen, yKnoppenAantalMijnen, breedteKnoppenAantal, "Stel het aantal mijnen in:", 0);
  tekenKnoppenStartScherm(xKnoppenAantalMijnen, yKnoppenAantalMijnen, breedteKnoppenAantal, hoogteKnoppenAantal, 
    mogelijkeNummersAantalMijnen, kleurKnoppenAantalMijnen);
  
  tekenTekst(xKnoppenAantalMunten, yKnoppenAantalMunten, breedteKnoppenAantal, "Stel het aantal munten in:", 0);
  tekenKnoppenStartScherm(xKnoppenAantalMunten, yKnoppenAantalMunten, breedteKnoppenAantal, hoogteKnoppenAantal, 
    mogelijkeNummersAantalMunten, kleurKnoppenAantalMunten);
    
  tekenKnop(xStartKnop, yStartKnop, breedteStartKnop, hoogteStartKnop, "Start het spel", kleurStartKnop);
}

void handelStartSchermInteractieAf() {
  aantalMijnen = handelKnoppenAantalInteractieAf(xKnoppenAantalMijnen, yKnoppenAantalMijnen, breedteKnoppenAantal, hoogteKnoppenAantal, 
      mogelijkeNummersAantalMijnen, aantalMijnen);
  aantalMunten = handelKnoppenAantalInteractieAf(xKnoppenAantalMunten, yKnoppenAantalMunten, breedteKnoppenAantal, hoogteKnoppenAantal, 
      mogelijkeNummersAantalMunten, aantalMunten);
  handelStartKnopInteractieAf(xStartKnop, yStartKnop, breedteStartKnop, hoogteStartKnop);
}

int handelKnoppenAantalInteractieAf(int x, int y, int breedte, int hoogte, int[] nummers, int aantal) {
  if (mouseX > x - breedte * nummers.length / 2 && mouseX < x + breedte * nummers.length / 2 &&
       mouseY > y && mouseY < y + hoogte) {
     aantal = nummers[(mouseX - (x - breedte * nummers.length / 2)) / breedte];
  }
  return aantal;
}
  
void handelStartKnopInteractieAf(int x, int y, int breedte, int hoogte) {
  if (mouseX > x && mouseX < x + breedte && mouseY > y && mouseY < y + hoogte) {
    gameState = 1;
    roosterObjecten = new String[aantalVakkenVerticaal][aantalVakkenHorizontaal];
    roosterObjecten = bepaalPositiesObject("MIJN", aantalMijnen, roosterObjecten);
    roosterObjecten = bepaalPositiesObject("MUNT", aantalMunten, roosterObjecten);
    
    setIsDuiker1Levend(true);
    setIsDuiker2Levend(true);
    aantalLevens1 = 3;
    aantalLevens2 = 3;
    score1 = 0;
    score2 = 0;
  }
}

void tekenKnoppenStartScherm(int x, int y, int breedte, int hoogte, int[] nummers, int kleur) {
  x -= breedte * nummers.length / 2;
  for (int i = 0; i < nummers.length; i++) {
  tekenKnop(x + i * breedte, y, breedte, hoogte, nummers[i], kleur);
  }
}

void tekenKnop(int x, int y, int breedte, int hoogte, int nummer, int kleur) {
  fill(kleur);
  rect(x, y, breedte, hoogte);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(breedte / 3);
  text(nummer, x + (breedte / 2), y + (hoogte / 2));
}

void tekenKnop(int x, int y, int breedte, int hoogte, String tekst, int kleur) {
  fill(kleur);
  rect(x, y, breedte, hoogte);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(breedte / 8);
  text(tekst, x + (breedte / 2), y + (hoogte / 2));
}

void tekenTekst(int x, int y, int breedte, String tekst, int kleur) {
  fill(kleur);
  textAlign(CENTER, BOTTOM);
  textSize(breedte * 2 / 5);
  text(tekst, x, y);
}

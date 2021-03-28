String[][] bepaalPositiesObject(String naam, int aantal, String[][]roosterObjecten) {
  int y;
  int x;
  boolean isLegePlek;
  
  for (int i = 0; i < aantal; i++) {
    isLegePlek = false;
    while (!isLegePlek) {
      y = floor(random(1, roosterObjecten.length - 1));
      x = floor(random(0, roosterObjecten[0].length));
      if (roosterObjecten[y][x] == null) {
        roosterObjecten[y][x] = naam;
        isLegePlek = true;
      }
    }
  }
  
  return roosterObjecten;
}

void activeerObjectinRooster(int x, int y, String naam, String naamDuiker) {
  if (naamDuiker == "Duiker1") {
    boolean enterIngedrukt = keyPressed && (key == ENTER || key == RETURN);
    if (naam == "MIJN") {
      aantalLevens1--;
      positieDuiker1[1] = startPositieDuiker[1];
      setIsDuiker1AanHetDalen(false);
      verwijderObjectUitRooster(x, y);
    }
    
    if (naam == "MUNT" && enterIngedrukt) {
      score1 += 50;
      verwijderObjectUitRooster(x, y);
    }
    
    if (aantalLevens1 <= 0) {
      setIsDuiker1Levend(false);
    }
  }
  
    if (naamDuiker == "Duiker2") {
    boolean eIngedrukt = keyPressed && (key == 'e' || key == 'E');
    if (naam == "MIJN") {
      aantalLevens2--;
      positieDuiker2[1] = startPositieDuiker[1];
      setIsDuiker2AanHetDalen(false);
      verwijderObjectUitRooster(x, y);
    }
    
    if (naam == "MUNT" && eIngedrukt) {
      score2 += 50;
      verwijderObjectUitRooster(x, y);
    }
    
    if (aantalLevens2 <= 0) {
      setIsDuiker2Levend(false);
    }
  }
}

void verwijderObjectUitRooster(int x, int y) {
  roosterObjecten[y][x] = null;
}

void tekenObjecten(float x, float y, String[][] rooster, float grootteVak, int kleurMijn, int kleurMunt) {
  for(int i = 0; i < rooster.length; i++) {
    tekenRijObjecten(x, y, rooster[i], grootteVak, kleurMijn, kleurMunt);
    y += grootteVak;
  }
}

void tekenRijObjecten(float x, float y, String[] rij, float grootteVak, int kleurMijn, int kleurMunt) {
    float startX = x;
    for(int i = 0; i < rij.length; i++) {
      if (rij[i] == "MIJN") {
        tekenMijn(x, y, grootteVak, kleurMijn);
      }
      if (rij[i] == "MUNT") {
        tekenMunt(x, y, grootteVak, kleurMunt);
      }
      x += grootteVak;
   }
   x = startX; 
}

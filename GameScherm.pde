int kleurLucht = #BBFFFF;
int kleurWater = #88AADD;
int kleurMijn = #000000;
int kleurMunt = #FFFF00;
int kleurDuiker1 = #FF66FF;
int kleurDuiker2 = #66FF66;
int kleurLeven = #FF0000;
int kleurScore = #000000;

void tekenGameScherm() {
  background(kleurLucht);
  tekenWater(xWater, yWater, width, height, kleurWater);
  
  if (isDuiker1Levend) {
    positieDuiker1 = beweegDuiker1Verticaal(positieDuiker1);
    handelDuiker1ObjectInteractieAf(positieDuiker1);
    tekenDuiker(positieDuiker1, grootteVak, kleurDuiker1);
  }
  if (isDuiker2Levend) {
    positieDuiker2 = beweegDuiker2Verticaal(positieDuiker2);
    handelDuiker2ObjectInteractieAf(positieDuiker2);
    tekenDuiker(positieDuiker2, grootteVak, kleurDuiker2);
  }
  
  tekenObjecten(xWater, yWater, roosterObjecten, grootteVak, kleurMijn, kleurMunt);
  
  tekenLevens1(xLevens1, yLevens1, grootteLevens, aantalLevens1, kleurLeven);
  tekenLevens2(xLevens2, yLevens2, grootteLevens, aantalLevens2, kleurLeven);
  tekenScore1(xScore1, yScore1, grootteLettersScore, score1, kleurScore);
  tekenScore2(xScore2, yScore2, grootteLettersScore, score2, kleurScore);
}

void handelGameSchermInteractieAf() {
  positieDuiker1 = beweegDuiker1Horizontaal(positieDuiker1);
  positieDuiker2 = beweegDuiker2Horizontaal(positieDuiker2);
}

boolean checkOfSpelVoorbijIs() {
  boolean isSpelVoorbij = false;
  if (!isDuiker1Levend && !isDuiker2Levend) {
    isSpelVoorbij = true;
  }
  
  return isSpelVoorbij;
}

void tekenLevens1(float x, float y, float grootte, int aantal, int kleur) {
  for(int i = 0; i < aantal; i++) {
    tekenLeven(x + i * grootte * 2, y, grootte * 2, kleur);
  }
}

void tekenLevens2(float x, float y, float grootte, int aantal, int kleur) {
  for(int i = 0; i < aantal; i++) {
    tekenLeven(x - (i + 1) * grootte * 2, y, grootte * 2, kleur);
  }
}

void tekenLeven(float x, float y, float grootte, int kleur) {
  fill(kleur);
  ellipseMode(CORNER);
  ellipse(x, y, grootte, grootte);
}

void tekenScore1(float x, float y, int grootteLetters, int score, int kleur) {
  fill(kleur);
  textAlign(LEFT, TOP);
  textSize(grootteLetters);
  text("Score: " + score, x, y);
}

void tekenScore2(float x, float y, int grootteLetters, int score, int kleur) {
  fill(kleur);
  textAlign(RIGHT, TOP);
  textSize(grootteLetters);
  text("Score: " + score, x, y);
}


void tekenWater(float x, float y, int breedte, int hoogte, int kleur) {
  fill(kleur);
  rect(x, y, breedte, hoogte);
}

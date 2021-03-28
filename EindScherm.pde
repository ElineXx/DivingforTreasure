int kleurScore1EindScherm = #FF66FF;
int kleurScore2EindScherm = #66FF66;
int kleurSpeelOpnieuwKnop = #FF9900;

void tekenEindScherm() {
  background(#88AADD);
  tekenScore1EindScherm(xScoreEindScherm, yScore1EindScherm, grootteLettersScoreEindscherm, kleurScore1EindScherm);
  tekenScore2EindScherm(xScoreEindScherm, yScore2EindScherm, grootteLettersScoreEindscherm, kleurScore2EindScherm);
  tekenKnopEindScherm(xStartKnop, yStartKnop, breedteStartKnop, hoogteStartKnop, "Speel nog een keer", kleurSpeelOpnieuwKnop);
}

void handelEindSchermInteractieAf() {
  handelSpeelOpnieuwKnopInteractieAf(xStartKnop, yStartKnop, breedteStartKnop, hoogteStartKnop);
}

void handelSpeelOpnieuwKnopInteractieAf(int x, int y, int breedte, int hoogte) {
  if (mouseX > x && mouseX < x + breedte && mouseY > y && mouseY < y + hoogte) {
    gameState = 0;
  }
}

void tekenScore1EindScherm(float x, float y, int grootteLetters, int kleur) {
  fill(kleur);
  textAlign(CENTER, CENTER);
  textSize(grootteLetters);
  text("Score speler 1 = " + score1, x, y);
}

void tekenScore2EindScherm(float x, float y, int grootteLetters, int kleur) {
  fill(kleur);
  textAlign(CENTER, CENTER);
  textSize(grootteLetters);
  text("Score speler 2 = " + score2, x, y);
}

void tekenKnopEindScherm(int x, int y, int breedte, int hoogte, String tekst, int kleur) {
  fill(kleur);
  rect(x, y, breedte, hoogte);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(breedte / 12);
  text(tekst, x + (breedte / 2), y + (hoogte / 2));
}

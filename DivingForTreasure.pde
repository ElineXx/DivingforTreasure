final int STARTSCHERM = 0;
final int GAMESCHERM = 1;
final int EINDSCHERM = 2;

int gameState = 0;

int aantalMijnen = 50;
int aantalMunten = 50;

//StartScherm
int xTitel;
int yTitel;
int grootteTitel;

int breedteKnoppenAantal;
int hoogteKnoppenAantal;

int xKnoppenAantalMijnen;
int yKnoppenAantalMijnen;
int[] mogelijkeNummersAantalMijnen = {10, 25, 50, 100};

int xKnoppenAantalMunten;
int yKnoppenAantalMunten;
int[] mogelijkeNummersAantalMunten = {10, 25, 50, 100};

int xStartKnop;
int yStartKnop;
int breedteStartKnop;
int hoogteStartKnop;

//GameScherm
float xWater;
float yWater;

int aantalVakkenVerticaal = 60;
float grootteVak;
int aantalVakkenHorizontaal;
String[][] roosterObjecten;

float[] startPositieDuiker = new float[2];
float[] positieDuiker1 = new float[2];
float[] positieDuiker2 = new float[2];

int aantalLevens1 = 3;
int aantalLevens2 = 3;
int score1 = 0;
int score2 = 0;

float xLevens1;
float yLevens1;
float xLevens2;
float yLevens2;
float grootteLevens;

float xScore1;
float yScore1;
float xScore2;
float yScore2;
int grootteLettersScore;

// EindScherm
int xScoreEindScherm;
int yScore1EindScherm;
int yScore2EindScherm;
int grootteLettersScoreEindscherm;

void setup() {
  size(400, 800);
  
  //StartScherm
  xTitel = width / 2;
  yTitel = height * 3 / 20;
  grootteTitel = width / 4;
  
  breedteKnoppenAantal = width / 8;
  hoogteKnoppenAantal = height / 20;

  xKnoppenAantalMijnen = width / 2;
  yKnoppenAantalMijnen = height * 3 / 10;

  xKnoppenAantalMunten = width / 2;
  yKnoppenAantalMunten = height * 4 / 10;
  
  xStartKnop = width / 10;
  yStartKnop = height * 6 / 10;
  breedteStartKnop = width * 8 / 10;
  hoogteStartKnop =  height * 3 / 20;
  
  // GameScherm
  xWater = 0;
  yWater = height / 4;
  grootteVak = (height - yWater) / aantalVakkenVerticaal;
  aantalVakkenHorizontaal = floor(width / grootteVak);
  
  xLevens1 = 0;
  yLevens1 = 0;
  xLevens2 = width;
  yLevens2 = 0;
  grootteLevens = grootteVak;

  xScore1 = 0;
  yScore1 = 0 + grootteVak * 2;
  xScore2 = width;
  yScore2 = 0 + grootteVak * 2;
  grootteLettersScore = width / 20;
 
  startPositieDuiker[0] = width / 2;
  startPositieDuiker[1] = yWater;
  positieDuiker1[0] = startPositieDuiker[0] - grootteVak;
  positieDuiker1[1] = startPositieDuiker[1];
  positieDuiker2[0] = startPositieDuiker[0];
  positieDuiker2[1] = startPositieDuiker[1];
 
  roosterObjecten = new String[aantalVakkenVerticaal][aantalVakkenHorizontaal];

  // EindScherm
  xScoreEindScherm = width / 2;
  yScore1EindScherm = height * 3 /10;
  yScore2EindScherm = height * 4 /10;
  grootteLettersScoreEindscherm = width / 15;
}

void draw() {
  switch (gameState) {
    case STARTSCHERM:
      tekenStartScherm();
      break;
    case GAMESCHERM:
      if (checkOfSpelVoorbijIs()) {
        gameState = EINDSCHERM;
      }
      tekenGameScherm();
      break;
    case EINDSCHERM:
      tekenEindScherm();
      break;
  }
}

void keyPressed() {
  if (gameState == GAMESCHERM) {
      handelGameSchermInteractieAf();
  }
}

void mousePressed() {
  switch (gameState) {
    case STARTSCHERM:
      handelStartSchermInteractieAf();
      break;
    case EINDSCHERM:
      handelEindSchermInteractieAf();
      break;
  }
}

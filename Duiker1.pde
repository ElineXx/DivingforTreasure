boolean isDuiker1Levend = true;
boolean isDuiker1AanHetDalen = false;
boolean isDuiker1AanHetStijgen = false;

void setIsDuiker1Levend(boolean bool) {
  isDuiker1Levend = bool;
}

void setIsDuiker1AanHetDalen(boolean bool) {
  isDuiker1AanHetDalen = bool;
}

float[] beweegDuiker1Verticaal(float[] positie) {
  checkOfDuiker1AanHetDalenOfStijgenIs(positie);
 
  if (isDuiker1AanHetDalen) {
    positie[1] += grootteVak / 8;
  }
  if (isDuiker1AanHetStijgen) {
    positie[1] -= grootteVak / 8;
  }
  positie[1] = constrain(positie[1], yWater, height - grootteVak);
  
  return positie;
}

void checkOfDuiker1AanHetDalenOfStijgenIs(float[] positie){
  if (keyPressed && keyCode == DOWN && positie[1] <= yWater) {
    isDuiker1AanHetDalen = true;
    isDuiker1AanHetStijgen = false;
  } 
  if (keyPressed && keyCode == UP && positie[1] >= height - grootteVak) {
    isDuiker1AanHetStijgen = true;
    isDuiker1AanHetDalen = false;
  }
}

float[] beweegDuiker1Horizontaal(float[] positie){
  if (keyCode == LEFT) {
    positie[0] -= grootteVak;
  }
  if (keyCode == RIGHT) {
    positie[0] += grootteVak;
  }
  positie[0] = constrain(positie[0], 0, width - grootteVak);
  
  return positie;
}

void handelDuiker1ObjectInteractieAf(float[] positieDuiker){
  int x = int(positieDuiker[0] / grootteVak);
  int y = int((positieDuiker[1] - yWater) / grootteVak);
  
  if(roosterObjecten[y][x] != null) {
    activeerObjectinRooster(x, y, roosterObjecten[y][x], "Duiker1");
  }
}

void tekenDuiker(float[] positie , float grootte, int kleur) {
  fill(kleur);
  rect(positie[0], positie[1], grootte, grootte);
}

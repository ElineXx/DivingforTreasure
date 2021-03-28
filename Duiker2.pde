boolean isDuiker2Levend = true;
boolean isDuiker2AanHetDalen = false;
boolean isDuiker2AanHetStijgen = false;

void setIsDuiker2Levend(boolean bool) {
  isDuiker2Levend = bool;
}

void setIsDuiker2AanHetDalen(boolean bool) {
  isDuiker2AanHetDalen = bool;
}

float[] beweegDuiker2Verticaal(float[] positie) {
  checkOfDuiker2AanHetDalenOfStijgenIs(positie);
 
  if (isDuiker2AanHetDalen) {
    positie[1] += grootteVak / 8;
  }
  if (isDuiker2AanHetStijgen) {
    positie[1] -= grootteVak / 8;
  }
  positie[1] = constrain(positie[1], yWater, height - grootteVak);
  
  return positie;
}

void checkOfDuiker2AanHetDalenOfStijgenIs(float[] positie){
  if (keyPressed && (key == 's' || key == 'S') && positie[1] <= yWater) {
    isDuiker2AanHetDalen = true;
    isDuiker2AanHetStijgen = false;
  } 
  if (keyPressed && (key == 'w' || key == 'W') && positie[1] >= height - grootteVak) {
    isDuiker2AanHetStijgen = true;
    isDuiker2AanHetDalen = false;
  }
}

float[] beweegDuiker2Horizontaal(float[] positie){
  if (key == 'a' || key == 'A') {
    positie[0] -= grootteVak;
  }
  if (key == 'd' || key == 'D') {
    positie[0] += grootteVak;
  }
  positie[0] = constrain(positie[0], 0, width - grootteVak);
  
  return positie;
}

void handelDuiker2ObjectInteractieAf(float[] positieDuiker){
  int x = int(positieDuiker[0] / grootteVak);
  int y = int((positieDuiker[1] - yWater) / grootteVak);
  
  if(roosterObjecten[y][x] != null) {
    activeerObjectinRooster(x, y, roosterObjecten[y][x], "Duiker2");
  }
}

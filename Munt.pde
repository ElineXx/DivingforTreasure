void tekenMunt(float x, float y, float grootte, int kleur) {
  fill(kleur);
  ellipseMode(CORNER);
  ellipse(x, y, grootte, grootte);
}

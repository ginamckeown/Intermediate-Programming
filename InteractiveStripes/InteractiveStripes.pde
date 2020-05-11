// An array of stripes
Stripe[] stripes;

void setup() {
  size(480, 270);
  stripes = new Stripe[10];

  // Initialize all stripe objects
  for (int i = 0; i < stripes.length; i++) {
    stripes[i] = new Stripe();
  }
}

void draw() {
  background(100);

  // Move and display all stripes objects
  for (int i = 0; i < stripes.length; i++) {
    stripes[i].checkForMouseOver(mouseX);
    stripes[i].move();
    if (stripes[i].x > width + stripes[i].w) {
      stripes[i].x = -1 * stripes[i].w;
    }
    stripes[i].display();
  }
}

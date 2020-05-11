// Declare and initialize two integer variables at the top of the code.
int circleX;
int circleY;
boolean startstop;

void setup() {
  size(480, 270);
  circleX = 0;
  circleY = 0;
}

void draw() {
  circleY = 100;
  background(255);
  stroke(0);
  fill(175);
  ellipse(circleX, circleY, 50, 50);

  if (mousePressed) {
    startstop = !startstop;
  }

  if (startstop) {
    circleX = circleX + 1;
  }
}

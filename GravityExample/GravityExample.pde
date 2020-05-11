float x, y, d;
float gravity;
float dampening;
float yVelocity;
boolean clicked;


void setup() {
  size(600, 600);
  dampening = -0.95;
  yVelocity = 0;
  clicked = false;
  gravity = 1;
  x = width/2;
  y = 100;
  d = 69;
}

void draw() {
  background(0);
  fill(150);
  ellipse(x, y, d, d); // create an ellipse

  if (clicked) {
    yVelocity = yVelocity + gravity;
    y = y + yVelocity;
    if (y >= height - d/2) {
      yVelocity = yVelocity * dampening;
    }
  }

  y = constrain(y, 0 + d/2, height - d/2);
}

void mousePressed() {
  clicked = !clicked;
}

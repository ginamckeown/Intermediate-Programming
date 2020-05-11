float diameter;
float circleX;
float circleY;
float spacing;

void setup() {
  diameter = 400;
  spacing = 10;
  circleX = width/2;
  circleY = height/2;
  size(400, 400);
  background(255);
}

void draw() {
  while (diameter > 10) {
    fill(diameter);
    stroke(0);
    ellipse(circleX, circleY, diameter, diameter);
    diameter -= spacing;
  }
}

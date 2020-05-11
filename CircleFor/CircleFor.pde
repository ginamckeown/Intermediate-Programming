float circleX;
float circleY;

void setup() {
  circleX = width/2;
  circleY = height/2;
  size(400, 400);
  background(255);
}

void draw() {
  for (int i=400; i > 10; i-=10) {
    fill(i);
    stroke(0);
    ellipse(circleX, circleY, i, i);
  }
}

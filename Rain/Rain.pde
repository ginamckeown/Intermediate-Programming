Raindrop r1;

void setup() {
  size(400, 400);
  r1 = new Raindrop();
}

void draw() {
  background(0);
  r1.rain();
  r1.display();
}

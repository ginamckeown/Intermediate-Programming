void setup() {
  size(400, 400);
  background(255);
}

void draw() {
  fill(0);
  for (int i=10; i < height; i+=20) { 
    rect(100, i, 100, 10);
  }
}

void setup() {
  size(400, 400);
  background(255);
}

void draw() {
drawCar(100, 100, 64, color(255, 0, 0)); // x, y, size, color
drawCar(20, 20, 32, color(0, 255, 0)); // x, y, size, color
drawCar(200, 200, 128, color(0, 0, 255)); // x, y, size, color
}


void drawCar(int x, int y, int size, color c) {
  int offset = size/4;
  rectMode(CENTER);
  stroke(0);
  fill(c);
  rect(x, y, size, size/2); // car body
  fill(0);
  rect(x - offset, y - offset, offset, offset/2); //wheel
  rect(x + offset, y - offset, offset, offset/2); //wheel
  rect(x - offset, y + offset, offset, offset/2); //wheel
  rect(x + offset, y + offset, offset, offset/2); //wheel
  
}

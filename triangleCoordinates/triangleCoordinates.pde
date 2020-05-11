void setup() {
  size(600, 600);
  
}

void draw() {
  background(255);
  fill(0);
  ellipse(mouseX, mouseY, 10, 10);
  
}

void mousePressed() {
  int x = mouseX;
  int y = mouseY;
  ellipse(x, y, 0, 10);
}

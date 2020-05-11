boolean topLeft;
boolean topRight;
boolean bottomLeft;
boolean bottomRight;
float r;
float g;
float b;

void setup() {
  size(480, 270);
  topLeft = false;
  topRight = false;
  bottomLeft = false;
  bottomRight = false;
}

void draw() {
  r = random(256);
  b = random(256);
  g = random(256);
  frameRate(10);

  background(255);
  stroke(0);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
  // Fill a black color
  noStroke();
  fill(r, g, b);

  // Makes Rectagles
  if (topLeft) {
    rect(0, 0, width/2, height/2);
  }
  if (topRight) {
    rect(width/2, 0, width/2, height/2);
  }
  if (bottomLeft) {
    rect(0, height/2, width/2, height/2);
  }
  if (bottomRight) {
    rect(width/2, height/2, width/2, height/2);
  }
}

void mousePressed() {
  if (mouseX < width/2 && mouseY < height/2 ) {
    topLeft = !topLeft;
  } else if (mouseX > width/2 && mouseY < height/2 ) {
    topRight = !topRight;
  } else if (mouseX < width/2 && mouseY > height/2 ) {
    bottomLeft = !bottomLeft;
  } else if (mouseX > width/2 && mouseY > height/2 ) {
    bottomRight = !bottomRight;
  }
}

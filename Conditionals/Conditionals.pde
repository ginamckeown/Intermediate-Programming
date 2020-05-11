// Circle Colors
float r;
float g;
float b;

float r1;
float g1;
float b1;

float r2;
float g2;
float b2;

// Circle Sizes
int circleSize;
int circleSize1;
int circleSize2;

// Circle Location
int x;
int y;
int x1;
int y1;
int x2;
int y2;


void setup() {
  size(400, 400);

  // Initial Values
  r = 0;
  g = 0;
  b = 0;

  r1 = 0;
  g1 = 0;
  b1 = 0;

  r2 = 0;
  g2 = 0;
  b2 = 0;

  circleSize = 10;
  circleSize1 = 250;
  circleSize2 = 90;

  x = 0;
  y = 50;
  x1 = 400;
  y1 = 250;
  x2 = 200;
  y2 = 400;
}


void draw() {
  frameRate(25);
  background(255);

  r = random(256);
  g = random(256);
  b = random(256);

  r1 = random(256);
  g1 = random(256);
  b1 = random(256);

  r2 = random(256);
  g2 = random(256);
  b2 = random(256);



  // Cirles Move
  if (frameCount <= 70) {
    fill(r, g, b);
    ellipse(x, y, circleSize, circleSize);
    x = x + 1;
    y = y + 5;
  } else if (frameCount <= 150) {
    fill(r1, g1, b1);
    ellipse(x1, y1, circleSize1, circleSize1);
    x1 = x1 - 6;
    y1 = y1 + 2;
  } else {
    fill(r2, g2, b2);
    ellipse(x2, y2, circleSize2, circleSize2);
    y2 = y2 - 2;
  }

  // Cirles Get Larger
  if (frameCount <= 70) {
    circleSize = circleSize + 2;
  } else if (frameCount <= 150) {
    circleSize1 = circleSize1 - 4;
  } else {
    circleSize2 = circleSize2 + 5;
  }
}

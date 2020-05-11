// Variables
float red;
float green;
float blue;
float r;
float g;
float b;
float paint;
int black;
int white;
int pinkTongueG;
int pinkTongueB;


float x;
float y;

float circleWidth;
float circleWidth1;
float cirlceWidth2;

float triangleX;
float triangleY;
float triangleX1;
float triangleY1;
float triangleX2;
float triangleY2;

float rectangleWidth;
float rectangleHeight;

int arcWidth;
int arcHeight;

float speed;
int zero;



void setup() {
  size(500, 500);
}


void draw() {
  red = random(256);
  green = random(256);
  blue = random(256);
  r = random(256);
  g = random(256);
  b = random(256);
  paint = random(256);
  black = 0;
  white = 255;
  pinkTongueG = 192;
  pinkTongueB = 203;


  x = random(width);
  y = random(height);

  circleWidth = 30;
  circleWidth1 = 10;
  cirlceWidth2 = 70;

  triangleX = random(width);
  triangleY = random(height);
  triangleX1 = random(width);
  triangleY1 = random(height);
  triangleX2 = random(width);
  triangleY2 = random(height);

  rectangleWidth = 60;
  rectangleHeight = 40;
  
  arcWidth = 40;
  arcHeight = 25;
  
  speed = 25;
  zero = 0;

  background(zero);
  frameRate(speed);

  // Shape #1
  fill(red, green, blue);
  stroke(red, green, blue);
  ellipse(x, y, circleWidth, circleWidth);

  // Shape #2
  fill(r, g, b);
  stroke(r, g, b);
  triangle(triangleX, triangleY, triangleX1, triangleY1, triangleX2, triangleY2);

  // Shape #3
  fill(paint);
  stroke(paint);
  rect(x, y, rectangleWidth, rectangleHeight);

  // Move with mouse 
  fill(white, white, black);
  stroke(white);
  ellipse(mouseX, mouseY, cirlceWidth2, cirlceWidth2);
  fill(black);
  ellipse(mouseX+15, mouseY-10, circleWidth1, circleWidth1);
  ellipse(mouseX-15, mouseY-10, circleWidth1, circleWidth1);
  stroke(white);
  fill(white, pinkTongueG, pinkTongueB);
  arc(mouseX, mouseY+10, arcWidth, arcHeight, zero, PI);
}

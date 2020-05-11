// Circle 1
float diameter;
int fill;

// Circle 2 & 3
float up;
float side;

// Location
float y;
float x;

// Gravity
float yVelocity;
float gravity;
float dampening;

boolean button;

void setup() {
  size(600, 600);
  diameter = 60;
  up = 70;
  side = 15;
  fill = 175;
  yVelocity = -5;
  gravity = 0.1;
  dampening = -0.95;
  button = false;
  y = 0;
}

void draw() {
  // Rabbit
  background(255);
  frameRate(50);
  fill(fill);
  stroke(0);
  ellipse(x-15, y-20, side, up);
  ellipse(x+15, y-20, side, up);
  ellipse(x, y, diameter, diameter);
  fill(255, 179, 217);
  triangle(x-5, y+10, x+5, y+10, x, y);
  fill(0);
  arc(x-15, y-10, 15, 10, 0, PI);
  arc(x+15, y-10, 15, 10, 0, PI);

  //Rabbbit Bounces
  if (button) {  
    yVelocity += gravity;
    y += yVelocity;
    if (y >= height - diameter/2) {
      yVelocity *= dampening;
    } else if (y < 0) {
      yVelocity *= -1;
    }
  } else {
    y = mouseY;
  }
  
  x = mouseX;

  // Set Boundaries
  y = constrain(y, 0 + diameter/2 + 25, height - diameter/2);

  // Change Color
  if (y < 200) {
    fill = 120;
  } else if (y > 200 && y < 400) {
    fill = 175;
  } else {
    fill = 255;
  }

  println(yVelocity);
}

void mousePressed() {
  button = !button;
}

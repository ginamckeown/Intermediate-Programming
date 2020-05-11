color c;
float xpos;
float ypos;
float xspeed;

void setup() {
  size(400, 400);
  c = color(255);
  xpos = width/2;
  ypos = height/2;
  xspeed = 1;
}

void draw() {
  background(0);
  display();
  drive();
  if (xpos > width) {
    xpos = 0;
  }
}

void display() {
  rectMode(CENTER);
  fill(c);
  rect(xpos, ypos, 20, 10);
}

void drive() {
  xpos += xspeed;
}

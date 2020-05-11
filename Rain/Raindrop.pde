class Raindrop {
  float xpos, ypos;
  float diameter;
  float speed;
  color c;

  Raindrop() {
    diameter = -5;
    speed = 10;
    c = color(200);
    xpos = random(width);
    ypos = 0;
  }

  void display() {
    fill(c);
    ellipse(xpos, ypos, diameter, diameter);
  }

  void rain() {
    ypos += speed;
    if (ypos > height) {
      ypos = 0;
    }
  }
  
}

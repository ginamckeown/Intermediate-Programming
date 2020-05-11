class Raindrop {
  float xpos, ypos;
  float diameter;
  float speed;
  color c;

  Raindrop(float s, float x) {
    speed = s;
    diameter = -5;
    c = color(200);
    xpos = x;
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

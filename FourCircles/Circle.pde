class Circle {
  color circleColor;
  float diameter;
  float x, y;
  Circle(color c, float diam) {
    circleColor = c;
    diameter = diam;
    x = width/2;
    y = height/2;
  }
  void display() {
    fill(circleColor);
    ellipse(x, y, diameter, diameter);
  }
  void setX(float xp) {
    x = xp;
  }
  void setY(float yp) {
    y = yp;
  }
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }
}

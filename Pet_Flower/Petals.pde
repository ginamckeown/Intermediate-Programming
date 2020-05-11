class Petal {
  float x, y, w, h;
  Petal() {
    x = 0;
    y = 0;
    w = 60;
    h = 60;
  }

  void display() {
    fill(211, 175, 224);
    ellipse(x, y, w, h);
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  void setX(float t) {
    x = t;
  }

  void setY(float t) {
    y = t;
  }
}

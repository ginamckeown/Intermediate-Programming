class Platform {
  int version; // will stand for the different platform versions
  float x, y, w, h;
  float s; // speed

  Platform() {
    // platform versions are decided at random, each new platform will be a random type
    //version = int (random(1, 4));
    version = 2;
    x = width;
    y = int(random(100, 450));
    w = int(random(100, 250));
    h = int(random(10, 60));
    s = 0;
  }

  void display() {
    rectMode(CORNER);
    // platform with triangluar stands
    if (version == 1) {
      rect(x, y, w, h);
      for (float i = x/10; i < x; i += i) {
        stroke(20);
        line(x, y - h, x + i, 0);
        line(x + i, 0, y - h, x + i + i);
      }
    }

    // floating platform with obstacle
    if (version == 2) {
      fill(0);
      rect(x, y, w, h);
    }

    //
    if (version == 3) {
      rect(x, y, w, h);
    }
  }

  void move() {
    x = x - s;
  }
  
  void restart() {
    x = width + w;
    setSpeedTo(0);
  }
  
  void setSpeedTo(int speed) {
    s = speed;
  }
  
  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
  
  float getW() {
    return w;
  }
}

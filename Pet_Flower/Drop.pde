class Drop {
  float x; // declare xPos
  float y, originalY; // declare yPos
  float h; // declare h
  float w; // declare w
  float speed; // declare speed
  color c; // declare c

  Drop(float tempY) {
    y = tempY; // yPos is set to 0
    originalY = tempY;
    h = 10; // h is set to 10
    w = 5; // w is set to 5
    c = color(94, 140, 160); // c is a light blue
    speed = random(1, 7);
  }

  void display(float tempX, float cloudW) {   
    x = tempX + random(-cloudW/2, cloudW/2);
    noStroke();
    fill(c); // fill is c
    //yPos = tempY;
    ellipse(x, y, w, h); // ellipse appears at xPos, yPos and has a wdith of w and height of h
  }

  void move() {
    y = y + speed; // the yPos changes by speed
  }

  boolean checkForReachBottom(float h) {
    if (y > h) { // when yPos is larger than h, checkForReachBottom is true
      return true;
    } else { // Otherwise, return false
      return false;
    }
  }

  void restart() {
    y = originalY; // y-position is set so that the object cannot be see
  }
}

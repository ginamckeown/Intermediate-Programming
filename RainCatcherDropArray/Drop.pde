class Drop {
  float xPos; // declare xPos
  float yPos; // declare yPos
  float h; // declare h
  float w; // declare w
  float speed; // declare speed
  color c; // declare c

  Drop() {
    xPos = random(width); // xPos is anywhere between 0 and the width of the window
    yPos = 0; // yPos is set to 0
    h = 10; // h is set to 10
    w = 5; // w is set to 5
    c = color(89, 212, 240); // c is a light blue
    speed = random(1, 3); // speed is set to 4
  }

  void display() {
    noStroke();
    fill(c); // fill is c
    ellipse(xPos, yPos, w, h); // ellipse appears at xPos, yPos and has a wdith of w and height of h
  }

  void move() {
    yPos = yPos + speed; // the yPos changes by speed
  }

  boolean checkForReachBottom(float h) {
    if (yPos > h) { // when yPos is larger than h, checkForReachBottom is true
      return true;
    } else { // Otherwise, return false
      return false;
    }
  }

  void disappear() {
    xPos = - 1000; // x-position is set so that the object cannot be seen
    yPos = -1000; // y-position is set so that the object cannot be seen 
    speed = 0; // the raindrop stops moving
  }
}

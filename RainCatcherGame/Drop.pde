class Drop {
  float xPos; // declare xPos
  float yPos; // declare yPos
  float h; // declare h
  float w; // declare w
  float speed; // declare speed
  color c; // declare c
  PImage raindrop; // declare an image called raindrop

  Drop() {
    raindrop = loadImage("Raindrop.png"); // load the raindrop image
    xPos = random(width); // xPos is anywhere between 0 and the width of the window
    yPos = 0; // yPos is set to 0
    h = 15; // h is set to 10
    w = 10; // w is set to 5
    c = color(52, 134, 155); // c is a light blue
    speed = random(1, 3); // speed is set to random between 1 and 3
  }

  void display() {
    noStroke(); // there is no stroke
    fill(c); // fill is c
    image(raindrop, xPos, yPos, w, h); // the raindrop image appears based on x and y position
  }

  void move() {
    yPos = yPos + speed; // the yPos changes by speed so raindrops fall
  }

  boolean checkForReachBottom(float h) {
    if (yPos > h) { // when yPos is larger than h, checkForReachBottom is true
      return true;
    } else { // Otherwise the raindrop is not at the bottom and return false
      return false;
    }
  }

  void disappear() {
    xPos = - 1000; // x-position is set so that the object cannot be seen
    yPos = -1000; // y-position is set so that the object cannot be seen 
    speed = 0; // the raindrop stops moving
  }
}

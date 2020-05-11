/*
This class is called in the cloud class because rain has to com out of clouds
 
 display() creates the raindrops, the x-location of the raindrops has to be underneath its cloud
 
 move() makes the drops fall
 
 checkForReachBottom() checks whether the drop has reached the bottom
 
 restart() when drop reach the bottom they restart at the clouds y-location
 
 */


class Drop {
  float x; // x position
  float y, originalY; // y position
  float h; // height of drop
  float w; // width of drop
  float speed; // speed of drop
  color c; // color of drop

  Drop(float tempY) {
    y = tempY; // y is set to tempY
    originalY = tempY; // keep orginal y value for later
    h = 10; 
    w = 5; 
    c = color(94, 140, 160); // c is a light blue
    speed = random(1, 7); // drop speed is random
  }

  // Drops appear
  void display(float tempX, float cloudW) {   
    x = tempX + random(-cloudW/2, cloudW/2); // x of drops can be anything between the wdith of a cloud
    noStroke();
    fill(c); // fill is c
    ellipse(x, y, w, h); // ellipse appears at x, y and has a width of w and height of h
  }

  // Drops fall
  void move() {
    y = y + speed; // the y changes by speed
  }

  // Check whether or not the drops have reached the bottom
  boolean checkForReachBottom(float h) {
    if (y > h) { // when yPos is larger than h, checkForReachBottom is true
      return true;
    } else { // Otherwise, return false
      return false;
    }
  }

  void restart() {
    y = originalY; // y-position is set so that the drop returns to its original height
  }
}

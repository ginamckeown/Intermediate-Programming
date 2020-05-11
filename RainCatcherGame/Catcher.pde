class Catcher {
  float xPos; // x-Location
  float yPos; // y-Location
  float r; // radius

  Catcher(float radius) {
    r = radius; // set r to value passed to radius
  }

  void setLocation(float x, float y) { // function takes in the location x and y and uses them for xPos and yPos
    xPos = x; // set xPos to x
    yPos = y; // set yPos to y
  }


  void display() {
    noStroke(); // remove strokes
    fill(128, 103, 184); // changes the color of ellipse
    ellipse(xPos, yPos, r*2, r*2); // ellipse is drawn at xPos, yPos and has a diameter of r*2 and r*2
  }

  // Checking for ball caught
  boolean dropCaught(Drop drop) {
    float distance = dist(xPos, yPos, drop.xPos, drop.yPos); // calculate distance between drop and catcher

    // Compare distance to radius
    if (distance < r) { // when the drop and the catcher are touching (their distance is smaller than the radius of catcher) dropCaught is true
      return true;
    } else { // otherwise the objects are not touching and dropCaught is false
      return false;  
    }
  }
}

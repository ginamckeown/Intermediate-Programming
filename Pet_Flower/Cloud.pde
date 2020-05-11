class Cloud {
  Drop[] drops;
  float x, y, w, h, s;
  boolean raining;

  Cloud(float tempX, float tempY, float tempW, float tempH, float tempS) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    s = tempS;
    raining = false;

    drops = new Drop[4];
    for (int i = 0; i < drops.length; i++) {
      drops[i] = new Drop(y);
    }
  }

  void display(boolean tempRaining) {
    raining = tempRaining;
    if (raining) {
      for (int i = 0; i < drops.length; i++) { // loop to base code on drops[i] for the length of the array
        drops[i].move(); // move drops[i]
        drops[i].display(x, w);

        // You lose when a drop hits the bottom
        if (drops[i].checkForReachBottom(height)) { //when checkForReachBottom is true send the parameter height
          drops[i].restart(); // when drop is caught it disappears
        }
      }
    }
    fill(255, 150);
    ellipse(x, y, w, h);
  }

  void move() {
    x += s;
    if (x > width + w/2) {      
      x = 0 - w/2;
    }
  }

}

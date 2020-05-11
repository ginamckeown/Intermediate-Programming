/* 
 This class creates clouds that release rain. 
 
 display() displays the clouds and creates an array of drops if raining is true
 
 move() changes the clouds' location based on speed and if the cloud goes off screen it will restart
 
 */


class Cloud {
  Drop[] drops; // declare array of drops
  float x, y, w, h, s; // properties of clouds
  boolean raining; // is it raining?

  Cloud(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    s = 0.5; // speed of cloud movement
    raining = false;

    drops = new Drop[4];
    for (int i = 0; i < drops.length; i++) {
      drops[i] = new Drop(y);
    }
  }

  void display(boolean tempRaining) {
    raining = tempRaining; // use the perameter to check if its raining
    if (raining) { // if its raining then display the drops from the drop class
      for (int i = 0; i < drops.length; i++) { // loop to base code on drops[i] for the length of the array
        drops[i].move(); // move drops[i]
        drops[i].display(x, w); // pass the x location and width of the cloud

        if (drops[i].checkForReachBottom(height)) { // when checkForReachBottom is true send the parameter height
          drops[i].restart(); // when drop is at the bottom it restarts at the top
        }
      }
    }
    // Create cloud
    fill(255, 150);
    ellipse(x, y, w, h);
  }

  // Cloud moves based on speed, s
  void move() {
    x += s;
    if (x > width + w/2) {
      x = 0 - w/2; // reset x-location of cloud when it goes out of the window
    }
  }
}

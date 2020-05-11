/* 
 This class creates the petals of the flowers.
 
 display() create petals with color based on the value of the functions
 
 r(), g(), b() all set color to brown when health is bad and pink when it is good
 
 setX() sets the x value based on the parameter passed
 
 setY() sets the y value based on the parameter passed
 
 */


class Petal {
  float x, y, w, h; // set proerties of petals, location, size
  int r, g, b; // represents color of petals

  Petal() {
    // Petal Location
    x = 0;
    y = 0;

    // Petal Size
    w = 60;
    h = 60;

    // Petal Color
    r = 211;
    g = 175;
    b = 224;
  }

  void display() {
    fill(r(), g(), b()); // color based on the fuctions that determine color
    ellipse(x, y, w, h); // create petals based on variables
  }


  // color changes to brown when health is bad
  int r() {
    if (health.underHealth() && r > 140 ) {
      r -= 1;
    } else if (r < 210) {
      r += 1;
    }
    return r;
  }

  int g() {
    if (health.underHealth() && g > 95) {
      g -= 1;
    } else if (g < 175) {
      g += 1;
    }
    return g;
  }

  int b() {
    if (health.underHealth() && b > 61) {
      b -= 2;
    } else if (b < 244) {
      b += 2;
    }
    return b;
  }

  void setX(float t) {
    x = t;
  }

  void setY(float t) {
    y = t;
  }
}

class Stripe {
  float x;
  float speed;
  float w;

  // A boolean variable keeps track of the object's state
  boolean mouseOver; // state of stripe (mouse is over or not)

  Stripe() {
    // All stripes start on the left
    x = 0;
    // All stripes have a random
    speed = random(1);
    // All stripes have a ranom width
    w = random(10, 30);
    mouseOver = false;
  }

  void checkForMouseOver(float mx) {
    if (mx > x && mx < x + w) {
      mouseOver = true;
    } else {
      mouseOver = false;
    }
  }

  void move() {
    x += speed;
  }

  void display() {
    // Boolean variable determines Stripe color
    if (mouseOver) {
      fill(255);
    } else {
      fill(255, 100);
    }

    noStroke();
    rect(x, 0, w, height);
  }
}

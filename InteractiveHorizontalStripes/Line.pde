class Line {
  float y;
  float speed;
  float h;
  color lineColor;

  // A boolean variable keeps track of the object's state
  boolean mouseOver; // state of line (mouse is over or not)

  Line() {
    // All lines start on the top
    y = 0;

    // All lines have a random speed
    speed = random(2);

    // All lines have a random height
    h = random(10, 30);
    mouseOver = false;

    // Color of line
    lineColor = color(17, 143, 166);
  }

  void checkForMouseOver(float my) {
    if (my > y && my < y + h) {
      mouseOver = true;
    } else {
      mouseOver = false;
    }
  }

  void move() {
    y += speed;
  }

  void display() {
    // Print instructions
    println("Click on lines to change their color");

    // Boolean variable determines Stripe color
    if (mouseOver) {
      fill(lineColor);
    } else {
      fill(lineColor, 90);
    }

    // When lines are clicked they change color
    if (mouseOver && mousePressed) {
      lineColor = color(143, 189, 28);
    }

    noStroke();
    rect(0, y, width, h);
  }
}

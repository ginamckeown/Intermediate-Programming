class Ball {

  float radius;  //sets the size
  float x, y;    // used to locate the ball
  float xSpeed, ySpeed;  //used to move the ball
  color c = color(100, 50);  //each ball is grey and translucent

  // Constructor
  Ball(float tempR) {
    radius = tempR;  //the size is set by the value passed to tempR
    x = random(width);  //pick a random position to start
    y = random(height);
    xSpeed = random( -5, 5);  //pick a random speed
    ySpeed = random( -5, 5);
  }

  void move() {
    x += xSpeed; // Increment x (by xSpeed)
    y += ySpeed; // Increment y (by ySpeed)

    // Check horizontal edges
    if (x > width || x < 0) {  //if on left or right edge of the window
      xSpeed *= - 1;   //turn around
    }

    // Check vertical edges
    if (y > height || y < 0) { //if on top or bottom edge of the window
      ySpeed *= - 1;  //turn around
    }
  }

  // when this function is called the color is darkened.
  void highlight() { 
    c = color(0, 150);
  }

  // Draw the ball
  void display() {
    stroke(0);
    fill(c);
    ellipse(x, y, radius*2, radius*2);
    // After the ball is displayed, the color is reset back to the original color
    //(in case it changed).
    c = color(100, 50);
  }

  // A function that returns true or false based on whether two circles intersect
  // If distance is less than the sum of radii the circles touch
  boolean intersect(Ball anotherBall) { // Objects can be passed to as arguments to methods too! 

    float distance = dist(x, y, anotherBall.x, anotherBall.y); // Calculate distance

    // Compare distance to sum of radii
    if (distance < radius + anotherBall.radius) {
      return true;  //intersecting!
    } else {
      return false;  //not intersecting
    }
  }
}

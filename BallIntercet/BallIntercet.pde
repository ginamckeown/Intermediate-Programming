// Two ball objects
Ball ball1;
Ball ball2;

void setup() {
  size(480, 270);

  // Initialize balls
  ball1 = new Ball(64);
  ball2 = new Ball(32);
}

void draw() {
  background(255);
  // Move each ball
  ball1.move();
  ball2.move();

  // New! An object can have a function that 
  // takes another object as an argument. This 
  // is one way to have objects communicate. 
  // In this case they are checking intersection.  
  if (ball1.intersect(ball2)) { 
    ball1.highlight();  //if the balls are intersecting, call the highlight() function
    ball2.highlight();
  }
  //show each ball
  ball1.display();
  ball2.display();
}


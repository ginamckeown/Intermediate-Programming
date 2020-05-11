class Car {
  color c;
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;  //added for turnLeft() function


  Car(color thisColor) {  //constructor with parameter
    c = thisColor;
    xPos = width/2;
    yPos = height/2;
    xSpeed = 1;
    ySpeed = 0;  //added for turnLeft() function
  }

  void display() {
    rectMode(CENTER);
    fill(c);
    rect(xPos, yPos, 20, 10);
  }

  void drive() {
    xPos += xSpeed;
    yPos += ySpeed;  //added
  }

  void turnLeft() {
    if (car1.xSpeed == 1) {
      car1.xSpeed = 0;
      car1.ySpeed = -1;
    } else if (car1.ySpeed == 1) {
      car1.xSpeed = 1;
      car1.ySpeed = 0;
    } else if (car1.xSpeed == -1) {
      car1.xSpeed = 0;
      car1.ySpeed = 1;
    } else if (car1.ySpeed == -1) {
      car1.xSpeed = -1;
      car1.ySpeed = 0;
    }
    /*
    Your job is to complete this function.  Make the car turn left from its own
     perspective.  So if it is moving to the right on the screen, it should turn "up." 
     If it is moving up on the screen, it should turn left.  If it is moving to the left
     on the screen, it should turn "down."  If it is moving down on the screen, it 
     should turn to the right. 
     
     As a hint, you will use an if statement to figure out which speed is 
     currently not zero (in other words, which direction is it currently moving?),
     then change the values appropriately.  
     
     Another hint:  The only values you need to use for xSpeed and for ySpeed are 0, 1, and -1.
     */
  }
}

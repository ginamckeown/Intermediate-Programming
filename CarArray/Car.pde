class Car {
  color c;
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  float carW;
  float carH;
  float wheelD;
  float carBottomW;
  float carBottomH;

  Car(float y, float s) {
    c = color(random(255), random(255), random(255));
    xPos = width/2;
    yPos = y;
    xSpeed = s;
    ySpeed = s;
    carW = 40;
    carH = 20;
    carBottomW = 70;
    carBottomH = 20;
    wheelD = 15;
  }

  void display() {
    noStroke();
    rectMode(CENTER);
    fill(c);
    ellipse(xPos, yPos + carH/2, carBottomW, carBottomH);
    rect(xPos, yPos, carW, carH);
    fill(0);
    ellipse(xPos - carW/2, yPos + carH, wheelD, wheelD);
    ellipse(xPos + carW/2, yPos + carH, wheelD, wheelD);
  }

  void drive() {
    xPos += xSpeed;
    yPos += ySpeed;
    if (xPos > width - carBottomW/2 || xPos < 0 + carBottomW/2) {
      xSpeed *= -1;
    } else if (yPos > height - carH/2 - carBottomH/2 - wheelD/2 
      || yPos < 0 + carH/2) {
      ySpeed *= -1;
    }
  }
}

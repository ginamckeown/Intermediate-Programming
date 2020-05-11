Catcher myCatcher; // declare an object
Drop myDrop; // declare drop object

void setup() {
  size(480, 270);
  myCatcher = new Catcher(32); // make Catcher with radius
  myDrop = new Drop(); // make adrop
}

void draw() {
  background(255); // white background
  myCatcher.setLocation(mouseX, mouseY); // follows mouse
  myCatcher.display(); // display catcher
  myDrop.display();
  myDrop.move();

  if (myDrop.checkForReachBottom(height)) {
    text("You Lose!", width/2, height/2);
  }
}

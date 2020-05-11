Catcher myCatcher; // declare an object
Drop myDrop; // declare drop object

void setup() {
  size(480, 400);
  myCatcher = new Catcher(32); // make Catcher with radius
  myDrop = new Drop(); // make a drop
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

  // If drop is caught than disappear
  if (myCatcher.dropCaught(myDrop)) { 
    myDrop.disappear();
  }
}

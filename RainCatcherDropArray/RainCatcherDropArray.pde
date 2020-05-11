Catcher myCatcher; // declare an object
Drop[] drops; 

void setup() {
  size(480, 400);
  myCatcher = new Catcher(32); // make Catcher with radius
  // myDrop = new Drop(); // make a drop
  drops = new Drop[10];
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Drop();
  }
}

void draw() {
  background(255); // white background
  for (int i = 0; i < drops.length; i++) {
    drops[i].display(); 
    drops[i].move();
    if (drops[i].checkForReachBottom(height)) {
      text("You Lose!", width/2, height/2);
    }

    // If drop is caught than disappear
    if (myCatcher.dropCaught(drops[i])) { 
      drops[i].disappear();
    }
  }

  myCatcher.setLocation(mouseX, mouseY); // follows mouse
  myCatcher.display(); // display catcher
}

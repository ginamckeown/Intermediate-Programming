Catcher myCatcher; // declare an object
Drop[] drops; 
Timer myTimer;

void setup() {
  size(500, 500);
  myTimer = new Timer(5000);
  myCatcher = new Catcher(32); // make Catcher with radius
  // myDrop = new Drop(); // make a drop
  drops = new Drop[20];
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Drop();
  }
}

void draw() {
  background(208, 231, 237); // background
  for (int i = 0; i < drops.length; i++) {
    drops[i].display(); 
    drops[i].move();
    if (drops[i].checkForReachBottom(height)) {
      fill(188, 54, 47);
      textSize(20);
      text("You Lose!", width/2 - 50, height/2);
    }

    // If drop is caught than disappear
    if (myCatcher.dropCaught(drops[i])) { 
      drops[i].disappear();
    }
  }

  if (myTimer.isFinished()) {
    fill(188, 54, 47);
    textSize(20);
    text("You Ran Out of Time", width/2 - 100, height/5);
  }

  myCatcher.setLocation(mouseX, mouseY); // follows mouse
  myCatcher.display(); // display catcher
}

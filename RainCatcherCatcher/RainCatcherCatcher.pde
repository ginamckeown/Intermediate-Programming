Catcher myCatcher; // declare an object

void setup() {
  size(480, 270);
  myCatcher = new Catcher(32); // make Catcher with radius
}

void draw() {
  background(255); // white background
  myCatcher.setLocation(mouseX, mouseY); // follows mouse
  myCatcher.display(); // display catcher
}

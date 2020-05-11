// Interactive Zoog
void setup() {
  // Set the size of the window
  size(480, 270); 
  // The frame rate is set to 30 frames per second.
  frameRate(30);
}

void draw() {
  // Draw a white background
  background(255);
  // Call the drawZoog function with different arguments
  drawZoog(0, 0);
  drawZoog(75, 75);
  drawZoog(-75, -100);
}

void drawZoog(float xOffset, float yOffset) {
  // Use the parameter xOffset and yOffset to determine this zoog's position
  // Set ellipses and rects to CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER);
  // Draw Zoog's body
  stroke(0);
  fill(175);
  rect(mouseX + xOffset, mouseY + yOffset, 20, 100); //adjust x by xOffset and y by yOffset
  // Draw Zoog's head
  stroke(0);
  fill(255);
  ellipse(mouseX + xOffset, mouseY-30 + yOffset, 60, 60); //adjust x by xOffset and y by yOffset
  // Draw Zoog's eyes
  // The eye color is determined by the mouse location.
  fill(mouseX/2 + xOffset, 0, mouseY/2); 
  ellipse(mouseX-19 + xOffset, mouseY-30 + yOffset, 16, 32); //adjust x by xOffset and y by yOffset
  ellipse(mouseX+19 + xOffset, mouseY-30 + yOffset, 16, 32); //adjust x by xOffset and y by yOffset
  // Draw Zoog's legs
  stroke(0);
  // The legs are drawn according to the mouse location and the previous mouse location.
  line(mouseX-10 + xOffset, mouseY+50 + yOffset, pmouseX-10 + xOffset, pmouseY+60 + yOffset); //adjust x by xOffset and y by yOffset
  line(mouseX+10 + xOffset, mouseY+50 + yOffset, pmouseX+10 + xOffset, pmouseY+60 + yOffset); //adjust x by xOffset and y by yOffset
}
void mousePressed() {
  println("Take me to your leader!");
}

float circleX = 40;
float circleY = 100;
float diameter = 50;
float xVelocity = 10;
float yVelocity = 10;
float gravity = 0.1;
float dampening = -0.95;

void setup() {
  size(480, 270);
  yVelocity = 10;//random(5, 10);
}

void draw() {
  background(255);
  stroke(0);
  fill(175);
  /*Use the variables to specify the 
   location of an ellipse.
   */
  ellipse(circleX, circleY, diameter, diameter);

  //Check for edges
  if (circleX + diameter/2 > width || circleX - diameter/2 < 0) {
    xVelocity *= -1; //or xVelocity = xVelocity * -1;
  }

  if (circleY + diameter/2 >= height) {
    //yVelocity *= -1;  //only one of these lines should be used
    yVelocity *= dampening;
  }

  if (circleY - diameter/2 < 0) {
    yVelocity *= -1;
  }

  circleY = constrain(circleY, 0, height - diameter/2);
  
  yVelocity += gravity;
  
  println(yVelocity);
  circleX = circleX + xVelocity;
  circleY += yVelocity;
}

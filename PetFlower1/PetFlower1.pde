/*
The below code makes a plant simulator, you take care of the plant by watering it 
 and giving it sun. If the health gets too high or too low the plant will die.
 
 Rules:
 - do not over water or give your plant too much sun
 - game is over when the health has gotten too low
 */

// Arrays and Classes
Petal[] petals;
Cloud[] clouds;
Flower flower;
Health health;

// Flower
float radius; // radius of flower center
float angle; // angle between petals

// Buttons
float rainX, rainY; // rainbutton location
boolean rainButton; // rain button pressed?
float sunX, sunY; // sunbutton location
boolean sunButton; // sunbutton pressed?
float buttonW, buttonH; // size of button

// Colors
color background;
color hill1;
color hill2;
color hill3;


void setup () {
  size(600, 600);

  // Colors
  background = color(155, 224, 247);
  hill1 = color(54, 127, 25);
  hill2 = color(82, 173, 46);
  hill3 = color(136, 206, 111);

  // Buttons
  rainX = width/4;
  rainY = height/6*5;
  buttonW = 60;
  buttonH = 60;
  rainButton = false;
  sunX = width/10;
  sunY = height/6*5;
  sunButton = false;

  // Declare Classes
  petals = new Petal[5];
  flower = new Flower(width, height);
  clouds = new Cloud[8];
  health = new Health();

  // Create petals
  for (int i = 0; i < petals.length; i++) {
    petals[i] = new Petal();
    //colors of petal
    petals[i].r();
    petals[i].g();
    petals[i].b();
  }

  // Create clouds and pass values for their location and size
  clouds[0] = new Cloud(70, 100, 70, 70);
  clouds[1] = new Cloud(120, 80, 100, 100);
  clouds[2] = new Cloud(160, 90, 60, 60);
  clouds[3] = new Cloud(280, 180, 80, 80);
  clouds[4] = new Cloud(330, 160, 100, 100);
  clouds[5] = new Cloud(390, 180, 80, 80);
  clouds[6] = new Cloud(510, 110, 90, 90);
  clouds[7] = new Cloud(550, 120, 70, 70);

  // Center of petals
  angle = 0;  // initial angle for setting petals
  radius = 50;  // radius that the petals will be "around"
}

void draw() {
  background(background);

  // Hills in background
  noStroke();
  fill(hill1);
  ellipse(350, 600, 500, 400);

  // Create stem between the hills
  flower.displayStem();

  // More Hills
  fill(hill2);
  ellipse(100, 700, 800, 600);
  fill(hill3);
  ellipse(500, 800, 800, 600);

  // Create Petals around the center of the flower
  float x = 0;  // initial x (on the radius if y is zero)
  float y = 0;  // inital y (on the radius if x = radius)

  for (int i = 0; i < petals.length; i++) {
    // next line calculates x that will be on the radius at a given angle
    x = width/2 + cos(radians(angle))*(radius);  
    // next line calculates y that will be on the radius at a given angle
    y = height/2 + sin(radians(angle))*(radius);
    // now use x and y to set the x and y for the next petal
    petals[i].setX(x);
    petals[i].setY(y);
    // display the petal
    petals[i].display(); 
    // update the angle for the next petal 
    angle += 360/petals.length;
  }

  // Draw the center of the flower (slightly smaller than the petal radius)
  fill(236, 242, 152);
  ellipse(width/2, height/2, radius*1.2, radius*1.2);

  // Create Clouds
  for (int i = 0; i < clouds.length; i++) {
    clouds[i].display(rainButton);
    clouds[i].move();
  } 

  // Health
  health.display(sunButton, rainButton);
  health.checkForGameOver();
  health.badHealth();
  health.ifOverWater();
  health.ifOverSun();

  // Rain Button
  fill(0, 75);
  rect(rainX-4, rainY+4, buttonW, buttonH, 10);
  fill(150, 188, 204);
  rect(rainX, rainY, buttonW, buttonH, 10);
  // clouds on rainbutton
  fill(255, 150);
  ellipse(rainX + 15, rainY + 25, 15, 15);
  ellipse(rainX + 30, rainY + 20, 30, 30);
  ellipse(rainX + 45, rainY + 20, 20, 20);
  // rain
  fill(72, 112, 130);
  ellipse(rainX + 20, rainY + 45, 5, 7);
  ellipse(rainX + 30, rainY + 55, 5, 7);
  ellipse(rainX + 40, rainY + 45, 5, 7);

  // Sun Button
  fill(0, 75);
  rect(sunX - 4, sunY + 4, buttonW, buttonH, 10);
  fill(150, 188, 204);
  rect(sunX, sunY, buttonW, buttonH, 10);
  // sun on sunbutton
  fill(239, 236, 143, 150);
  ellipse(sunX + 30, sunY + 30, 30, 30);

  // Sun rays are drawn when the sunbutton is true
  if (sunButton) { 
    fill(255, 230, 70, 120);
    triangle(570, 200, 600, 80, 560, 100);   
    fill(255, 127, 0, 110);
    triangle(520, 220, 570, 90, 510, 80);
    fill(255, 210, 40, 120);
    triangle(480, 190, 540, 100, 490, 60);
    fill(244, 125, 66, 140);
    triangle(440, 150, 510, 60, 460, 50);
    fill(255, 247, 35, 120);
    triangle(400, 100, 510, 50, 460, 0);
    fill(247, 150, 51, 110);
    triangle(380, 50, 470, 50, 450, 0);
  }

  // Draw sun
  fill(247, 249, 97);
  ellipse(550, 0, 200, 200);
}

void mousePressed() {
  // If the rain button is pressed then it is the oppsite of what it was before (toggle)
  if (mouseX > rainX && mouseX < mouseX + buttonW && mouseY > rainY && mouseY < rainY + buttonH) {
    rainButton = !rainButton;
    sunButton = false; // sun and rain cannot be pressed at the same time
  } else if (mouseX > sunX && mouseX < mouseX + buttonW && mouseY > sunY && mouseY < sunY + buttonH) {
    sunButton = !sunButton;   
    rainButton = false;
  }
}

void keyPressed() { // Button toggles if certain keys are pressed
  if (key == 'r'|| key == 'R') {
    rainButton = !rainButton;
  }
  if (key == 's'|| key == 'S') {
    sunButton = !sunButton;
  }
}

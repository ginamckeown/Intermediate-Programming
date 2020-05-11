// Global Variables
// Start 
int startX = 300;
int startY = 400;
int startW = 250;
int startH = 60;
int startR = 35;
int startG = 174;
int startB = 169;
boolean start = false; // Boolean Variable

// Time
int s = 0; 

// Game Obstables
int fill = 0;
int platformSpeed = 5;

int platformY = 400;
int platformX = 0;
int platformW = 600;
int platformH = 150;

int platformY2 = 400;
int platformX2 = 850;
int platformW2 = 600;
int platformH2 = 150;

boolean platformMoving = false;

// Spike
int spikeY2 = 120;


// Player
int r = 49;
int g = 163;
int b = 156;
int playerSpeed = 5;
int playerD = 80;
int playerX = 0 + playerD/2;
int playerY = platformY - playerD/2;
int playerV = 0;

void setup() {
  size(600, 600);
}

void draw() {
  background(159, 201, 199);
  if (!start) {
    //Game Name
    textSize(90);
    fill(37, 97, 97);
    text("Jump It", width/4, height/3);

    // Start Button
    strokeWeight(4);
    stroke(0);
    fill(startR, startG, startB);
    rectMode(CENTER);
    rect(startX, startY, startW, startH, 10);
    fill(255);
    textSize(40);
    text("START", startX - startW/4, startY + startH/4);
    fill(0);

    // SPACE
    stroke(0);
    strokeWeight(1);
    fill(150);
    rect(300, 310, 75, 30, 10);
    fill(0);
    textSize(23);
    text("Press SPACE to Jump", width/3, height/2 + 20);

    text("click to start", startX - startW/4, startY + startH);

    // Game Begins When Start Button is True
  } else { // If Statement
    background(124, 100, 214);

    // Display Time
    text(s/60, width/8*7, height/8);
    s++;

    // Player
    fill(r, g, b);
    noStroke();
    strokeWeight(1);
    ellipse(playerX, playerY, playerD, playerD);
    playerX = playerX + playerSpeed;
    playerY = constrain(playerY, 0 + playerD/2, height - playerD/2);

    // Platforms
    rectMode(CORNER);
    fill(fill);
    rect(platformX, platformY, platformW, platformH);
    rect(platformX2, platformY2, platformW2, platformH2);


    // Platform Moves When PLayer Gets to Center
    if (playerX > width/3) { // If Statement
      playerSpeed = 0;
      platformMoving = true;
    }
    if (platformMoving) {
      platformX = platformX - platformSpeed;
      platformX2 = platformX2 - platformSpeed;
    }

    // Random Platform Appears When Other Platform Leaves
    if (platformX == -200) {
      // PLatform Size and Height is Random
      platformW2 = int(random(450, 600));
      platformH2 = int(random(20, 150));
      platformY2 = int(random(150, 200));
      platformY2 = platformY2*2;

      platformX2 = width;
    }
    if (platformX2 == -200) {  
      // Platform Size and Height is Random
      platformW = int(random(450, 600));
      platformH = int(random(150, 240));
      platformY = int(random(150, 270));
      platformY = platformY*2;

      platformX = width;
    }

    // Velocity of Player Changes When Off Platform
    playerY = playerY + playerV;
    if (playerY == platformY - playerD/2 && playerX > platformX 
      && playerX < platformX + platformW) {
      playerV = 0;
    } else if (playerY == platformY2 - playerD/2 && playerX > platformX2 
      && playerX < platformX2 + platformW2) {
      playerV = 0;
    } else {
      playerV = 2;
    }

    // Check for Left Side of Platform, Player is Pushed off Screen
    if (playerX >= platformX - playerD/2 && playerX <= platformX + platformW + playerD/2 
      && playerY <= platformY + platformH && playerY >= platformY) { // Booleans Operators
      playerX = platformX - playerD/2;
    }
    if (playerX >= platformX2 - playerD/2 && playerX <= platformX2 + platformW2 + playerD/2 
      && playerY <= platformY2 + platformH2 && playerY >= platformY2) {
      playerX = platformX2 - playerD/2;
    }

    // Player Falls When it Hits Bottom of Platform
    if (playerY <= platformY + platformH + playerD/2 && playerY > platformY 
      && playerX >= platformX && playerX <= platformX + platformW) {
      noLoop();
    }
    if (playerY <= platformY2 + platformH2 + playerD/2 && playerY > platformY2 
      && playerX >= platformX2 && playerX <= platformX2 + platformW2) {
      noLoop();
    }
    checkForGameOver();
  }
}

void checkForGameOver() {
  // Game is Over When Player Hits the Ground, Left Wall
  if (playerY >= height - playerD/2 || playerX < 0 + playerD/2 
    || playerY - playerD/2 < spikeY2) {
    gameOver();
    noLoop();
  }

  // Game is Over When Bottom of Platform is Hit
  if (playerY <= platformY + platformH + playerD/2 && playerY > platformY 
    && playerX >= platformX && playerX <= platformX + platformW 
    || playerY <= platformY2 + platformH2 + playerD/2 && playerY > platformY2 
    && playerX >= platformX2 && playerX <= platformX2 + platformW2) {
    gameOver();
  }

  // Player Changes Color Based on Mouse Location
  if (mouseY < height/2 && mouseX < width/2) {
    r = 49;
    g = 163;
    b = 156;
  } else if (mouseY < height/2 && mouseX > width/2) {
    r = 92;
    g = 189;
    b = 120;
  } else if (mouseY > height/2 && mouseX < width/2) {
    r = 180;
    g = 124;
    b = 204;
  } else {
    r = 217;
    g = 144;
    b = 20;
  }
}

void gameOver() {
  fill(255, 30, 30);
  textSize(60);
  text("GAME OVER", width/4, height/4);
  //PImage image; // Extra Function
  //image = loadImage("pic.jpg");
  //image(image, width/5*2, height/3, image.width/4, image.height/4);
}

void mousePressed() {
  // If START Button is Pressed Game Starts
  if (mouseX >= startX - startW/2 && mouseX <= startX + startW/2 
    && mouseY >= startY - startH/2 && mouseY <= startY + startH/2) {
    start = true;
  }
}

void keyPressed() {
  if (key == ' ') {
    playerY = playerY - 100;
    start = true;
  }
}

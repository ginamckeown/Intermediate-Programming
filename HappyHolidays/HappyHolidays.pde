// Gift
float x = 60;
float y = 200; 
float w = 190;
float h = 200; 
int change = 280;

// Functions
boolean giftClicked = false;
boolean gift2Clicked = false;

//Cloud
float cloudX = 70;
float cloudX1 = 120;
float cloudX2 = 160;
float cloudX3 = 280;
float cloudX4 = 330;
float cloudX5 = 390;
float cloudX6 = 510;
float cloudX7 = 550;
float cloudSpeed = .5;
float dia = 70;
float dia1 = 100;
float dia2 = 60;
float dia3 = 80;
float dia4 = 100;
float dia5 = 80;
float dia6 = 90;
float dia7 = 70;

// Sky & Lights
color sky = color(119, 212, 190);
color lights = color(28, 102, 46);
float lightW = 15;
float lightH = 25;
float r;
float g;
float b;
float r1;
float g1;
float b1;
float r2;
float g2;
float b2;

// Snow
float snowY = 0;
float snowY1 = 100;
float snowY2 = 30;
float snowY3 = -400;
float snowY4 = 60;
float snowY5 = -170;
float snowY6 = 50;
float snowY7 = -150;
float snowY8 = -120;
float snowY9 = -20;
float snowY10 = -100;
float snowY11 = -300;
float snowY12 = -200;
float snowSpeed = 2;
float snowSpeed1 = 3;
float snowSpeed2 = 4;

// Return Button
float rectW = 50;
float rectH = 50;
float rectX = 25;
float rectY = 525;

void setup() {
  size(600, 600);
  background(8, 36, 84);
}

void draw() {
  displayText("Click on a Gift to Reveal a Surprise");
  displayGift(x, color(25, 168, 116), color(184, 53, 2));
  displayGift(x + change, color(184, 53, 2), color(25, 168, 116));
  GiftClicked();
}

void displayText(String info) {
  fill(255);
  textSize(30);
  text(info, width/10, height/6*5);
}

void displayGift(float newX, color fill, color ribbon ) {
  noStroke();
  fill(fill);
  rectMode(CORNER);
  rect(newX, y, w, h);
  fill(ribbon);
  rectMode(CENTER);
  rect(newX+w/2, y+h/2, w/6, h);
  rect(newX+w/2, y+h/2, w, h/5);
}

// When the Gifts are Clicked Clips are Shown
void GiftClicked() {
  rectMode(CORNER);
  boolean backPressed = false;
  // Gift1 Clip
  if (checkForGiftClicked()) {
    // Sky
    background(sky);
    frameRate(15);

    // Festive Lights
    fill(lights);
    ellipse(500, 0, 900, 1000);
    fill(sky);
    ellipse(500, -10, 890, 990);

    fill(lights);
    ellipse(0, 100, 1800, 600);
    fill(sky);
    ellipse(0, 90, 1790, 595);

    fill(lights);
    ellipse(0, 0, 800, 600);
    fill(sky);
    ellipse(0, -10, 780, 590);

    fill(lights);
    ellipse(600, 0, 1800, 300);
    fill(sky);
    ellipse(600, -10, 1790, 295);

    r = random(0, 256);
    g = random(0, 256);
    b = random(0, 256);
    r1 = random(0, 256);
    g1 = random(0, 256);
    b1 = random(0, 256);
    r2 = random(0, 256);
    g2 = random(0, 256);
    b2 = random(0, 256);

    fill(r, g, b);
    ellipse(10, 310, lightW, lightH);
    ellipse(310, 200, lightW, lightH);
    ellipse(230, 145, lightW, lightH);
    ellipse(50, 410, lightW, lightH);
    ellipse(350, 385, lightW, lightH);
    ellipse(310, 460, lightW, lightH);

    fill(r1, g1, b1);
    ellipse(110, 295, lightW, lightH);
    ellipse(30, 125, lightW, lightH);
    ellipse(435, 155, lightW, lightH);
    ellipse(150, 405, lightW, lightH);
    ellipse(450, 370, lightW, lightH);
    ellipse(410, 500, lightW, lightH);

    fill(r2, g2, b2);
    ellipse(210, 265, lightW, lightH);
    ellipse(130, 135, lightW, lightH);
    ellipse(535, 160, lightW, lightH);
    ellipse(250, 400, lightW, lightH);
    ellipse(550, 350, lightW, lightH);
    ellipse(510, 510, lightW, lightH);

    // Clouds
    fill(182, 217, 209, 200);
    noStroke();
    ellipse(cloudX, 100, dia, dia);
    ellipse(cloudX1, 80, dia1, dia1);
    ellipse(cloudX2, 90, dia2, dia2);
    ellipse(cloudX3, 180, dia3, dia3);
    ellipse(cloudX4, 160, dia4, dia4);
    ellipse(cloudX5, 180, dia5, dia5);
    ellipse(cloudX6, 110, dia6, dia6);
    ellipse(cloudX7, 120, dia7, dia7);

    // Clouds Move
    cloudX += cloudSpeed;
    cloudX1 += cloudSpeed;
    cloudX2 += cloudSpeed;
    cloudX3 += cloudSpeed;
    cloudX4 += cloudSpeed;
    cloudX5 += cloudSpeed;
    cloudX6 += cloudSpeed;
    cloudX7 += cloudSpeed;

    // Clouds Reappear
    if (cloudX > width + dia/2) {
      cloudX = 0 - dia/2;
    }
    if (cloudX1 > width + dia1/2) {
      cloudX1 = 0 - dia1/2;
    }
    if (cloudX2 > width + dia2/2) {
      cloudX2 = 0 - dia2/2;
    }
    if (cloudX3 > width + dia3/2) {
      cloudX3 = 0 - dia3/2;
    }
    if (cloudX4 > width + dia4/2) {
      cloudX4 = 0 - dia4/2;
    }
    if (cloudX5 > width + dia5/2) {
      cloudX5 = 0 - dia5/2;
    }
    if (cloudX6 > width + dia6/2) {
      cloudX6 = 0 - dia6/2;
    }
    if (cloudX7 > width + dia7/2) {
      cloudX7 = 0 - dia7/2;
    }
    // Return to HomeScreen
    fill(181, 67, 14);
    rect(rectX, rectY, rectW, rectH);
    fill(255);
    textSize(50);
    text("<", 30, 560);
    textSize(10);
    text("BACK", 35, 570);
    if (mouseX >= rectX && mouseX <= rectX + rectW && mouseY >= rectY
      && mouseY <= rectY + rectH && mousePressed) {
      backPressed = true;
    }
    if (backPressed) {
      background(8, 36, 84);
      giftClicked = false;
    }
  }

  // Gift 2 Clip
  if (checkForGift2Clicked()) {
    // Sky
    background(28, 67, 99);

    // Tree
    fill(84, 55, 41);
    rect(400, 260, 20, 50);
    fill(22, 79, 52);
    triangle(370, 270, 410, 230, 450, 270);
    fill(30, 105, 70);
    triangle(375, 250, 410, 220, 445, 250);
    fill(36, 120, 81);
    triangle(380, 235, 410, 200, 440, 235);

    // Hills
    noStroke();
    fill(77, 113, 120);
    ellipse(400, 500, 400, 400);
    fill(125, 150, 153);
    ellipse(100, 600, 800, 600);
    fill(154, 179, 184);
    ellipse(500, 700, 800, 600);

    // Snow
    fill(255);
    textSize(random(30, 45));
    text("*", 50, snowY);
    text("*", 100, snowY1);
    text("*", 150, snowY2);
    text("*", 200, snowY3);
    text("*", 250, snowY4);
    text("*", 300, snowY5);
    text("*", 350, snowY6);
    text("*", 400, snowY7);
    textSize(random(20, 30));
    text("*", 450, snowY8);
    text("*", 500, snowY9);
    text("*", 550, snowY10);
    text("*", 600, snowY11);
    text("*", 70, snowY12);
    text("*", 150, snowY10);
    text("*", 400, snowY11);
    snowY += snowSpeed;
    snowY1 += snowSpeed1;   
    snowY2 += snowSpeed;
    snowY3 += snowSpeed1;
    snowY4 += snowSpeed1;
    snowY5 += snowSpeed;
    snowY6 += snowSpeed1;
    snowY7 += snowSpeed;
    snowY8 += snowSpeed;
    snowY += snowSpeed;
    snowY9 += snowSpeed2;
    snowY10 += snowSpeed1;
    snowY11 += snowSpeed2;
    snowY12 += snowSpeed;

    if (snowY > width) {
      snowY = 0;
    }
    if (snowY1 > width) {
      snowY1 = 0;
    }
    if (snowY2 > width) {
      snowY2 = 0;
    }
    if (snowY3 > width) {
      snowY3 = 0;
    }
    if (snowY4 > width) {
      snowY4 = 0;
    }
    if (snowY5 > width) {
      snowY5 = 0;
    }
    if (snowY6 > width) {
      snowY6 = 0;
    }
    if (snowY7 > width) {
      snowY7 = 0;
    }
    if (snowY8 > width) {
      snowY8 = 0;
    }
    if (snowY9 > width) {
      snowY9 = 0;
    }
    if (snowY10 > width) {
      snowY10 = 0;
    }
    if (snowY11 > width) {
      snowY11 = 0;
    }
    if (snowY12 > width) {
      snowY12 = 0;
    }

    // Return to HomeScreen
    fill(181, 67, 14);
    rect(rectX, rectY, rectW, rectH);
    fill(255);
    textSize(50);
    text("<", 30, 560);
    textSize(10);
    text("BACK", 35, 570);
    if (mouseX >= rectX && mouseX <= rectX + rectW && mouseY >= rectY
      && mouseY <= rectY + rectH && mousePressed) {
      backPressed = true;
    }
    if (backPressed) {
      background(8, 36, 84);
      gift2Clicked = false;
    }
  }
}

boolean checkForGiftClicked() {
  if (mouseX >= x && mouseX <= x + w && mouseY >= y
    && mouseY <= y + h && mousePressed) {
    giftClicked = true;
  } 
  return giftClicked;
}

boolean checkForGift2Clicked() {
  if (mouseX >= x + change && mouseX <= x + change + w 
    && mouseY >= y && mouseY <= y + h && mousePressed) {
    gift2Clicked = true;
  } 
  return gift2Clicked;
}

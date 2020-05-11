float rectX = 300, rectY = 50, rectW = 40, rectH = 40;
float targetX = 260, targetY = 350, targetW = 60, targetH = 60, targetV = 1;
float targetX1 = targetX + targetW/4, targetY1 = targetY + targetW/4, 
  targetW1 = 30, targetH1 = 30;
float targetX2 = 285, targetY2 = 375, targetW2 = 10, targetH2 = 10;

void setup() {
  size(600, 600);
}

void draw() {
  background(0);
  // Player
  fill(29, 130, 111);
  stroke(29, 130, 111);
  rect(rectX, rectY, rectW, rectH);

  // Target
  fill(206, 61, 28);
  stroke(255);
  rect(targetX, targetY, targetW, targetH);
  rect(targetX1, targetY1, targetW1, targetH1);
  rect(targetX2, targetY2, targetW2, targetH2);

  targetX = targetX + targetV;
  targetX1 = targetX1 + targetV;
  targetX2 = targetX2 + targetV;

  // Target Moves and Checks for Edges
  if (targetX > width - targetW) {
    targetV *= -1;
  }
  if (targetX < 0) {
    targetV *= -1;
  }

  // Target is Touched
  if (rectY <= targetY + targetH && rectY >= targetY - rectH 
    && rectX >= targetX - rectW && rectX <= targetX + targetW) {
    fill(22, 163, 125);
    textSize(30);
    text("Game Over", width/2, height/2);
    noLoop();
  }
}

// Keys make players move
void keyPressed() { 
  if (key == 'w' || key == 'W') {
    rectY = rectY - 5;
  } else if (key == 'a' || key == 'A') {
    rectX = rectX - 5;
  } else if (key == 'd' || key == 'D') {
    rectX = rectX + 5;
  } else if (key == 's' || key == 'S') {
    rectY = rectY + 5;
  } else if (key == CODED) {
    if (keyCode == UP) {
      rectY = rectY - 5;
    } else if (keyCode == LEFT) {
      rectX = rectX - 5;
    } else if (keyCode == RIGHT) {
      rectX = rectX + 5;
    } else if (keyCode == DOWN) {
      rectY = rectY + 5;
    }
  }
}

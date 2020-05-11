class Player {
  String name;
  float speed;
  float x, y, d;
  color c;
  boolean jumping;
  int gravity;
  int jumpMax, jumpH;

  Player() {
    x = width/3;
    y = height/3*2;
    d = 60;
    speed = 2;
    c = color(0);
    jumping = false;
    jumpMax = 100;
    jumpH = 0;
    gravity = 5;
  }

  void display() {
    fill(c);
    ellipse(x, y, d, d);
    if (jumping) {
      y -= jumpH; // changes y based on jumpH
      if (jumpH <= jumpMax) {
        println("hi");
        jumpH += 10; // players jump height increases
      } else {
        jumpH -= gravity;
      }
    }
  }

  void displayName() {
    // if player has not entered name, it will be automatic
    if (name == "") {
      name = "unkown";
    }
    fill(156, 106, 153);
    textSize(30);
    textAlign(CENTER); // center text
    text(name, width/2, height/15);
  }

  void move() {
    // add something relating to platform
    x = x + speed;

    // if player hits side of platform it is pushed back
    // Check for Left Side of Platform, Player is Pushed off Screen
    //if (x >= platform1.x - d/2 && x <= platform1.x + platform1.w + d/2 
    //  && y <= platform1.y + platform1.h && y >= platform1.y) { // Booleans Operators
    //  x = platform1.x - d/2;
    //}

    //// Player Falls When it Hits Bottom of Platform
    //if (playerY <= platformY + platformH + playerD/2 && playerY > platformY 
    //  && playerX >= platformX && playerX <= platformX + platformW) {
    //  noLoop();
    //}

    //// Game is Over When Bottom of Platform is Hit
    //if (playerY <= platformY + platformH + playerD/2 && playerY > platformY 
    //  && playerX >= platformX && playerX <= platformX + platformW 
    //  || playerY <= platformY2 + platformH2 + playerD/2 && playerY > platformY2 
    //  && playerX >= platformX2 && playerX <= platformX2 + platformW2) {
    //  gameOver();
    //}
  }

  void gameOver() {
    // if player hits floor
  }

  void score() {
  }

  void changeColorTo(color newColor) {
    c = newColor;
  }

  void changeNameTo(String newName) {
    name = newName;
  }
    
  void jumpingIs(boolean jump) {
    jumping = jump;
  }
}

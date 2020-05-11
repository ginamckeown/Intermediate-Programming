class Player {
  String name;
  float xSpeed, ySpeed;
  float x, y, d;
  color c;
  boolean jumping;
  float gravity;
  float jumpMax, jumpH;
  boolean gameOver;

  Player() {
    x = width/3;
    y = height/3*2;
    d = 60;
    ySpeed = 0;
    c = color(0);
    jumping = false;
    jumpMax = 25;
    jumpH = 0;
    gravity = .8;
    gameOver = false;
  }

  void display() {
    if (c == color(0)) {
      // If no color chosen, random color will be used
      player.changeColorTo(color(random(0, 256), random(0, 256), random(0, 256)));
    }
    fill(c);
    ellipse(x, y, d, d);
    //if (jumping) {
    //  y -= jumpH; // changes y based on jumpH
    //  if (jumpH <= jumpMax) {
    //    println("hi");
    //    jumpH += 10; // players jump height increases
    //  } else {
    //    jumpH -= gravity;
    //  }
    //}
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
    y += ySpeed;
    ySpeed += gravity;
    if (jumping) {
      ySpeed = -15;
    }
  }

  void gameOver() {
    // Check for window walls
    if (x >= width - d/2) {
      x = width - d/2;
    } else if (x <= 0 + d/2) {
      x = d/2;
    } else if (y >= height - d/2) {
      y = height - d/2;
    } else if (y <= 0 + d/2) {
      y = d/2;
    }
    
    if (gameOver) {
      xSpeed = 0;
      ySpeed = 0;
    }
  }

  void collision(Platform p) {
    //for (Platform platform : platform) {
      // Check for top of platform
      if (x >= p.x - d/2 && x <= p.x + p.w 
        && y + d/2 >= p.y  && y -+d/2 < p.y + p.h ) {
        ySpeed = 0; // use later for jumping?
        print("hi");
      }

      //// Check for Left Side of Platform, Player is Pushed off Screen
      //if (x >= platform.x - d/2 && y <= platform.y + platform.h && y >= platform.y) {
      //  x = platform.x - d/2;
      //}

      //// Check for Right Side of Platform, Player is Pushed off Screen
      //if (x <= platform.x + platform.w - d/2 && x <= platform.y + platform.h 
      //  && y >= platform.y) {
      //  x = platform.x  + platform.w - d/2;
      //}
   // }
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

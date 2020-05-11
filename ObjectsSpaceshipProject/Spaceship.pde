class Spaceship {
  // Spaceship
  float xPos, yPos;
  float ySpeed;
  float xSpeed;
  float w;
  float h;
  float w2;
  float h2;
  color top;
  color bottom;

  // Shoot
  float rectH;
  float rectW;
  float rectX;
  float rectY;
  float rectXSpeed;
  color rectColor;
  boolean shooting;


  // Fire
  color fireColor;
  color fireColor2;

  Spaceship(float x, float y, float xS, float yS) {
    // Spaceship
    xPos = x;
    yPos = y;
    xSpeed = xS;
    ySpeed = yS;
    w = 50;
    h = 40;
    w2 = 80;
    h2 = 40;

    // Shoot
    rectH = 10;
    rectW = 5;
    rectXSpeed = 5;
    rectColor = color(217, 134, 39);
    shooting = false;
  }

  // The color of the spaceship will change for different corners of the screen
  void colorChange() {
    if (yPos < height/2 && xPos < width/2) {
      top = color(162, 202, 235);
      bottom = color(13, 99, 168);
    } else if (yPos < height/2 && xPos > width/2) {
      top = color(147, 207, 156);
      bottom = color(25, 125, 40);
    } else if (yPos > height/2 && xPos < width/2) {
      top = color(208, 165, 230);
      bottom = color(108, 39, 143);
    } else {
      top = color(210);
      bottom = color(70);
    }
  }
  
  // Display Spaceship
  void display() {
    // Fire
    fireColor = color(207, 131, 17);
    fireColor2 = color(214, 168, 99);
    fill(fireColor);
    triangle(xPos - 20, yPos + h2/2, xPos, 
      yPos + w + h, xPos + 20, yPos + h2/2);
    fill(fireColor2);
    triangle(xPos - 30, yPos + h2/2, xPos - 15, 
      yPos + h2 + h/2, xPos - 10, yPos);
    triangle(xPos + 30, yPos + h2/2, xPos + 15, 
      yPos + h2 + h/2, xPos - 10, yPos);

    // Spacship
    noStroke();
    fill(bottom);
    ellipse(xPos, yPos+15, w2, h2);
    fill(top);
    ellipse(xPos, yPos, w, h);
    if (shooting) {
      rectX += rectXSpeed;
      noStroke();
      fill(rectColor);
      rect(rectX, rectY, 10, 3);
      if (rectX > width) {
        rectX = xPos;
        rectY = yPos;
      }
    }
  }

  // Spaceship moves and can't pass edge of window
  void move() {
    xPos += xSpeed;
    yPos += ySpeed;
    if (xPos > width - w2/2  || xPos < 0 + w2/2) {
      xSpeed *= -1;
    }
    if (yPos > height - h/2 - h2/2|| yPos < 0 + h/2) {
      ySpeed *= -1;
    }
  }

  void shoot() {
    rectX = xPos;
    rectY = yPos;
    shooting = !shooting;
  }
}

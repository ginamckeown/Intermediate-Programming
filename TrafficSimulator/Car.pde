class Car {
  color c, originalColor;
  float xpos;
  float ypos;
  int xspeed, maxSpeed;
  float w, h;
  String label;

  Car(float x, float y, int s, color a) {
    c = a;
    originalColor = c;
    xpos = x;
    ypos = y;
    xspeed = int(random(s/2, s));
    h = 15;
    w = 30;
    maxSpeed = s;
    label = "";
  }

  void display() {
    float displayX = xpos % width;
    rectMode(CENTER);
    textAlign(CENTER);
    fill(c);
    rect(displayX, ypos, w, h, w/4);
    ellipse(displayX+w/3, ypos+h/2, h/2, h/2);
    ellipse(displayX-w/3, ypos+h/2, h/2, h/2);
    text(xspeed, displayX, ypos-h);
    text(label, displayX, ypos + 3*h);
  }

  void drive() {
    xpos = xpos + xspeed;
  }

  //fix the next 5 functions. They should return the appropriate instance variables
  float getX() {
    return xpos;
  }

  float getY() {
    return ypos;
  }

  float getWidth() {
    return w;
  }

  int getSpeed() {
    return xspeed;
  }

  int getMaxSpeed() {
    return maxSpeed;
  }

  float distanceFrom(Car x) {
    return x.getX() - getX();
  }

  void setSpeed(int s) {
    xspeed = s;
    if (s > maxSpeed) {
      xspeed = maxSpeed;
    }
    if (s < 0) {
      xspeed = 0;
    }
    /*
    make the speed equal s--except:
     if s is greater than maxSpeed, make the speed equal maxSpeed
     if s less than 0, make the speed equal 0
     */
  }

  void modColor() {
    if (xspeed >= maxSpeed) {
      c = color(0, 255, 0);
    } else if (xspeed <= rangeMin/2) {
      c = color(255, 0, 0);
    } else {
      c = originalColor;
    }
  }

  void setLabel(String l) {
    label = l;
  }
}

Spaceship s1, s2, s3;

void setup() {
  size(600, 600);
  s1 = new Spaceship(100, height/2, 2, 2);
  s2 = new Spaceship(300, height/2, 3, 3);
  s3 = new Spaceship(500, height/2, 4, 4);
}

void draw() {
  frameRate(90);
  background(18, 41, 77);
  s1.colorChange();
  s2.colorChange();
  s3.colorChange();
  s1.display();
  s2.display();
  s3.display();
  s1.move();
  s2.move();
  s3.move();
}

void keyPressed() {
  if (key == '1') {    
    s1.shoot();
  }
  if (key == '2') {
    s2.shoot();
  }
  if (key == '3') {
    s3.shoot();
  }
}

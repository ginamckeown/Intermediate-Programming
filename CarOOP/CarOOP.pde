Car car1;

void setup() {
  size(400, 400);
  car1 = new Car();
}

void draw() {
  background(0);
  car1.display();
  car1.drive();
  if (car1.xpos > width) {
    car1.xpos = 0;
  }
}

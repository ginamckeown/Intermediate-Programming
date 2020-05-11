Car[] cars;

void setup() {
  size(400, 400);
  cars = new Car[10];
  for (int i = 0; i < cars.length; i++) {
    cars[i] = new Car(random(height - 40), random(1, 5));
  }
}

void draw() {
  background(173, 219, 213);
  for (int i = 0; i < cars.length; i++) {
    cars[i].display();
    cars[i].drive();
  }
}

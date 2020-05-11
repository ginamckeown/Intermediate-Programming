Raindrop r1, r2, r3, r4, r5, r6;

void setup() {
  size(400, 400);
  r1 = new Raindrop(5, 10);
  r2 = new Raindrop(10, 100);
  r3 = new Raindrop(7, 390);
  r4 = new Raindrop(3, 5);
  r5 = new Raindrop(11, 50);
  r6 = new Raindrop(6, 250);
}

void draw() {
  background(0);
  r1.rain();
  r1.display();
  r2.rain();
  r2.display();
  r3.rain();
  r3.display();
  r4.rain();
  r4.display();
  r5.rain();
  r5.display();
  r6.rain();
  r6.display();
}

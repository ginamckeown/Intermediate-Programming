Timer timer;

void setup() {
  timer = new Timer();
}

void draw() {
  background(255);
  timer.display();
}

Raindrop[] drops;

void setup() {
  size(400, 400);
  drops = new Raindrop[100];
  for (int i = 0; i < drops.length; i++) {
    float speed = random(5, 15);
    float xPosition = random(width);
    drops[i] =new Raindrop(speed, xPosition);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < drops.length; i++) {
    drops[i].rain();
    drops[i].display();
    if (drops[i].ypos > height) {
      drops[i].ypos = 0;
    }
  }
}

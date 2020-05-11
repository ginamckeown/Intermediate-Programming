int y = 10;

void setup() {
  size(480, 400);
  background(255);
}

void draw(){
  fill(0);
  while(y < height) { 
    rect(100, y, 100, 10);
    y += 20;
  }
}

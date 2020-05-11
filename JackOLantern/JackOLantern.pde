void setup() {
  size(600, 600);
}

void draw() {
  drawJack(300, 100, 100, color(240, 155, 10));
  drawJack(150, 300, 300, color(222, 136, 67));
  drawJack(100, 500, 500, color(186, 119, 63));
}

void drawJack(float diameter, float x, float y, color c) {
  fill(c);
  ellipse(x, y, diameter, diameter);
  fill(0);
  triangle(x-diameter/3, y-diameter/10, x-diameter/4, y-diameter/4, x-diameter/7, y-diameter/10);
  triangle(x+diameter/3, y-diameter/10, x+diameter/4, y-diameter/4, x+diameter/7, y-diameter/10);
  arc(x, y+diameter/5, diameter/2, diameter/3, 0, PI);
  fill(c);
  stroke(c);
  rect(x-diameter/6, y+diameter/4, diameter/10, diameter/8);
  rect(x+diameter/15, y+diameter/6, diameter/10, diameter/8);
}

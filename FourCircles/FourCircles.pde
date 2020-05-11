Circle circle1, circle2, circle3, circle4;
float x1, x2, y3, y4;

void setup() {
  size(500, 200);
  circle1 = new Circle(color(255, 0, 0), 10);
  circle2 = new Circle(color(0, 255, 0), 15);
  circle3 = new Circle(color(190, 119, 229), 20);
  circle4 = new Circle(color(239, 239, 91), 25);

  x1 = 0;
  x2 = width;
  y3 = height;
  y4 = 0;
  circle1.setX(x1);
  circle2.setX(x2);
  circle3.setY(y3);
  circle4.setY(y4);
}
void draw() {
  background(255);
  circle1.display();
  circle2.display();
  circle1.setX(circle1.getX() + 1);
  circle2.setX(circle2.getX() - 1);

  circle3.display();
  circle4.display();
  circle3.setY(circle3.getY() - 1);
  circle4.setY(circle4.getY() + 1);
}

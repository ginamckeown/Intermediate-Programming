Circle circle1, circle2;
float x1, x2;
void setup() {
size(500, 200);
circle1 = new Circle(color(255, 0, 0), 10);
circle2 = new Circle(color(0, 255, 0), 15);
x1 = 0;
x2 = width;
circle1.setX(x1);
circle2.setX(x2);
}
void draw() {
background(255);
circle1.display();
circle2.display();
circle1.setX(circle1.getX() + 1);
circle2.setX(circle2.getX() - 1);
}

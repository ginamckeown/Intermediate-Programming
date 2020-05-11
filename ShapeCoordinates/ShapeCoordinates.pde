Button triangle, circle, square;
Title main;
float buttonW = 100;

void setup() {
  size(600, 600);
  
  // Create text
  main = new Title("Shape Coordinates", width/2, width/3, 60, color(113, 93, 148));
  
  // Create buttons
  triangle = new Button(width/4, width/2, buttonW, buttonW, 20, color(199, 127, 188));
  circle = new Button(width/4*2, width/2, buttonW, buttonW, 20, color(127, 152, 199));
  square = new Button(width/4*3, width/2, buttonW, buttonW, 20, color(141, 199, 127));
}

void draw() {
  displayHomeScreen();
}

void displayHomeScreen() {
  background(157, 144, 224);
  // Buttons
  triangle.display();
  circle.display();
  square.display();
  triangle.hover();
  circle.hover();
  square.hover();
  
  // Text
  main.display();
}

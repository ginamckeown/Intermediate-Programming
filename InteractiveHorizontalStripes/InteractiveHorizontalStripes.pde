// An array of lines
Line[] lines;

void setup() {
  size(400, 600);
  lines = new Line[15];

  // Initialize all lines objects
  for (int i = 0; i < lines.length; i++) {
    lines[i] = new Line();
  }
}

void draw() {
  background(100);

  // Move and display all lines objects
  for (int i = 0; i < lines.length; i++) {
    lines[i].checkForMouseOver(mouseY);
    lines[i].move();
    if (lines[i].y > height + lines[i].h) {
      lines[i].y = -1 * lines[i].h;
    }
    lines[i].display();
  }
}

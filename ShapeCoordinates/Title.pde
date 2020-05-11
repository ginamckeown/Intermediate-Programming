class Title {
  String text;
  float x;
  float y;
  int size;
  color c;
  
  Title(String tempText, float tempX, float tempY, int tempSize, color tempC) {
    text = tempText;
    x = tempX;
    y = tempY;
    size = tempSize;
    c = tempC;
  }
  
  void display() {
    textAlign(CENTER);
    fill(0, 20);
    text(text, x - 3, y + 3);
    fill(c);
    textSize(size);
    text(text, x, y);
  }
}

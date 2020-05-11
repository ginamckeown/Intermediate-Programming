class Snake {
  int[] xPos = new int[50];
  int[] yPos = new int[50];

  Snake() {
    for (int i = 0; i < xPos.length; i++) {
      xPos[i] = 0;
      yPos[i] = 0;
    }
  }

  void display() {
    for (int i = 0; i < xPos.length - 1; i++) {
      xPos[i] = xPos[i + 1];
      yPos[i] = yPos[i + 1];
    }
    xPos[xPos.length - 1] = mouseX;
    yPos[yPos.length - 1] = mouseY;

    for (int i = 0; i < xPos.length; i++) {
      noStroke();
      fill (255 - i * 5);
      ellipse(xPos[i], yPos[i], i, i);
    }
  }
}

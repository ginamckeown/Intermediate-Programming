class Flower {
  //Stem
  float w, h, x, y;

  //Leaves
  float leafW;
  float leafH;

  Flower(float wx, float wy) {
    x = wx;
    y = wy;
    w = 10;
    h = wx/2;
    leafW = 30;
    leafH = 20;
  }

  void displayStem() {
    //  Stem
    fill(137, 204, 106);
    rect(x/2 - w/2, y/2, w, h);

    // Leaves
    ellipse(x/2 - w, y/3*2, leafW, leafH);
    ellipse(x/2 + w, y/3*2 + leafH, leafW, leafH);
  }
}

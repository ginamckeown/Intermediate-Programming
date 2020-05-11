/*
This class creates the basics of the flower besides the petals
 
 displayStem() displays the stem and its leaves
 
 leafFall() makes the leaves fall
 
 */



class Flower {
  // Stem
  float w, h, x, y; // properties of stem

  // Leaves
  float leafX, leafY, leafW, leafH; // properties of leaf
  float leafX2, leafY2; // properties of leaf2

  Flower(float tempW, float tempH) {
    x = tempW; // x = size of window
    y = tempH; // y = siz of window
    w = 10;
    h = tempW/2;
    leafW = 30;
    leafH = 20;
    leafX = 300;
    leafY = 390;
    leafX2= 300;
    leafY2 = 390;
  }

  void displayStem() {
    // Stem
    fill(137, 204, 106);
    rect(x/2 - w/2, y/2, w, h);

    // Leaves
    ellipse(leafX - w, leafY, leafW, leafH);
    ellipse(leafX2 + w, leafY2 + leafH, leafW, leafH);
  }

  // When leaves fall they fall down at random x changes
  void leafFall() {
    leafX += random(-5, 5);
    leafX2 += random(-5, 5);
    leafY += .5;
    leafY2 += .5;
  }
}

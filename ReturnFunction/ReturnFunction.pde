void setup() {
  size(10, 10);
}

void draw() {
  /*
Complete this program by writing the appropriate functions.
   
   "getHypotenuse()" should return the hypotenuse of a right triangle, with
   the other 2 sides provided as parameters to the function.
   
   "itIsHot()" should return true if the temperature (provided by a parameter) is
   greater than 80. Otherwise it should return false.
   */
  float hypotenuse = getHypotenuse(3, 4);

  println("If 2 sides are 3 and 4, the hypotenuse is: " + hypotenuse);

  hypotenuse = getHypotenuse(13, 17);

  println("If 2 sides are 13 and 17, the hypotenuse is: " + hypotenuse);

  boolean hotOrNot = itIsHot(60);

  println("It is " + hotOrNot + " that 60 is hot.");

  hotOrNot = itIsHot(95);

  println("It is " + hotOrNot + " that 90 is hot.");

  noLoop();
}

float  getHypotenuse(float a, float b) {
  float c = sqrt(sq(a) + sq(b));
  return c;
}

boolean itIsHot(float temp) {
  if (temp > 80) {
    return true;
  } else {
    return false;
  }
}

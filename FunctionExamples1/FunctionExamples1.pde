void setup() {
}

void draw() {
  println(sleepIn(true, true));
  println(sleepIn(true, false));
  println(monkeyTrouble(true, true));
  println(monkeyTrouble(true, false));
  println(monkeyTrouble(false, false));
  println(sumDouble(4, 4));
  println(sumDouble(3, 5));

  println(diff21(5));
  println(diff21(38));
  noLoop();
}

int sumDouble(int a, int b) {
  int sum = a + b;
  if (a==b) {
    sum *= 2;
  } 
  return sum;
  /*
Given two int values, return their sum. Unless the two values are the same, 
   then return double their sum.
   */
}

boolean sleepIn(boolean weekday, boolean vacation) {
  if (!weekday || vacation) {
    return true;
  } 
  return false;

  /*
The parameter weekday is true if it is a weekday, and the parameter vacation
   is true if we are on vacation. We sleep in if it is not a weekday or we're 
   on vacation. Return true if we sleep in, false if we can't sleep in.
   */
}

int diff21(int n) {
  int difference = 21 - n;

  if (n > 21) {
    difference *= -2;
  }

  return difference;
  /*
Given an int n, return the absolute difference between n and 21, except return 
   double the absolute difference if n is over 21.
   */
}

boolean monkeyTrouble(boolean aSmile, boolean bSmile) {
  return aSmile == bSmile;
  /*
We have two monkeys, a and b, and the parameters aSmile and bSmile indicate 
   if each is smiling. We are in trouble if they are both smiling or if neither 
   of them is smiling. Return true if we are in trouble, false if we are not in
   trouble.
   */
}

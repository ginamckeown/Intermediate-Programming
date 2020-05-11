/*
This program consists of an empty draw() function, and a bunch of other empty 
 functions. Empty, but they do have parameters set up already. Inside each function, 
 there are comments with instructions. Follow the instructions, and complete the 
 functions. Then add function calls to your draw method that will run the functions. 
 Run each function enough times to show the range of possilbe outputs. You can print 
 the results to the console or figure out a way to show the results in the window.
 */
void setup() {
}

void draw() {
  println(parrotTrouble(true, 6));
  println(parrotTrouble(true, 7));
  println(parrotTrouble(false, 6));
  println(or35(3));
  println(or35(10));
  println(or35(8));

  println(intMax(1, 2, 3));
  println(intMax(5, 7, 6));
  println(intMax(4, 3, 2));
  noLoop();
}

boolean or35(int n) {
  return n % 3 == 0 || n % 5 == 0;
  /*
  Return true if the given non-negative number is a multiple of 3 
  or a multiple of 5. Use the % "mod" operator.>>>>>>> Remember, "mod" 
  gives you the remainder. So (4 % 2 == 0) is a true statement, and 
  means that 4 is evenly divisible by 2 (because the remainder is 0).
  */
}

boolean parrotTrouble(boolean talking, int hour) {
  return talking && (hour > 20 || hour < 7);
  /*
  We have a loud talking parrot. The "hour" parameter is the current hour 
  time in the range 0..23. We are in trouble if the parrot is talking and 
  the hour is before 7 or after 20. Return true if we are in trouble.
  */
}

int intMax(int a, int b, int c) {
  //if (a > b && a > c) {
  //  return a;
  //} else if (b > c) {
  //  return b;
  //} else {
  //  return c;
  //}
  
  int maximum = a;
  
  if(b > maximum){
    maximum = b;
  }
  
  if(c > maximum){
    maximum = c;
  }
    
  return maximum;
  
  //return max(a,b,c);
  
  /*
  Given three int values, a b c, return the largest.
  */
}

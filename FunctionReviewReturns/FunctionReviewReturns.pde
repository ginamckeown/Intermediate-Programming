void setup() {
  size(400, 400);
}

void draw() {
  background(0);
  String displayText = "";
  for (int i = 0; i < 5; i += 1) {
    displayText += getWord(i); 
    displayText += " "; //why this line? Because you need a space space between the return for getWord and getTwice.
    displayText += getTwice(i);
    displayText += ", ";
    displayText += getSquare(i);
    displayText += ", Letter: ";
    displayText += getLetter(i);
    displayText += "\n"; //why this line? Because it makes whatever comes next appear on the next line.
  }

  text(displayText, 10, 40);
}

String getWord(int a) {
  /*
Add code here that will change the
   word to match the value of the parameter
   (use if statements. Assume the largest 
   parameter will be 5. Remember 0.)
   */
  String word = "One:";
  if (a == 0) {
    word = "Zero:";
  } else if (a == 2) {
    word = "Two:";
  } else if (a == 3) {
    word = "Three:";
  } else if (a == 4) {
    word = "Four:";
  } else if (a == 5) {
    word = "Five:";
  }
  return word;
}

String getTwice(int b) {
  /*
Modyify the line below so that this function returns
   the parameter doubled after the word Doubled:
   */
  b = b * 2;
  return "Doubled: " + b;
}

String getSquare(int c) {
  /*
Make this return a String, similar to getTwice, but this time start with
   Squared: 
   And follow that with the parameter squared, so if 5 is passed 
   to this function, the return will be:
   Squared: 25
   */
  c = c * c;
  return "Squared: " + c;
}

char getLetter(int d) {
  String alphabet = "abcdefghijklmnopqrstuvwxyz";
  /*
Make this return the letter of the alphabet at the d postion.
   Remember the first letter is at position 0.
   (Hint: add a function after the dot following alphabet
   The function should use the parameter)
   */
  return alphabet.charAt(d);
}

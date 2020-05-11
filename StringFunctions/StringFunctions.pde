String someText; //declaring a String variable (also a Global variable)
void setup() {
  size(800, 600);
  //>>>> 1 
  //change the value of someText. (Make it different, and shorter, but at least 3
  //characters.)
  someText = "Holidays! Yay!";
}

void draw() {
  background(255);
  fill(0);
  textSize(20);
  //>>>> 2 
  //move the location of the text
  text(someText, width/3, height/2);
  //Strings have functions built into them. Use a dot (".") to access them.
  //One function, charAt() tells you where in the word a letter is found 
  //(The first letter is a location 0)
  //Notice what the next line puts in the display (unless you covered it up in #1).
  text(someText.charAt(2), width/4*3, height/2);
  //Another String function is length().
  //Notice what is printed to the console from the next line:
  println(someText.length());
  //>>>> 3
  text(secondToLastCharacter(someText), width/3*2, height/2);
  //The next line should print out the second to last character of our
  //String. Make it do that! You will need to use both of the above
  //String functions--charAt() and length(). The function has been started for you, 
  //but it currently returns a blank space. Make it return the second to last 
  //character of whatever is passed to it. Remember that the positions of 
  //letters in a string start with the number 0. So a String of length 4
  //will have characters numbered 0,1,2,3.
  println(secondToLastCharacter(someText));
}

//>>>> 4
//What is the return type for this method? (What does it mean?)
//The return type is char. Char is a single charater.
char secondToLastCharacter(String message) {
  return message.charAt(message.length()-2);//this is not what you return, but having this here prevents an error.
}

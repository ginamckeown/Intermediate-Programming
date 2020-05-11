TextOutput showText;  //declare a TextOutput Object
PFont f;              //declare a Pfont object (for special fonts)
boolean scroll;       //declare a boolean variable to toggle output 

void setup() {
  size (500, 200);
  showText = new TextOutput("Each Character is Written Individually   ");  //create TextOutput object with a message
  f = createFont("Brush Script MT Italic", 24);  //using a specific font (installed on computer)
  scroll = false;                                //don't scroll to start
  background(158, 185, 229);
  frameRate(10);                                 //slow down for one-at-a-time effect
}

void draw() {
  fill(0);
  textFont(f);                   //set the font

  if (scroll) {                 //scroll only when user provides input
    showText.scrollText();
  } else {
    showText.staticText();
  }
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    scroll = !scroll;
    background(158, 185, 229);
  }
  /*
  This method should determine the value of "scrolling" depending on a key press.
   this one changes the value of "scroll" when the right key is pressed, and it
   also resets the background.
   */
}

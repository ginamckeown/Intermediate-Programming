class TextOutput {
  String message;      //to hold text that will be displayed
  int letter; 
  float spacing; //to keep track of which letter & set spacing between letters

  TextOutput(String msg) {  //construct the TextOutput object with given message
    message = msg;
    letter = 0;
    spacing = 10;
  }

  void scrollText() {
    float w = textWidth(message.charAt(letter));

    text(message.charAt(letter), spacing, 50);
    if (letter < message.length()-1) {
      letter = letter + 1;
      spacing = spacing + w;
    } else {
      letter = 0;
      spacing = 0;
      background(158, 185, 229);
    }

    /*
  This method should repeatedly show the message, one letter at a time
     There are multiple ways of doing this. Doing it the way I did, you will use:
     charAt()
     text()
     textWidth() (this one is used to set the spacing do each letter is put in the right spot)
     
     ------The idea is to display a letter, add the spacing, display another letter, and repeat until the
     ------full message is displayed; then reset the background and start over.
     
     */
  }

  void staticText() {
    text(message, 10, 50);
    /*
  This method should show the message all at once and refresh the background
     periodically.
     
     This uses text(), and resets the background every now and then
     */
  }
}

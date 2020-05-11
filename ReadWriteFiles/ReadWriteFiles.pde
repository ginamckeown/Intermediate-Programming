int numClicks;
String[] clicks;

void setup() {
  size(300, 300);
  numClicks = 0;
}

void draw() {
  background(255);
  clicks = loadStrings("myTextFile.txt");           //each line in the file becomes a value in the array
  if (clicks.length != 0) {                         //why this if statement?
    numClicks = Integer.parseInt(clicks[0]);        //convert a String to an Integer
  }
  if (mousePressed) {                               //lets count the number of clicks
    numClicks++;
    String nc = "" + numClicks;                    //a "trick" for changing an integer into a string
    String[] newClicks = {nc};                     //a different way to make an array
    saveStrings("data/myTextFile.txt", newClicks);   //update the text document. Note that the
    //folder must be identified
  }
  fill(0);
  text("All time clicks: " + numClicks, 20, 20);
}

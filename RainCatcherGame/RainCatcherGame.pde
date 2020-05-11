Catcher myCatcher; // declare an object for the Catcher
Drop[] drops; // make an array called drops
Timer myTimer; // declare an object called myTimer

// Score
int score; // declare a veriable that keeps track of score (drops caught)
int highscore; // declare a veriable that keeps track of the highscore
String[] dropsCaught; // declare an array to represent the number of drops caught

void setup() {
  size(500, 600); // set size of window
  score = 0; // set score equal to 0
  highscore = 0; // set highscore equal to 0
  myTimer = new Timer(7000); // make timer for 7000 milliseconds
  myCatcher = new Catcher(32); // make Catcher with radius
  drops = new Drop[30]; // the array drops has a length of 50
  for (int i = 0; i < drops.length; i++) { // loop to create a new drop for the length of the array
    drops[i] = new Drop();
  }
}

void draw() {
  background(208, 231, 237); // background color
  for (int i = 0; i < drops.length; i++) { // loop to base code on drops[i] for the length of the array
    drops[i].display(); // display drops[i]
    drops[i].move(); // move drops[i]

    // You lose when a drop hits the bottom
    if (drops[i].checkForReachBottom(height)) { //when checkForReachBottom is true send the parameter height
      fill(188, 54, 47); // set color of text
      textSize(20); // set text size to 20
      text("You Lose!", width/2 - 50, height/2); // display text when drop hits the bottom of screen
    }

    // If drop is caught than disappear
    if (myCatcher.dropCaught(drops[i])) { // when drop is caught send the object drops[i] as a parameter
      drops[i].disappear(); // when drop is caught it disappears
      score++; // when drop is caught score increases
    }
  }

  // Highscore
  dropsCaught = loadStrings("Highscore.txt"); // each line in the file becomes a value in the array
  if (dropsCaught.length !=0) { // when drops caught has a value other than 0
    highscore = Integer.parseInt(dropsCaught[0]); // //convert a String to an Integer
  }
  if (score > highscore) { // if score is greater than highscore
    highscore = score; // make highscore equal score (new best)
    String hs = "" + highscore; // change an integer into a string
    String[] newHighscore = {hs}; // delare the  array newHighscore to equal
    saveStrings("data/Highscore.txt", newHighscore); // update the text document based on newHighscore with idetified folder
  }

  // Display score
  textSize(15); // set text size to 15
  text("Score: " + score, width/4*3, height/11); // display the score

  // Display highscore
  text("Highscore: " + highscore, width/4*3, height/8);


  // Display time is up
  if (myTimer.isFinished() && score < drops.length) { // when the timer is finished and the game hasnt been won
    fill(188, 54, 47); // set color
    textSize(20); // set text size to 20
    text("You Ran Out of Time", width/2 - 100, height/5); // display you ran out of time
  }

  // Display you win
  if (score == drops.length && !myTimer.isFinished()) { // when you haven't run out of time and you have collected all the drops
    fill(74, 137, 66); // set color
    textSize(20); // set text size to 20
    text("You Win!", width/2 - 50, height/2); //display text you win
  }

  myCatcher.setLocation(mouseX, mouseY); // myCatcher follows mouse
  myCatcher.display(); // display catcher
}

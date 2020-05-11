
boolean chatPageOpen;
boolean homePageOpen;
boolean infoPageOpen;
boolean dataPageOpen;
boolean votePageOpen;
color votePageC = color(225, 235, 52);
color homePageC = color(93,185,226);
color chatPageC = color(141, 194, 201);
color dataPageC = color(167, 108, 196);
color infoPageC = color(230, 198, 96);
color homePageButtonC = homePageC;
color dataPageButtonC = color(72,89,179);
color infoPageButtonC = color(72,89,179);
color chatPageButtonC = color(72,89,179);
color votePageButtonC = color(62, 201, 148);


Button chatButton, dataButton, infoButton, homeButton;
Button backButton;
Button voteButton;
Button candidateButton;
Button issuesButton;
Button myProfileButton;




void setup() {
  size(400, 600);

  // Create Buttons
  chatButton = new Button(width/4, height/6, 60, 60, 10, chatPageButtonC);
  dataButton = new Button(width/4*2, height/6, 60, 60, 10, dataPageButtonC);
  infoButton = new Button(width/4*3, height/6, 60, 60, 10, infoPageButtonC);
  backButton = new Button(width/8*7, height/7, 60, 60, 10, homePageButtonC);
  voteButton = new Button(width/2, height/6*5, 100, 100, 100, votePageButtonC);

  candidateButton = new Button(width/2, height/6*2, width-50, height/6, 20, color(212, 115, 93));
  issuesButton = new Button(width/2, height/6*3 + 20, width-50, height/6, 20, color(94, 152, 191));
  myProfileButton = new Button(width/2, height/6*4 + 40, width-50, height/6, 20, color(84, 179, 108));
}

void draw() {
  homePageOpen = true;

  // Main Functions
  displayVotePage();
  displayChatPage();
  displayDataPage();
  displayHomePage();
  displayInfoPage();
}

void mousePressed() {
  // Opens and Closes Tabs
  if (chatButton.pressed()) {
    chatPageOpen = true;
    homePageOpen = false;
    dataPageOpen = false;
    infoPageOpen = false;
    votePageOpen = false;
  }

  if (dataButton.pressed()) {
    dataPageOpen = true;
    chatPageOpen = false;
    infoPageOpen = false;
    homePageOpen = false;
    votePageOpen = false;
  }

  if (infoButton.pressed()) {
    infoPageOpen = true;
    homePageOpen = false;
    chatPageOpen = false;
    dataPageOpen = false;
    votePageOpen = false;
  }

  if (backButton.pressed()) {
    homePageOpen = true;
    chatPageOpen = false;
    dataPageOpen = false;
    infoPageOpen = false;
    votePageOpen = false;
  }
  if (voteButton.pressed()) {
    votePageOpen = true;
    homePageOpen = false;
    chatPageOpen = false;
    dataPageOpen = false;
    infoPageOpen = false;
  }

}

void displayHomePage() {
  if (homePageOpen) {
    // Display Homescreen Buttons
    background(homePageC);
    chatButton.display();
    infoButton.display();
    dataButton.display();
    chatButton.hover();
    infoButton.hover();
    dataButton.hover();

    // Display Vote Button
    voteButton.display();
    voteButton.hover();

  }
}

void displayChatPage() {
  if (chatPageOpen) {
    background(chatPageC);
    backButton.c = chatPageButtonC;
    backButton.display();
    backButton.hover();

  }
}

void displayDataPage() {
  if (dataPageOpen) {
    background(dataPageC);
    backButton.c = dataPageButtonC;
    backButton.display();
    backButton.hover();

  }
}

void displayInfoPage() {
  if (infoPageOpen) {
    background(infoPageC);
    backButton.c = chatPageButtonC;
    backButton.display();
    backButton.hover();

    candidateButton.display();
    candidateButton.hover();
    issuesButton.display();
    issuesButton.hover();
    myProfileButton.display();
    myProfileButton.hover();
    
    fill(255);
    textSize(40);
    text("Candidates", width/2 - 100, height/6*2 + 20);
    text("Issues", width/2 - 100, height/6*3 + 20);
    text("My Profile", width/2 - 100, height/6*4 + 40);

  }
}

void displayVotePage() {
  if (votePageOpen) {
    background(votePageC);
    backButton.c = votePageButtonC;
    backButton.display();
    backButton.hover();
  }
}

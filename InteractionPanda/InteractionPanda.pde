void setup()  {
  frameRate(5);
  size(600, 600);
}


void draw()  {
  background(138, 176, 216);
  
  // Arms
  stroke(0);
  fill(0);
  ellipse(mouseX-40, mouseY+90, 40, 90);
  ellipse(mouseX+40, mouseY+90, 40, 90);
  
  // Legs
  ellipse(mouseX-25, mouseY+160, 40, 80);
  ellipse(mouseX+25, mouseY+160, 40, 80);
  

  // Body
  fill(255);
  strokeWeight(2);
  stroke(0);
  ellipse(mouseX, mouseY+100, 100, 160);
  fill(0);
  strokeWeight(1);
  arc(mouseX, mouseY+70, 90, 90, PI, TWO_PI);
 
  
  // Ears
  ellipseMode(CENTER);
  ellipse(mouseX-25, mouseY-40, 40, 40);
  ellipse(mouseX+25, mouseY-40, 40, 40);
  fill(255);
  ellipse(mouseX+27, mouseY-38, 15, 15);
  ellipse(mouseX-27, mouseY-38, 15, 15);
  
  
  // Head
  stroke(0);
  ellipse(mouseX, mouseY, 90, 100);
  
  // Eyes
  fill(0);
  stroke(255);
  ellipse(mouseX+20, mouseY-15, 25, 20);
  ellipse(mouseX-20, mouseY-15, 25, 20);
  fill(255);
  ellipse(mouseX+20, mouseY-15, 5, 5);
  ellipse(mouseX-20, mouseY-15, 5, 5);
  
  // Mouth
  fill(0);
  stroke(255);
  ellipse(mouseX, mouseY+15, 10, 20);
  stroke(0);
  rectMode(CENTER);
  rect(mouseX, mouseY+25, 30, 1);
  fill(255);
  stroke(255);
  ellipse(mouseX, mouseY, 20, 30);
  fill(255,192,203);
  arc(mouseX, mouseY+26, 15, 30, 0, PI);
}


  void mousePressed()  {
  
  // Panda tongue disapears and eyes close
  fill(255);
  stroke(255);
  arc(mouseX, mouseY+26, 15, 30, 0, PI);
  ellipse(mouseX+20, mouseY-15, 25, 20);
  ellipse(mouseX-20, mouseY-15, 25, 20);
  
  fill(0);
  arc(mouseX+20, mouseY-15, 25, 20, 0, PI);
  arc(mouseX-20, mouseY-15, 25, 20, 0, PI);
  
  
  // Bamboo appears
  fill(200,220,40);
  stroke(200,220,40);
  rect(100, 350, 15, 650);
  
  fill(80, 100, 70);
  stroke(30, 100, 60);
  rect(100, 600, 15, 2);
  rect(100, 500, 15, 2);
  rect(100, 400, 15, 2);
  rect(100, 300, 15, 2);
  rect(100, 200, 15, 2);
  rect(100, 100, 15, 2);
  
  fill(200, 220, 40);
  stroke(200, 220, 40);
  rect(40, 480, 15, 650);
  
  fill(80, 100, 70);
  stroke(30, 100, 60);
  rect(40, 550, 15, 2);
  rect(40, 450, 15, 2);
  rect(40, 350, 15, 2);
  rect(40, 250, 15, 2);
  
  fill(200, 220, 40);
  stroke(200, 220, 40);
  rect(160, 450, 15, 400);
  
  fill(80, 100, 70);
  stroke(30, 100, 60);
  rect(160, 550, 15, 2);
  rect(160, 450, 15, 2);
  rect(160, 350, 15, 2);
  
  print("Panda's will rule the world! ");
}

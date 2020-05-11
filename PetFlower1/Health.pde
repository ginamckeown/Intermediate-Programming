/*
The health class is what runs the logic of the programs, it creates the health bars, calculates 
 their amounts and decides when the game is over
 
 display() display health bars and text, contrain the width of the sunbar and rainbar 
 color of sunbar and rainbar changes to red when over watered 
 
 ifOverWater() when the plant is overwatered puddles appear 
 
 ifOverSun() when the plant is over sunned the flower's leafs fall
 
 checkForGameOver() when 
 */

class Health {
  // Health
  float sunBarH;
  float sunBarW; // the width of the sun health bar
  float rainBarH; 
  float rainBarW; // the width of the rain health bar

  // Other Health Variables
  float sunHealth; // returned by sunAmount()
  float rainHealth; // returned by rainAmount()
  float totalHealth; // maximum amount of sun

  // Health factors
  float overFactor; // factor that determines when the plant is over watered or sunned
  float sunFactorP; // postive sun change
  float rainFactorP; // postive rain change
  float sunFactorN; // negative sun change
  float rainFactorN; // negative rain change
  float healthS; // sun change
  float healthR; // rain change

  boolean sunny; // stands for sunbutton
  boolean raining; // stands for rainbutton

  // Health Bar Location and Size
  float healthBarX;
  float healthBarY;
  float healthBarW;
  float healthBarH;

  // Water Puddle
  float opacity; // how clear are the puddles

  // Numbers for Color
  float sunR;
  float sunG;
  float sunB;
  float rainR;
  float rainG;
  float rainB;

  Health() {
    // Health
    totalHealth = 200;
    sunHealth = totalHealth;
    rainHealth = totalHealth;

    // Health factors
    overFactor = 1.1;
    sunFactorP = 0.01;
    sunFactorN = -0.01;
    rainFactorP = 0.01;
    rainFactorN = -0.01;

    // Buttons
    sunny = false;
    raining = false;

    // Health Bar Location and Size
    healthBarX = 30;
    healthBarY = 30;
    healthBarW = 215;
    healthBarH = 20;

    // Health Level
    rainBarW = totalHealth;
    rainBarH = healthBarH - 5;
    sunBarW = totalHealth;
    sunBarH = healthBarH - 5;

    // Puddle
    opacity = 0;

    // Numbers for Color
    sunR = 239;
    sunG = 239; 
    sunB = 144;
    rainR = 145;
    rainG = 194;
    rainB = 214;
  }

  void display(boolean tempSunny, boolean tempRaining) {
    sunny = tempSunny;
    raining = tempRaining;

    // Color of sunBar changes when health increases
    if (sunBarW == totalHealth) { //if the sunbar is equal to total health than increase green
      sunG -= 0.5;
    } else {
      if (sunG < 239) { // if the sunbar has not yet returned to yellow, make it faster by decreasing green
        sunG += 1;
      } else {
        sunG = 239; // it should equal 239 if nothing else is true
      }
    }

    // Color of rainBar changes when health increases
    if (rainBarW == totalHealth) { // when rainbar equals total health than make the rain bar more red
      rainR += 0.5;
      rainG -= 0.2;
      rainB -= 0.2;
    } else {
      if (rainR > 145) { // if color has still not returned to blue, than make it return
        rainR -= 1.5;
        rainG += 0.5;
        rainB += 0.5;
      } else { // set back to original values
        rainR = 145;
        rainG = 194;
        rainB = 214;
      }
    }

    // sets sunbarw
    if (sunAmount() > totalHealth) { 
      sunBarW = totalHealth;
    } else if (sunAmount() < 0) {
      sunBarW = 0; // sunBar can't be less than 0
    } else {
      sunBarW = sunAmount();
    }

    // sets rainbarw
    if (rainAmount() > totalHealth) { 
      rainBarW = totalHealth;
    } else if (rainAmount() < 0) {
      rainBarW = 0; // rainBar can't be less than 0
    } else {
      rainBarW = rainAmount();
    }

    // Background Bar
    fill(160, 160, 160);
    rect(healthBarX, healthBarY, healthBarW, healthBarH, 7);
    fill(160, 160, 160);
    rect(healthBarX, healthBarY + healthBarH*2, healthBarW, healthBarH, 7);

    // Health Level
    fill(sunR, sunG, sunB);
    rect(healthBarX + 7, healthBarY + 2, sunBarW, sunBarH, 5);
    fill(rainR, rainG, rainB);
    rect(healthBarX + 7, healthBarY + healthBarH*2 + 2, rainBarW, rainBarH, 5);

    // Display Text
    textSize(15);
    fill(0);
    text("Sun Health", healthBarX, healthBarY - 5);
    text("Water Health", healthBarX, healthBarY + healthBarH*1.9);
  }

  // When the plant is overwatered puddles become more clear
  void ifOverWater() {
    if (overWater()) {
      fill(125, 188, 224, opacity);
      opacity += .5; 
      ellipse(250, 490, 40, 25);
      ellipse(230, 500, 30, 20);
      ellipse(270, 510, 20, 10);
      ellipse(430, 440, 50, 25);
      ellipse(410, 460, 30, 20);
      ellipse(380, 420, 10, 5);
    }
  }

  void ifOverSun() {
    if (overSun()) { //leaf falls if too much sun
      flower.leafFall();
    }
  }

  // Game is over when health runs out
  void checkForGameOver() {
    if (sunBarW <= 0 ||rainBarW <= 0 || sunAmount() > totalHealth * overFactor * 1.3
      || rainAmount() > totalHealth * overFactor * 1.3) { // checking for health too low and too high
      textSize(50);
      fill(150, 30, 10);
      text("Game Over!", 180, 300);
      noLoop();
    }
  }

  void badHealth() {
    if (underHealth()) {
      textSize(20);
      fill(150, 30, 10);
      text("Your Flower Health is too Low", 250, 560);
    }
    if (overSun()) {
      textSize(14);
      fill(150, 30, 10);
      text("Your Flower has Recieved too Much Sun", 250, 530);
    }
    if (overWater()) {
      textSize(14);
      fill(150, 30, 10);
      text("Your Flower has Recieved too Much Water", 250, 520);
    }
  }

  // **Functions that return numbers or boolean**

  // Check for too much sun
  boolean overSun() {
    if (sunAmount() > totalHealth * overFactor) {
      return true;
    }
    return false;
  }

  // Check for over watering
  boolean overWater() {
    if (rainAmount() > totalHealth * overFactor ) {
      return true;
    }
    return false;
  }

  // Check for the health, is it lower than 50?
  boolean underHealth() {
    if (sunAmount() <= 50 || rainAmount() <= 50) {
      return true;
    }
    return false;
  }

  // The sun health and water health slowly decline, sun health cant be too high or too low
  float sunAmount() {
    if (sunny) {
      healthS = sunFactorP; // when it is sunny set the health s equal to positive sunfactor
    } else {
      healthS = sunFactorN; // when it is not sunny set the health s equal to negative sunfactor
    }
    sunHealth += healthS; // sunhealth is increased based on the health s
    return sunHealth;
  }

  float rainAmount() {
    if (raining) {
      healthR = rainFactorP; // when it is raining set the health r equal to positive rainfactor
    } else {
      healthR = rainFactorN; // when it is not raining set the health r equal to negative rainfactor
    }
    rainHealth += healthR; // rainhealth is increased based on the health r
    return rainHealth;
  }
}

class Health {
  // Health
  float sunLevelH, sunLevel;
  float rainLevelH, rainLevel;
  float sunHealth;
  float rainHealth;
  float totalHealth;

  float healthS;
  float healthR;
  boolean sunny;
  boolean raining;

  // Health Bar
  float healthBarX;
  float healthBarY;
  float healthBarW;
  float healthBarH;

  Health() {
    healthBarX = 30;
    healthBarY = 30;
    healthBarW = 215;
    healthBarH = 20;

    // Health
    totalHealth = 200;
    sunHealth = 200;
    rainHealth = 200;
    healthS = 0.2;
    healthR = 0.2;
    sunny = false;
    raining = false;

    rainLevelH = healthBarH - 5;
    sunLevelH = healthBarH - 5;
  }

  void display(boolean tempSunny, boolean tempRaining) {
    sunny = tempSunny;
    raining = tempRaining;
    
    

    // Health Background Bar
    fill(160, 160, 160);
    rect(healthBarX, healthBarY, healthBarW, healthBarH, 7);

    fill(160, 160, 160);
    rect(healthBarX, healthBarY + healthBarH*2, healthBarW, healthBarH, 7);

    textSize(12);
    fill(0);
    text("Sun Level", healthBarX, healthBarY - 5);
    text("Water Level", healthBarX, healthBarY + healthBarH*1.9);

    // Health Level
    fill(237, 237, 144);
    rect(healthBarX + 7, healthBarY + 2, sunHealth(), sunLevelH, 5);
    fill(145, 194, 214);
    rect(healthBarX + 7, healthBarY + healthBarH*2 + 2, rainHealth(), rainLevelH, 5);
  }

  // Game is over when health runs out
  void checkForGameOver() {
    if (sunHealth() <= 0 || rainHealth() <= 0) {
      textSize(50);
      fill(150, 30, 10);
      text("Game Over!", 180, 300);
    } else if (badHealth()) {
      textSize(20);
      fill(150, 30, 10);
      text("Your Flower Health is Low", 250, 550);
    }
  }

  // Health declines when plant is over watered and recieves too much sun
  boolean overSun() {
    if (sunHealth() > totalHealth) {
      return true;
    }
    return false;
  }

  boolean overWater() {
    if (rainHealth() > totalHealth) {
      return true;
    }
    return false;
  }

  // Check for the health, is it lower than 150
  boolean badHealth() {
    if (sunHealth() <= 50 || rainHealth() <= 50) {
      return true;
    }
    return false;
  }

  // The sun health and water health slowly decline, sun health cant be too high or too low
  float sunHealth() {
    if (sunHealth > totalHealth) { // sunHealth can't be bigger than the total health
      sunHealth = totalHealth;
    } else if (sunHealth < 0) { // sunHealth can't be less than 0
      healthS = 0;
    } else {
      if (sunny) {
        healthS = .1;
      } else {
        healthS = -.1;
      }
    }
    sunHealth += healthS;
    return sunHealth;
  }

  float rainHealth() {
    if (rainHealth > totalHealth) { 
      rainHealth = totalHealth;
    } else if (rainHealth < 0) {
      healthR = 0;
    } else {
      if (raining) {
        healthR = .1;
      } else {
        healthR = -.1;
      }
    }
    rainHealth += healthR;
    return rainHealth;
  }
}

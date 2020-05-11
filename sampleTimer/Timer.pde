class Timer {
  int seconds, minutes;

  Timer() {
    seconds = 0;
    minutes = 0;
  }

  void display() {
    fill(0);
    textSize(15);
    textAlign(CENTER);
    text(getMinutes() + ":" + getSeconds(), width/2, height/2);
  }
  
  int getSeconds() {
    seconds = millis()/1000 - getMinutes() * 60;
    return seconds;
  }

  int getMinutes() {
    minutes = millis()/(1000 * 60);
    return minutes;
  }
}

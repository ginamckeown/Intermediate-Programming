class Timer {
  //This timer class starts tracking time as starting from when it is created.
  float startTime;

  Timer() {
    //---> Initialize startTime when Timer starts
    startTime = millis();
  }

  void display() {
    fill(156, 106, 153);
    textSize(30);
    textAlign(CENTER);

    //minsSecs[0] is minutes, minsSecs[1] is seconds
    int[] minsSecs = getTime();
    //build String for displaying. Include leading "0" for single digit seconds
    String displayTime = "" + minsSecs[0] + ":";
    if (minsSecs[1] < 10) {
      displayTime += "0" + minsSecs[1];
    } else {
      displayTime += minsSecs[1];
    }
    text(displayTime, width/12*11, height/15);
  }

  int[] getTime() {
    int[] minSec = {0, 0};
    float e = getElapsedTime();
    //find minutes -- divide elapsed seconds by 60, cut off decimal (convert to int)
    minSec[0] = int((e/ 1000) / 60);
    //find seconds -- elapsed seconds minus the number of minutes (times 60)
    minSec[1] = int(e/1000 - minSec[0] * 60);
    return minSec;
  }

  float getElapsedTime() {
    //elapsed time is the current time (millis()) minus the start time
    float eT = millis() - startTime;
    return eT;
  }
}

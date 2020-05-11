class Timer {
  float elapsedTime; // declare variable to represent time passed
  int totalTime; // declare variable to represent the total time

  Timer(int time) { // take in the value passed to the timer fuction
    totalTime = time; // totalTime is set equal to the value passed to the function
    elapsedTime = millis(); // the time passed is in milliseconds
  }

  void start() {
    elapsedTime = millis(); // ellapsed time shows the number of milliseconds passed
  }

  boolean isFinished() { // true or false function for whether the timer is finished
    if (millis() - elapsedTime >= totalTime) { // when the ellapsed time is greater than the total time of the timer return true
      return true; 
    }
    // If not, ignore above code and return false
    return false;
  }
}

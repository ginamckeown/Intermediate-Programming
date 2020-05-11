class Timer {
  float elapsedTime;
  int totalTime;

  Timer(int time) {
    totalTime = time;
    elapsedTime = millis();
  }

  void start() {
    elapsedTime = millis();
  }

  boolean isFinished() {
    if (millis() - elapsedTime >= totalTime) {
      return true;
    }
    return false;
  }
}

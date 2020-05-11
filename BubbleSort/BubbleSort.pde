int[] list;

void setup() {
  list = new int[10];
  for (int i = 0; i < list.length; i++) {
    list[i] = int (random(0, 100));
  }
}

void draw() {
  println("Before sorting:");
  printArray(list);

  for (int i = 0; i < list.length; i++) {
    for (int j = 0; j < list.length - 1; j++) {
      if (list[j] > list[j+1]) {
        int tempVariable;
        tempVariable = list[j];
        list[j] = list[j+1];
        list[j+1] = tempVariable;
      }
    }
  }

  println("After sorting:");
  printArray(list);
  noLoop();
}

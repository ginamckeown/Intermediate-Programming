Car[] cars;
int rangeMin, rangeMax;

void setup() {
  size(1200, 400);
  cars = new Car[21];  //make an array of Cars
  rangeMin = 4;       //the minimum "maxSpeed" a car can have
  rangeMax = 9;       //the maximum "maxSpeed" a car can have
  //for loop to fill the array (cars) with Car objects
  for (int i = cars.length-1; i >= 0; i--) {
    //                xpos,                  ypos,     maxSpeed,                        color
    cars[i] = new Car(i * width/cars.length, height/2, int(random(rangeMin, rangeMax)), color(255, 255, 0));

    //cars[i].setLabel(str(i));  //to display the car number under the car, uncomment this line
  }
}

void draw() {
  background(0);
  //for loop to get to every car in the array so we can call each car's methods (display, drive, modColor)
  for (int i = 0; i < cars.length; i++) {
    cars[i].display();
    cars[i].drive();
    adjustSpeed(i);  //this function is in this class (the "main" class)--see below
    cars[i].modColor();
  }
}

void adjustSpeed(int thisCar) {
  //thisCar and nextCar are index numbers to be used in the cars array
  int nextCar = thisCar + 1;  

  //adjustment when cars[thisCar] is the last in the array; make cars[nextCar] the first in the array
  if (nextCar == cars.length) { 
    nextCar = 0;
  }

  //d will be the distance from cars[thisCar] to cars[nextCar] (set to width if there is only one car)
  //d is adjusted when cars[thisCar] is the last one in the array
  float d = width;  
  if (cars.length > 1) {
    d = cars[thisCar].distanceFrom(cars[nextCar]);
    if (nextCar == 0) {
      d = width + d;
    }
  } 

  //s is cars[thisCar]'s speed
  int s = cars[thisCar].getSpeed();

  //if cars[thisCar] is touching cars[nextCar] we have a crash, so we stop all cars
  //cars[thisCar] slows down if too close to cars[nextCar] (i.e. when d is too small) and stops if the cars are touching
  //cars[thisCar] speeds up if far enough away from nextCar (i.e. when d is large enough)
  //otherwise cars[thisCar] randomly changes speed a bit 
  if (d < cars[thisCar].getWidth()) {
    stopAllCars();
  } else if (d < cars[thisCar].getWidth() * cars[thisCar].getSpeed()) {
    cars[thisCar].setSpeed(s- int(random(rangeMax/3)));
  } else if (d > (2 * cars[thisCar].getWidth() * cars[thisCar].getSpeed())) {
    cars[thisCar].setSpeed(s+ int(random(rangeMax/3)));
  } else {
    cars[thisCar].setSpeed(s+ int(random(-rangeMax/4, rangeMax/4)));
  }
} 

//used in a crash situation (stop cars and make sure they are red)
void stopAllCars() {
  for (int i = 0; i < cars.length; i++) {
    cars[i].setSpeed(0);
    cars[i].modColor();
  }
}

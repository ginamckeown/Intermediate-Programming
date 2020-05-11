Car car1;  //Declare new Car object

void setup(){
  size(400,400);
  car1 = new Car(color(83, 131, 150));  //added a color paramater to the constructor
}

void draw(){
  background(0);
  car1.display();
  car1.drive();
  
  if((car1.xSpeed > 0 && car1.xPos >= 3 * width/4) || (car1.xSpeed < 0 && car1.xPos <= width/4)){
    car1.turnLeft();  //you must add the turnLeft() function in the Car class
  }
  
  if((car1.ySpeed > 0 && car1.yPos >= 3 * height/4) || (car1.ySpeed < 0 && car1.yPos <= height/4)){
    car1.turnLeft();  //you must add the turnLeft() function in the Car class
  }
}

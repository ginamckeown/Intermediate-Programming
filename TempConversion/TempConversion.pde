void setup()  {
  size(500, 400);
}

void draw() {
  background(0);
  fill(255);

  text("If the temperature is 32 degrees Fahrenheit then it is " + getCelcius(32) + " Celcius", 20, 100);
  text("If the temperature is 212 degrees Fahrenheit then it is " + getCelcius(212) + " Celcius", 20, 200);
  text("If the temperature is 50 degrees Fahrenheit then it is " + getCelcius(50) + " Celcius", 20, 300);
  
}

float getCelcius(float fahrenheit)  {
  float celcius;
  celcius = (fahrenheit - 32) * 5/9;
  return celcius;

}

// import g4p
import g4p_controls.*;


// init boat variables
Boat boat;
Wind wind;
Wave wave;
float damping = 0.98;


void setup() {
  size(1500, 800);
  boat = new Boat(height / 2, width / 2, 50);
  wind = new Wind(45, 0);
  wave = new Wave(250,0,120);
}


void draw() {

  boat.speedX = boat.speedX + cos(radians(boat.angle))*boat.engine_power ;
  boat.speedY = boat.speedY + sin(radians(boat.angle))*boat.engine_power ;



  boat.coords.x += boat.speedX + cos(radians(boat.angle))*boat.boatSpeed()*4 + cos(radians(wind.angle))*wind.strength + cos(radians(wave.angle))*wave.getStrength();;
  boat.coords.y += boat.speedY + sin(radians(boat.angle))*boat.boatSpeed()*4 + sin(radians(wind.angle))*wind.strength + sin(radians(wave.angle))*wave.getStrength();;  
  
  
  background(0, 0, 255);
  boat.drawMe();
  wind.drawMe();
  wave.drawMe();
  
  boat.speedX *= damping;
  boat.speedY *= damping;
}

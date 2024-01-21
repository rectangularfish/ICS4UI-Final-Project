// import g4p
import g4p_controls.*;


// init boat variables
Boat boat;
Force wind;
Wave wave;
float damping = 0.98;


void setup() {
  size(1500, 800);
  boat = new Boat(height / 2, width / 2, 200, 2000, "Cruisers" );
  wind = new Force(45, 1, new PVector(150, 50), color(255,255,255));
  wave = new Wave(250,0, new PVector(50, 50), color(0,255,255), 120);
  
  
  
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

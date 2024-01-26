// import g4p
import g4p_controls.*;

// init boat, wind and wave
Boat boat;
Force wind;
Wave wave;


// Array with settings
String[] data;



void setup() {
  size(1500, 800);
   
   
  // load the data from settings text;
  data = loadStrings("settings.txt");
  
  // initilize boat
  boat = new Boat(width/2, height/2, int(data[0]), int(data[1]), data[2] );
  boat.calculateMaxSpeed();


  // initilize wind and wave
  wind = new Force(int(data[3]), int(data[4]), new PVector(150, 125), color(255, 255, 255), "Wind");
  wave = new Wave(int(data[5]), int(data[6]), int(data[7]), new PVector(150, 50), color(0, 255, 255), "Wave");
  wind.changeStrength();

  createGUI();
  setValues();
}


void draw() {

  // boat old coordinates
  float oldX = boat.coords.x;
  float oldY = boat.coords.y;

  // compute new coordinates
  boat.speedX = boat.speedX + cos(radians(boat.angle))*boat.engine_power ;
  boat.speedY = boat.speedY + sin(radians(boat.angle))*boat.engine_power ;

  // add boat inertia
  boat.coords.x += boat.speedX;
  boat.coords.y += boat.speedY;

  // add boat steering
  boat.coords.x += cos(radians(boat.angle))*boat.boatSpeed()*4;
  boat.coords.y += sin(radians(boat.angle))*boat.boatSpeed()*4;

  // add wind
  boat.coords.x += cos(radians(wind.angle))*wind.strength;
  boat.coords.y += sin(radians(wind.angle))*wind.strength;

  // add wave
  boat.coords.x += cos(radians(wave.angle))*wave.getStrength(int(oldX), int(oldY)) / 20 / (boat.weight/50);

  // compute SOG (speed over ground, motor + wind + wave)
  float sogx = abs(boat.coords.x - oldX);
  float sogy = abs(boat.coords.y - oldY);
  boat.SOG = sqrt(sogx*sogx + sogy*sogy);

  // wrap around
  boat.coords.x = boat.coords.x % width;
  boat.coords.y = boat.coords.y % height;
  if ( boat.coords.y < 0 ) boat.coords.y = height - boat.coords.y;
  if ( boat.coords.x < 0 ) boat.coords.x = width - boat.coords.x;


  background(0, 0, 255);
  
  // draw waves, wind and boat
  wave.drawMe();
  wind.drawMe();
  boat.drawMe();




  // add dampening
  boat.speedX *= 0.98;
  boat.speedY *= 0.98;
}

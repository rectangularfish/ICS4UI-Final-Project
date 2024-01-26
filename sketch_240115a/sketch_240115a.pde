// import g4p
import g4p_controls.*;


// init boat variables
Boat boat;
Force wind;
Wave wave;
float damping = 0.98;
boolean start = true; 

String[] data;
String[] dropList; 
int p1;


void setup() {
  size(1500, 800);
  
  data = loadSettings();
  
  dropList = loadStrings("list_421174");
  
  p1 = findIndex(data[2], dropList);
 
  
  //Boat(int x, int y, int boatLen, int boatWidth, int horsePower, int weight, String type) {

  boat = new Boat(width/2, height/2, int(data[0]), int(data[1]), data[2] );

  boat.calculateMaxSpeed();

  wind = new Force(int(data[3]), int(data[4]), new PVector(150, 125), color(255, 255, 255), "Wind");
  wave = new Wave(int(data[5]), int(data[6]), int(data[7]), new PVector(150, 50), color(0, 255, 255), "Wave");
  wind.changeStrength();

  createGUI();
}


void draw() {
  maxSpeedLabel.setText(str(boat.maxSpeed) + " km/h");


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

  // compute SOG
  float sogx = abs(boat.coords.x - oldX);
  float sogy = abs(boat.coords.y - oldY);
  boat.SOG = sqrt(sogx*sogx + sogy*sogy);

  // wrap around
  boat.coords.x = boat.coords.x % width;
  boat.coords.y = boat.coords.y % height;

  if ( boat.coords.y < 0 ) boat.coords.y = height - boat.coords.y;
  if ( boat.coords.x < 0 ) boat.coords.x = width - boat.coords.x;


  background(0, 0, 255);


  wave.drawMe();
  wind.drawMe();
  boat.drawMe();





  boat.speedX *= damping;
  boat.speedY *= damping;
}

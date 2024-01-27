// import g4p
import g4p_controls.*;

// init boat, wind and wave
Boat boat;
Force wind;
Wave wave;


// array with settings
String[] data;



void setup() {
  size(1500, 800);


  // load data from settings text file;
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

  // update boat position boat 
  boat.updateBoatPosition(); 


  background(0, 0, 255);

  // draw waves, wind and boat
  wave.drawMe();
  wind.drawMe();
  boat.drawMe();
}

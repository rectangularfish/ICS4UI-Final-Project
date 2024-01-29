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

  createGUI();

  // initializes boat, wind and waves and set gui varibles from settings data file
  initializeSettings();
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

// returns a constant based on the type of vessel
int determineCrouchconstant(String type) {

  if (type.equals("Cruiser") || type.equals("Average runabout") || type.equals("Passenger vessel")) {
    return 150;
  } else if (type.equals("Light high-speed cruiser") || type.equals( "High-speed runabout")) {
    return 190;
  } else if (type.equals("Racing boat")) {
    return 210;
  } else if (type.equals("Hydroplane")) {
    return 220;
  } else if (type.equals("Sea sled")) {
    return 230;
  }

  return 0;
}

// find index of a string in an array
int findIndex(String target, String[] array) {
  for (int i = 0; i < array.length; i++) {
    if (target.equals(array[i])) {
      return i;
    }
  }
  return -1;
}



// initialize boat, wind and waves and set the program's gui variables to the saved ones in the settings text file
void initializeSettings() {

  String[] dropList = loadStrings("list_421174");

  String [] data = loadStrings("settings.txt");

  // initilize boat
  boat = new Boat(width/2, height/2, int(data[0]), int(data[1]), data[2] );

  boat.calculateMaxSpeed();


  // initilize wind and wave
  wind = new Force(int(data[3]), int(data[4]), new PVector(150, 125), color(255, 255, 255), "Wind");
  wave = new Wave(int(data[5]), float(data[6]), int(data[7]), new PVector(150, 50), color(0, 255, 255), "Wave");
  wind.changeStrength();

  // set gui variables
  maxSpeedLabel.setText(str(boat.maxSpeed) + " km/h");
  boatPowerField.setText(str(int(data[0])));
  boatWeightField.setText(str(int(data[1])));
  boatDropList.setSelected(findIndex(data[2], dropList));
  windAngleSlider.setValue(int(data[3]));

  windStrengthSlider.setValue(int(data[4]));
  waveStrengthSlider.setValue(int(data[5]));
  waveAttackSlider.setValue(float(data[6]));
  wavelengthSlider.setValue(int(data[7]));

  boat.calculateMaxSpeed();
}

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



// set the program gui variables to the saved ones in the settings text file
void setValues() {

  String[] dropList = loadStrings("list_421174");

  String [] data = loadStrings("settings.txt");

  maxSpeedLabel.setText(str(boat.maxSpeed) + " km/h");
  boatPowerField.setText(str(int(data[0])));
  boatWeightField.setText(str(int(data[1])));
  boatDropList.setSelected(findIndex(data[2], dropList));
  windAngleSlider.setValue(int(data[3]));

  windStrengthSlider.setValue(int(data[4]));
  waveStrengthSlider.setValue(int(data[5]));
  waveAttackSlider.setValue(int(data[6]));
  wavelengthSlider.setValue(int(data[7]));
}

void boatPhysics() {
  
  
  
  
  
  
}

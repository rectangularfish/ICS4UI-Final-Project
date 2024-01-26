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

int findIndex(String target, String[] array) {
  for (int i = 0; i < array.length; i++) {
    if (target.equals(array[i])) {
      return i;
    }
  }
  return -1; // If not found
}


String[] loadSettings() {

  String [] lines = loadStrings("settings.txt");

  return lines;
}


void setValues() {
  boatPowerField.setText(data[0]);
  boatWeightField.setText(data[1]);
  boatDropList.setSelected(p1);
  windAngleSlider.setValue(int(data[3]));

  windStrengthSlider.setValue(int(data[4]));
  waveStrengthSlider.setValue(int(data[5]));
  waveStrengthSlider.setValue(int(data[6]));
  wavelengthSlider.setValue(int(data[7]));
}

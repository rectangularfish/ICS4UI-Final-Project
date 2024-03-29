/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:787770:
  appc.background(230);
} //_CODE_:window1:787770:

public void boatWeightChanged(GTextField source, GEvent event) { //_CODE_:boatWeightField:942429:
  // change boat weight
  if (event == GEvent.ENTERED) {


    // remove all characters that are not numbers
    String input = source.getText();
    String number = input.replaceAll("[^0-9]", "");

    boat.weight = int(number);

    // change wind strength to be relative to weight
    wind.changeStrength();
  }

  // calculate boat max speed since values changed
  boat.calculateMaxSpeed();

  // change max speed label change
  maxSpeedLabel.setText(str(boat.maxSpeed) + " km/h");
  
} //_CODE_:boatWeightField:942429:

public void motorPowerChanged(GTextField source, GEvent event) { //_CODE_:boatPowerField:321998:

  // change boat horse power
  if (event == GEvent.ENTERED) {

    // remove all characters that are not numbers
    String input = source.getText();
    String number = input.replaceAll("[^0-9]", "");

    boat.horsePower = int(number);
  }

  boat.calculateMaxSpeed();

  // change max speed label
  maxSpeedLabel.setText(str(boat.maxSpeed) + " km/h");
  
} //_CODE_:boatPowerField:321998:

public void boatTypeClick(GDropList source, GEvent event) { //_CODE_:boatDropList:421174:

  // change boat type
  boat.type = source.getSelectedText();

  boat.calculateMaxSpeed();
  maxSpeedLabel.setText(str(boat.maxSpeed) + " km/h");
  
} //_CODE_:boatDropList:421174:

public void strengthChange(GSlider source, GEvent event) { //_CODE_:waveStrengthSlider:812044:

  // change wave strength
  wave.strength = source.getValueI();
  
} //_CODE_:waveStrengthSlider:812044:

public void attackChange(GSlider source, GEvent event) { //_CODE_:waveAttackSlider:227914:

  // change wave attack
  wave.attack = source.getValueF();
  
} //_CODE_:waveAttackSlider:227914:

public void wavelengthChange(GSlider source, GEvent event) { //_CODE_:wavelengthSlider:686099:


  // change wave length
  wave.wavelength = source.getValueI();
  
} //_CODE_:wavelengthSlider:686099:

public void strengthWindChange(GSlider source, GEvent event) { //_CODE_:windStrengthSlider:986443:


  // change wind strength constant
  wind.constantStrength = source.getValueI();

  // recalculate the strength of the wind
  wind.changeStrength();
  
} //_CODE_:windStrengthSlider:986443:

public void angleChange(GSlider source, GEvent event) { //_CODE_:windAngleSlider:273369:

  // change angle of the wind
  wind.angle = source.getValueI();
  
} //_CODE_:windAngleSlider:273369:

public void button1_click1(GButton source, GEvent event) { //_CODE_:button1:598995:
  println("button1 - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:button1:598995:

public void saveButtonClicked(GButton source, GEvent event) { //_CODE_:saveSettingsButton:766507:

  // create empty array for data
  String[] settings = new String[8];
  
  
  println(wave.attack);
  
  
  // set indices with data from the program
  settings[0] = str(boat.horsePower);
  settings[1] = str(boat.weight);
  settings[2] = boat.type;
  settings[3] = str(wind.angle);
  settings[4] = str(wind.constantStrength);
  settings[5] = str(wave.strength);
  settings[6] = str(wave.attack);
  settings[7] = str(wave.wavelength);

  // save settings array into text file
  saveStrings("data/settings.txt", settings);
  
} //_CODE_:saveSettingsButton:766507:

public void loadLastSettingsPressed(GButton source, GEvent event) { //_CODE_:loadLastSettings:242421:

    
  // resets boat, wind and waves and sets values to last saved in settings text file
  initializeSettings();
  
} //_CODE_:loadLastSettings:242421:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  window1 = GWindow.getWindow(this, "Window title", 0, 0, 550, 430, JAVA2D);
  window1.noLoop();
  window1.setActionOnClose(G4P.KEEP_OPEN);
  window1.addDrawHandler(this, "win_draw1");
  label1 = new GLabel(window1, 10, 90, 100, 30);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Boat Weight: (lbs)");
  label1.setOpaque(false);
  boatWeightField = new GTextField(window1, 110, 90, 80, 30, G4P.SCROLLBARS_NONE);
  boatWeightField.setText("800");
  boatWeightField.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  boatWeightField.setOpaque(true);
  boatWeightField.addEventHandler(this, "boatWeightChanged");
  label2 = new GLabel(window1, 10, 140, 100, 30);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("Motor Power: (hP)");
  label2.setOpaque(false);
  boatPowerField = new GTextField(window1, 110, 140, 80, 30, G4P.SCROLLBARS_NONE);
  boatPowerField.setText("200");
  boatPowerField.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  boatPowerField.setOpaque(true);
  boatPowerField.addEventHandler(this, "motorPowerChanged");
  label3 = new GLabel(window1, 60, 10, 90, 30);
  label3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label3.setText("Boat Stats");
  label3.setOpaque(false);
  label4 = new GLabel(window1, 10, 50, 100, 30);
  label4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label4.setText("Boat Type:");
  label4.setOpaque(false);
  boatDropList = new GDropList(window1, 110, 50, 160, 180, 5, 10);
  boatDropList.setItems(loadStrings("list_421174"), 0);
  boatDropList.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  boatDropList.addEventHandler(this, "boatTypeClick");
  label5 = new GLabel(window1, 10, 190, 100, 30);
  label5.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label5.setText("Max Speed: (km/h)");
  label5.setOpaque(false);
  maxSpeedLabel = new GLabel(window1, 110, 190, 76, 30);
  maxSpeedLabel.setText("0");
  maxSpeedLabel.setOpaque(false);
  label6 = new GLabel(window1, 350, 10, 90, 30);
  label6.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label6.setText("Wave Stats");
  label6.setOpaque(false);
  label7 = new GLabel(window1, 300, 50, 90, 40);
  label7.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label7.setText("Strength:");
  label7.setOpaque(false);
  waveStrengthSlider = new GSlider(window1, 390, 50, 140, 50, 10.0);
  waveStrengthSlider.setShowValue(true);
  waveStrengthSlider.setLimits(25, 0, 100);
  waveStrengthSlider.setNumberFormat(G4P.INTEGER, 0);
  waveStrengthSlider.setOpaque(false);
  waveStrengthSlider.addEventHandler(this, "strengthChange");
  label8 = new GLabel(window1, 300, 100, 90, 40);
  label8.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label8.setText("Attack");
  label8.setOpaque(false);
  waveAttackSlider = new GSlider(window1, 390, 100, 140, 40, 10.0);
  waveAttackSlider.setShowValue(true);
  waveAttackSlider.setLimits(3.0, -7.0, 7.0);
  waveAttackSlider.setNumberFormat(G4P.DECIMAL, 2);
  waveAttackSlider.setOpaque(false);
  waveAttackSlider.addEventHandler(this, "attackChange");
  label9 = new GLabel(window1, 300, 150, 90, 40);
  label9.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label9.setText("Wavelength:");
  label9.setOpaque(false);
  wavelengthSlider = new GSlider(window1, 390, 150, 140, 40, 10.0);
  wavelengthSlider.setShowValue(true);
  wavelengthSlider.setLimits(300, 200, 1000);
  wavelengthSlider.setNumberFormat(G4P.INTEGER, 0);
  wavelengthSlider.setOpaque(false);
  wavelengthSlider.addEventHandler(this, "wavelengthChange");
  label10 = new GLabel(window1, 60, 240, 80, 30);
  label10.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label10.setText("Wind Stats");
  label10.setOpaque(false);
  label11 = new GLabel(window1, 20, 280, 80, 40);
  label11.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label11.setText("Strength:");
  label11.setOpaque(false);
  windStrengthSlider = new GSlider(window1, 100, 280, 140, 40, 10.0);
  windStrengthSlider.setShowValue(true);
  windStrengthSlider.setLimits(3, 0, 20);
  windStrengthSlider.setNumberFormat(G4P.INTEGER, 0);
  windStrengthSlider.setOpaque(false);
  windStrengthSlider.addEventHandler(this, "strengthWindChange");
  label12 = new GLabel(window1, 20, 330, 80, 40);
  label12.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label12.setText("Angle:");
  label12.setOpaque(false);
  windAngleSlider = new GSlider(window1, 100, 330, 140, 40, 10.0);
  windAngleSlider.setShowValue(true);
  windAngleSlider.setLimits(70, 0, 360);
  windAngleSlider.setNumberFormat(G4P.INTEGER, 0);
  windAngleSlider.setOpaque(false);
  windAngleSlider.addEventHandler(this, "angleChange");
  button1 = new GButton(window1, -700, 30, 90, 40);
  button1.setText("Save Settings");
  button1.addEventHandler(this, "button1_click1");
  saveSettingsButton = new GButton(window1, 310, 200, 100, 40);
  saveSettingsButton.setText("Save Settings");
  saveSettingsButton.addEventHandler(this, "saveButtonClicked");
  label16 = new GLabel(window1, 370, 250, 80, 20);
  label16.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label16.setText("Controls");
  label16.setOpaque(false);
  label17 = new GLabel(window1, 330, 280, 160, 20);
  label17.setText("↑: increase engine power");
  label17.setOpaque(false);
  label18 = new GLabel(window1, 330, 310, 160, 20);
  label18.setText("↓: drecrease engine power");
  label18.setOpaque(false);
  label19 = new GLabel(window1, 330, 340, 160, 20);
  label19.setText("←→: rotate left and right");
  label19.setOpaque(false);
  label20 = new GLabel(window1, 330, 370, 190, 20);
  label20.setText("s: shut off engine ");
  label20.setOpaque(false);
  loadLastSettings = new GButton(window1, 420, 200, 100, 40);
  loadLastSettings.setText("Load Last Settings");
  loadLastSettings.addEventHandler(this, "loadLastSettingsPressed");
  label13 = new GLabel(window1, 330, 400, 160, 20);
  label13.setText("f: full engine power");
  label13.setOpaque(false);
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GLabel label1; 
GTextField boatWeightField; 
GLabel label2; 
GTextField boatPowerField; 
GLabel label3; 
GLabel label4; 
GDropList boatDropList; 
GLabel label5; 
GLabel maxSpeedLabel; 
GLabel label6; 
GLabel label7; 
GSlider waveStrengthSlider; 
GLabel label8; 
GSlider waveAttackSlider; 
GLabel label9; 
GSlider wavelengthSlider; 
GLabel label10; 
GLabel label11; 
GSlider windStrengthSlider; 
GLabel label12; 
GSlider windAngleSlider; 
GButton button1; 
GButton saveSettingsButton; 
GLabel label16; 
GLabel label17; 
GLabel label18; 
GLabel label19; 
GLabel label20; 
GButton loadLastSettings; 
GLabel label13; 

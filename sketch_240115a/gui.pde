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

  if (event == GEvent.ENTERED) {

    boat.weight = int(source.getText());
    wind.changeStrength();
  }
  boat.calculateMaxSpeed();
  
} //_CODE_:boatWeightField:942429:

public void motorPowerChanged(GTextField source, GEvent event) { //_CODE_:textfield1:321998:

  if (event == GEvent.ENTERED) {

    boat.weight = int(source.getText());
  }

  boat.calculateMaxSpeed();
} //_CODE_:textfield1:321998:

public void boatTypeClick(GDropList source, GEvent event) { //_CODE_:dropList1:421174:

  boat.type = source.getSelectedText();

  boat.calculateMaxSpeed();
} //_CODE_:dropList1:421174:

public void waveStrengthChange(GSlider source, GEvent event) { //_CODE_:slider1:812044:

  wave.strength = source.getValueI();
} //_CODE_:slider1:812044:

public void attackChange(GSlider source, GEvent event) { //_CODE_:slider2:227914:


  wave.attack = source.getValueI();
} //_CODE_:slider2:227914:

public void wavelengthChange(GSlider source, GEvent event) { //_CODE_:slider3:686099:

  wave.wavelength = source.getValueI();
} //_CODE_:slider3:686099:

public void windStrengthChange(GSlider source, GEvent event) { //_CODE_:slider4:986443:

  wind.constantStrength = source.getValueI();
  
  wind.changeStrength();


} //_CODE_:slider4:986443:

public void angleChange(GSlider source, GEvent event) { //_CODE_:slider5:847737:

    wind.angle = source.getValueI();


} //_CODE_:slider5:847737:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  window1 = GWindow.getWindow(this, "Window title", 0, 0, 600, 500, JAVA2D);
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
  textfield1 = new GTextField(window1, 110, 140, 80, 30, G4P.SCROLLBARS_NONE);
  textfield1.setText("200");
  textfield1.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  textfield1.setOpaque(true);
  textfield1.addEventHandler(this, "motorPowerChanged");
  label3 = new GLabel(window1, 60, 10, 90, 30);
  label3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label3.setText("Boat Stats");
  label3.setOpaque(false);
  label4 = new GLabel(window1, 10, 50, 100, 30);
  label4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label4.setText("Boat Type:");
  label4.setOpaque(false);
  dropList1 = new GDropList(window1, 110, 50, 160, 180, 5, 10);
  dropList1.setItems(loadStrings("list_421174"), 0);
  dropList1.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  dropList1.addEventHandler(this, "boatTypeClick");
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
  slider1 = new GSlider(window1, 390, 50, 140, 50, 10.0);
  slider1.setShowValue(true);
  slider1.setLimits(25, 0, 100);
  slider1.setNumberFormat(G4P.INTEGER, 0);
  slider1.setOpaque(false);
  slider1.addEventHandler(this, "waveStrengthChange");
  label8 = new GLabel(window1, 300, 100, 90, 40);
  label8.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label8.setText("Attack");
  label8.setOpaque(false);
  slider2 = new GSlider(window1, 390, 100, 140, 40, 10.0);
  slider2.setShowValue(true);
  slider2.setLimits(3.0, -7.0, 7.0);
  slider2.setNumberFormat(G4P.DECIMAL, 2);
  slider2.setOpaque(false);
  slider2.addEventHandler(this, "attackChange");
  label9 = new GLabel(window1, 300, 150, 90, 40);
  label9.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label9.setText("Wavelength:");
  label9.setOpaque(false);
  slider3 = new GSlider(window1, 390, 150, 140, 40, 10.0);
  slider3.setShowValue(true);
  slider3.setLimits(300, 200, 1000);
  slider3.setNumberFormat(G4P.INTEGER, 0);
  slider3.setOpaque(false);
  slider3.addEventHandler(this, "wavelengthChange");
  label10 = new GLabel(window1, 70, 240, 80, 30);
  label10.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label10.setText("Wind Stats");
  label10.setOpaque(false);
  label11 = new GLabel(window1, 30, 280, 80, 40);
  label11.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label11.setText("Strength:");
  label11.setOpaque(false);
  slider4 = new GSlider(window1, 110, 280, 140, 40, 10.0);
  slider4.setShowValue(true);
  slider4.setLimits(4, 0, 10);
  slider4.setNumberFormat(G4P.INTEGER, 0);
  slider4.setOpaque(false);
  slider4.addEventHandler(this, "windStrengthChange");
  label12 = new GLabel(window1, 30, 330, 80, 40);
  label12.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label12.setText("Angle:");
  label12.setOpaque(false);
  slider5 = new GSlider(window1, 110, 330, 140, 40, 10.0);
  slider5.setShowValue(true);
  slider5.setLimits(70, 0, 360);
  slider5.setNumberFormat(G4P.INTEGER, 0);
  slider5.setOpaque(false);
  slider5.addEventHandler(this, "angleChange");
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GLabel label1; 
GTextField boatWeightField; 
GLabel label2; 
GTextField textfield1; 
GLabel label3; 
GLabel label4; 
GDropList dropList1; 
GLabel label5; 
GLabel maxSpeedLabel; 
GLabel label6; 
GLabel label7; 
GSlider slider1; 
GLabel label8; 
GSlider slider2; 
GLabel label9; 
GSlider slider3; 
GLabel label10; 
GLabel label11; 
GSlider slider4; 
GLabel label12; 
GSlider slider5; 


int lastKeyPressTime = 0;
int keyPressDelay = 300;

void keyPressed() {

  // get the current time
  int currentTime = millis();


  // increase engine power every 300 milliseconds
  if (currentTime - lastKeyPressTime >= keyPressDelay) {


    if (keyCode == UP && boat.boatSpeed() < (boat.maxSpeed * 2) / 100) {
      boat.engine_power += 0.005;
    }





    // Update the last key press time
    lastKeyPressTime = currentTime;
  }

  // if s is pressed turn off motor
  if (key == 's') {
    boat.engine_power = 0;
  }
  if (keyCode == DOWN) {
    if (boat.engine_power > 0) {
      boat.engine_power -= 0.005;
    }
  }
  // rotate boat left
  if (keyCode == LEFT) {
    boat.angle -= (250 * boat.engine_power/10 ) + (250 * boat.boatSpeed()/100);
  }

  // rotate boat right
  if (keyCode == RIGHT) {
    boat.angle += (250 * boat.engine_power/10 ) + (250 * boat.boatSpeed()/100);
  }


  // recenter boat
  if (key == 'j') {
    boat.coords.x = width/2;
    boat.coords.y = height/2;
  }
}

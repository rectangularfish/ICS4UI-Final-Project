
int lastKeyPressTime = 0;
int keyPressDelay = 300;

void keyPressed() {

  // get the current time
  //int currentTime = millis();


  //// increase engine power every 300 milliseconds
  //if (currentTime - lastKeyPressTime >= keyPressDelay) {


    if (keyCode == UP ) {
      boat.throttle = min(1, boat.throttle+0.02);
    }

    // Update the last key press time
  //  lastKeyPressTime = currentTime;
  //}

  // if s is pressed turn off motor
  if (key == 's') {
    boat.throttle = 0;
  }
  
  if (key == 'f') {
    boat.throttle = 1;
  }
  
  if (keyCode == DOWN) {
    boat.throttle = min(1, boat.throttle-0.02);;
  }
  // rotate boat left
  if (keyCode == LEFT) {
    boat.angle -= (boat.horsePower*boat.throttle/50 ) + (boat.boatSpeed()/25);
  }

  // rotate boat right
  if (keyCode == RIGHT) {
    boat.angle += (boat.horsePower*boat.throttle/50 ) + (boat.boatSpeed()/25);
  }


  // recenter boat
  if (key == 'j') {
    boat.coords.x = width/2;
    boat.coords.y = height/2;
  }
}

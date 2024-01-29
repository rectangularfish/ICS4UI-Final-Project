void keyPressed() {


  // increase throttle
  if (keyCode == UP ) {
    boat.throttle = min(1, boat.throttle+0.02);
  }


  // turn off motor
  if (key == 's') {
    boat.throttle = 0;
  }

  // full throttle forwards
  if (key == 'f') {
    boat.throttle = 1;
  }

  // decrease throttle
  if (keyCode == DOWN) {
    boat.throttle = min(1, boat.throttle-0.02);
  }

  // rotate boat left
  if (keyCode == LEFT) {
    boat.angle -= (boat.horsePower*boat.throttle/50 ) + (boat.boatSpeed()/25);
  }

  // rotate boat right
  if (keyCode == RIGHT) {
    boat.angle += (boat.horsePower*boat.throttle/50 ) + (boat.boatSpeed()/25);
  }
}

void keyPressed() {

  if (key == 's') {
    boat.engine_power =0;
  }

  if (keyCode == UP) {
    boat.changeEnginePower(0.005);
  }

  if (keyCode == DOWN) {
    if (boat.engine_power > 0) {
      boat.changeEnginePower(-0.005);
    }
  }

  if (keyCode == LEFT) {

    boat.angle -=  (250 * boat.engine_power/10 ) + (250 * boat.boatSpeed()/100) ;
  }

  if (keyCode == RIGHT) {
    float boatSpeed = sqrt( boat.speedX*boat.speedX + boat.speedY*boat.speedY );
    boat.angle += (250 * boat.engine_power/10 ) + (250 * boat.boatSpeed()/100) ;
    
  }

  if (key == 'j') {
    boat.coords.x = width/2;
    boat.coords.y = height/2;
  }
}

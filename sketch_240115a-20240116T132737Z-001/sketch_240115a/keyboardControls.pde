void keyPressed() {

    if (key == 's') {
      boat.engine_power =0;
      return;
    } 
  
    if (keyCode == UP) {
      boat.changeEnginePower(0.01);
      return;
    } 
    
    if (keyCode == DOWN) {
       boat.changeEnginePower(-0.01);
       return;
    }
    
    if (keyCode == LEFT) {
      
      boat.angle -=  (250 * boat.engine_power/10 ) + (250 * boat.boatSpeed()/100) ;
      return;
    }
    
    if (keyCode == RIGHT) {
      float boatSpeed = sqrt( boat.speedX*boat.speedX + boat.speedY*boat.speedY );
      boat.angle += (250 * boat.engine_power/10 ) + (250 * boat.boatSpeed()/100) ;
      return;
    }
  
}

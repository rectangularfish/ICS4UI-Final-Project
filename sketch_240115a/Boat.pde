class Boat {

  // set class variables
  PVector coords;
  int maxSpeed;

  float speedX, speedY;
  float engine_power;
  float angle;




  Boat(int x, int y, int mS) {

    this.coords = new PVector(x, y);

    this.maxSpeed = mS;
    this.speedX = 0;
    this.speedY = 0;

    angle=0;
  }

  float boatSpeed() {
    return sqrt( this.speedX*this.speedX + this.speedY*this.speedY );
  }
  
  void changeEnginePower(float x) {
    this.engine_power += x;
    this.engine_power = max(this.engine_power, -0.1);
    this.engine_power = min(this.engine_power, this.maxSpeed);
  }
  
  void drawMe() {


//    pushMatrix();

    fill(255,255,255);
    translate(this.coords.x, this.coords.y);
    text(engine_power, -30-25, -20-13);
    text(angle+"°", +30-25, -20-13);
    text(this.boatSpeed(), 30-25, +20+13);


    rotate(radians(this.angle));
    rect(-25,-13, 50, 26);
    fill(0,0,100);
    rect(10,-13,15,26);
    resetMatrix();
    
    
    //rotate(0);


  }
}

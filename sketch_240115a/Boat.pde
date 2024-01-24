class Boat {

  // set class variables
  PVector coords;
  float maxSpeed;

  int boatLen;
  int boatWidth;

  float speedX, speedY;
  float engine_power;
  float angle;

  float horsePower;
  float weight;
  
  


  String type;
  int boatSpeed;

  float SOG=0;

  Boat(int x, int y, int boatLen, int boatWidth, int horsePower, int weight, String type) {
    this.coords = new PVector(x, y);

    this.speedX = 0;
    this.speedY = 0;
    this.maxSpeed = (((sqrt(float(horsePower) / weight) * determineCrouchconstant(type)) * 1.609) * 2) / 100;
    this.angle = 0;
    this.boatLen = boatLen;
    this.boatWidth = boatWidth;
    this.weight = weight;
  }

  float boatSpeed() {
    //println(sqrt(( this.speedX*this.speedX + this.speedY*this.speedY ) / 2) * 100);
    return min(this.maxSpeed, sqrt( this.speedX*this.speedX + this.speedY*this.speedY ));
  }

  void changeEnginePower(float x) {
    this.engine_power += x;
  }

  void drawMe() {
    fill(255, 255, 255);
    translate(this.coords.x, this.coords.y);
    text(nf(engine_power * 100, 0, 1), -30-25, -20-13);
    text(nf(abs(angle%360), 0, 1)+"°", 30, -20-13);
    
    text("km/h: "+nf((this.boatSpeed() / 2) * 100, 0, 2), 5, 33 );
    text("SOG: "+nf(this.SOG * 10, 0, 2), 5, 50 );

    rotate(radians(this.angle));
    rect(-15, -7.5, 30, 15);
    fill(0, 0, 100);
    int cockpit = 18;
    rect(this.boatLen-cockpit, this.boatWidth-cockpit, cockpit-4, cockpit-4);

    resetMatrix();
  }
}

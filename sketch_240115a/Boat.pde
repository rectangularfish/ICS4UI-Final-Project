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
    println(maxSpeed);
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
    text(engine_power, -30-25, -20-13);
    text(angle+"°", +30-25, -20-13);
    text("km/h: "+(this.boatSpeed() / 2) * 10, 5, 33 );
    text("SOG: "+this.SOG, 5, 50 );

    rotate(radians(this.angle));
    rect(-this.boatLen/2, -this.boatWidth/2, this.boatLen, this.boatWidth);
    fill(0, 0, 100);
    int cockpit = 5;
    rect(this.boatLen-cockpit, this.boatWidth-cockpit, cockpit, cockpit);

    resetMatrix();
  }
}

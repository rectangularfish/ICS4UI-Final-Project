class Boat {

  // set class fields
  PVector coords;

  float speedX, speedY, engine_power, angle, horsePower, weight, SOG, maxSpeed;
  String type;

  // constructor
  Boat(int x, int y, int hP, int w, String t) {
    
    this.coords = new PVector(x, y);
    this.speedX = 0;
    this.speedY = 0;
    this.horsePower = hP;
    this.weight = w;
    this.type = t;
    this.angle = 0;
    this.SOG = 0;
  }


  // takes the minimum between the max speed and the current speed to make sure the boat does not go over the maximum speed
  float boatSpeed() {
    return min((this.maxSpeed * 2) / 100, sqrt( this.speedX*this.speedX + this.speedY*this.speedY ));
  }

  // uses crouch's formula to calculate the maxmimum speed the boat can go 
  void calculateMaxSpeed() {
    this.maxSpeed = float(nf((sqrt(this.horsePower / this.weight) * determineCrouchconstant(this.type) * 1.603), 0, 2));
  }


  // draws the boat and its statistics around the boat
  void drawMe() {
    fill(255, 255, 255);
    translate(this.coords.x, this.coords.y);
    text(nf(engine_power * 100, 0, 1), -65, -45);
    text(nf(abs(angle%360), 0, 1)+"°", 30, -45);
    text("Speed: "+nf((this.boatSpeed() / 2) * 100, 0, 2), 5, 63 );
    text("SOG: "+nf(this.SOG * 10, 0, 2), 5, 93 );
    rotate(radians(this.angle));
    
    
    scale(0.65);

    fill(255);
    rect(-30, -14, 80, 30, 10, 100, 100, 10);

    fill(175, 180, 195);
    rect(2, -7, 15, 15, 5);

    fill(0);
    ellipse(-25, 0.5, 25, 10);

    resetMatrix();
  }
}

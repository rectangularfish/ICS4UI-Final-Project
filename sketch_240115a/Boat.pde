class Boat {

  // set class fields
  PVector coords, old;
  float speedX, speedY, angle, horsePower, weight, SOG, maxSpeed, throttle;
  String type;

  // constructor
  Boat(int x, int y, int hP, int w, String t) {

    this.coords = new PVector(x, y);
    this.old = new PVector(x, y);
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
    return sqrt( this.speedX*this.speedX + this.speedY*this.speedY );
  }

  /*
  Uses crouch's formula to calculate the maxmimum speed the boat can go
   Crouch's formula:
   V = C/((DISP/HP)**.5)
   V = boat speed in knots
   C = constant dependant on boat type
   DISP = Displacement (pounds)
   HP = horsepower
   */
  void calculateMaxSpeed() {
    this.maxSpeed = float(nf((sqrt(this.horsePower / this.weight) * determineCrouchconstant(this.type) * 1.852), 0, 2));
  }

  // friction ensures that with full throttle boat will reach at most max speed
  float getFriction() {
    return ((this.horsePower*0.045)/this.maxSpeed);
  }

  // updates boat position
  void updateBoatPosition() {

    // boat old coordinates
    this.old.x = this.coords.x;
    this.old.y = this.coords.y;


    // add boat inertia with friction slowdown
    this.speedX = this.speedX - this.speedX*this.getFriction() + cos(radians(this.angle))*this.horsePower*this.throttle*0.045;
    this.speedY = this.speedY - this.speedY*this.getFriction() + sin(radians(this.angle))*this.horsePower*this.throttle*0.045;

    // add speed to boat
    this.coords.x += this.speedX/10;
    this.coords.y += this.speedY/10;


    // add wind
    this.coords.x += cos(radians(wind.angle))*wind.strength;
    this.coords.y += sin(radians(wind.angle))*wind.strength;

    // add wave
    this.coords.x += cos(radians(wave.angle))*wave.getStrength(int(this.old.x), int(this.old.y)) / 20 / (this.weight/50);

    // compute SOG (speed over ground)
    float sogx = abs(this.coords.x - this.old.x);
    float sogy = abs(this.coords.y - this.old.y);
    this.SOG = sqrt(sogx*sogx + sogy*sogy);


    // wrap around screen
    this.coords.x = this.coords.x % width;
    this.coords.y = this.coords.y % height;
    if ( this.coords.y < 0 ) this.coords.y = height - this.coords.y;
    if ( this.coords.x < 0 ) this.coords.x = width - this.coords.x;
  }



  // draws the boat and its statistics around the boat
  void drawMe() {
    fill(255, 255, 255);
    translate(this.coords.x, this.coords.y);
    
    
    // draws statistics
    text(nf(throttle*100, 0, 0)+"%", -80, -45);
    text(nf(abs(angle%360), 0, 1)+"°", 30, -45);
    text("Speed: "+nf(this.boatSpeed(), 0, 2)+" / "+this.maxSpeed, 5, 63 );
    text("SOG: "+nf(this.SOG * 10, 0, 2), 5, 93 );
    rotate(radians(this.angle));
     
     
    // draw boat
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

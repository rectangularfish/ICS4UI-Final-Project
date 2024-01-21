class Boat {

  // set class variables
  PVector coords;
  float maxSpeed;

  float speedX, speedY;
  float engine_power;
  float angle;

  float horsePower;
  float weight;


  String type;

  int boatSpeed;





  Boat(int x, int y, int horsePower, int weight, String type) {

    this.coords = new PVector(x, y);

    this.speedX = 0;
    this.speedY = 0;

    this.maxSpeed = sqrt(float(horsePower) / weight);

    this.boatSpeed = 0;


    println((horsePower * 1.0) / weight);
    println("Horsepower:", horsePower, "Weight:", weight);

    int crouchConstant = 0;

   


    println(crouchConstant);

    this.maxSpeed *= crouchConstant;

    println(maxSpeed);




    this.angle = 0;
  }

  float boatSpeed() {
    
    return min((maxSpeed * 2) / 100, sqrt( this.speedX*this.speedX + this.speedY*this.speedY )) ;
  }

  void changeEnginePower(float x) {
    this.engine_power += x;
    this.engine_power = max(this.engine_power, -0.1);
  }

  void drawMe() {



    fill(255, 255, 255);
    translate(this.coords.x, this.coords.y);
    text(engine_power, -30-25, -20-13);
    text(angle+"°", +30-25, -20-13);
    text((this.boatSpeed() / 2) * 100, 5, 33  );
    

    rotate(radians(this.angle));
    rect(-25, -13, 50, 26);
    fill(0, 0, 100);
    rect(10, -13, 15, 26);
    resetMatrix();


    //rotate(0);
  }
}

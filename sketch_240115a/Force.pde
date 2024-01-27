class Force {


  // fields
  float angle, strength, constantStrength;

  PVector offset;

  color colour;


  String type;


  // constructor
  Force(float a, float s, PVector o, color c, String t) {

    this.angle = a;
    this.strength = s;
    this.type = t;

    this.constantStrength = s;
    this.offset = o;
    this.colour = c;
  }


  void drawMe() {


    pushMatrix();
    strokeWeight(5);
    translate(this.offset.x + 110, this.offset.y);

    //display text
    fill(255);
    textSize(30);
    text(this.type + " direction:", -250, 8);


    // draw arrow
    stroke(this.colour);
    rotate(radians(this.angle));
    line(0, 0, 50, 0);
    line(50, 0, 50 - 8, -8);
    line(50, 0, 50 - 8, 8);

    strokeWeight(1);
    stroke(0);
    popMatrix();
  }




  // change strength of force
  void changeStrength() {
    this.strength = this.constantStrength/(boat.weight / 50);
  }
}

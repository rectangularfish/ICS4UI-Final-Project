class Force {

  float angle;

  float strength;

  PVector offset;

  color colour;


  float constantStrength;
  
  String type;

  Force(float a, float s, PVector o, color c, String type) {

    this.angle = a;
    this.strength = s;
    
    this.type = type;

    this.constantStrength = s;
    this.offset = o;
    this.colour = c;
  }


  void drawMe() {


    
    pushMatrix();
    
    strokeWeight(5);
    translate(this.offset.x + 110 , this.offset.y);
    
    fill(255);
    textSize(30);
    
    text(this.type + " direction:", -250, 8);
    
    
    stroke(this.colour);
    
    rotate(radians(this.angle));
    line(0, 0, 50, 0);
    line(50, 0, 50 - 8, -8);
    line(50, 0, 50 - 8, 8);

    strokeWeight(1);
    stroke(0);
    popMatrix();
  }



  //  translate(this.offset.x, this.offset.y);
  //  rotate(radians(this.angle));
  //  fill(this.colour);
  //  rect(0,0,40,5);
  //}


  void changeStrength() {

    println(constantStrength);
    this.strength = this.constantStrength/(boat.weight / 50);

    println(this.strength);
  }
}

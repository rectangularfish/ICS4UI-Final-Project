class Wind {
  float angle;
  float strength;
  
  Wind(float angle, float strength) {
    this.angle = angle;
    this.strength = strength;
  }
 
  void drawMe() {
    translate(150,50);
    rotate(radians(this.angle));
    fill(255,255,255);
    rect(0,0,40,5);
  }
  
}

class Wave {
  float angle;
  float strength;
  float wavelength;
  
  float tick;
  
  Wave(float angle, float strength, float wavelength) {
    this.angle = angle;
    this.strength = strength;
    this.wavelength = wavelength;
    this.tick = 0;
  }
 
  float getStrength() {
    return sin(this.strength * this.tick/this.wavelength);
  }
 
  void drawMe() {
    this.tick = (this.tick+1) % this.wavelength;
    
    translate(50,50);
    rotate(radians(this.angle));
    fill(0,255,255);
    rect(0,0,40,5);
    text(getStrength(),20,20);
  }
  
  
  
  
  
  
}

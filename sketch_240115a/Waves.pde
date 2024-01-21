class Wave extends Force {
 
  float wavelength;
  
  float tick;
  
  Wave(float a, float s, PVector o, color c, float wl) {
    
    // calls force constructor
    super(a, s, o, c); 
    
    this.wavelength = wl;
    this.tick = 0;
    
  
  }
 
  float getStrength() {
    
    this.tick = (this.tick+1) % this.wavelength;
    return this.strength * this.tick/this.wavelength;
  }
 
  void drawMe() {
    
   super.drawMe();
   text(getStrength(),20,20);

    
  }
  
  
  
  
  
  
}

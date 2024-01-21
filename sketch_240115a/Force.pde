class Force {
  
 float angle;
 
 float strength;

 PVector offset; 
 
 color colour;
  
  
 Force(float a,  float s, PVector o, color c) {
   
   
   this.angle = a;
   
   this.strength = s;
   
   this.offset = o;
   
   this.colour = c;
   
   
   
 }
  
  void drawMe() {
    translate(this.offset.x, this.offset.y);
    rotate(radians(this.angle));
    fill(this.colour);
    rect(0,0,40,5);
    
    
    
  }
  
  
  
  void changeStrength(int s) {
    
    this.strength = s;
 
    
  }
  
  
  
}

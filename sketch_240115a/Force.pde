class Force() {
  
 float angle;
 
 float strength;
 
 PVector offset; 
 
 
  
  
 Force(float a,  float s) {
   
   
   this.angle = a;
   
   this.strength = s;
   
   
   
 }
  
  void drawMe() {
    translate(150,50);
    rotate(radians(this.angle));
    fill(255,255,255);
    rect(0,0,40,5);
  }
  
  
  
}

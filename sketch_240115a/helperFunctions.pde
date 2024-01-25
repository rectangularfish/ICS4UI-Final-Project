int determineCrouchconstant(String type) {
 
   if (type.equals("Cruiser") || type.equals("Average runabout") || type.equals("Passenger vessel")) {
      return 150;
    } else if (type.equals("Light high-speed cruiser") || type.equals( "High-speed runabout")) {
      return 190;
    } else if (type.equals("Racing boat")) {
      return 210;
    } else if (type.equals("Hydroplane")) {
      return 220;
    } 
    else if (type.equals("Sea sled")) {
      return 230;
    }
    
    return 0;
  
}

//void setup() {
  
//  size(500, 500);
  
//  background(0, 0, 255);
  
  
//}



//void draw() {
  
//  fill(255);
//  rect(width / 2, 250, 100, 50, 100, 10, 10, 200);
  
  
//  fill(175,180,195);
//  rect(width/2 + 40, 262, 25, 25, 5);
  
  
  
  
  
  
//}

void drawArrow(int cx, int cy, int len, float angle){
  pushMatrix();
  translate(cx, cy);
  rotate(radians(angle));
  line(0,0,len, 0);
  line(len, 0, len - 8, -8);
  line(len, 0, len - 8, 8);
  popMatrix();
}

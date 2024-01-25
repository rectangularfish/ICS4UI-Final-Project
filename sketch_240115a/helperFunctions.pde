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



void drawArrow(int cx, int cy, int len, float angle){
  pushMatrix();
  translate(cx, cy);
  rotate(radians(angle));
  line(0,0,len, 0);
  line(len, 0, len - 8, -8);
  line(len, 0, len - 8, 8);
  popMatrix();
}

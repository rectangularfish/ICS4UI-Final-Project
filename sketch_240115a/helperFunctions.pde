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

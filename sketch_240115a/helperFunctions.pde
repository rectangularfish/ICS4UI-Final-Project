int findCrouchconstant(String type) {
  
  
   if (type.equals("Cruisers") || type.equals("Average runabouts") || type.equals("Passenger vessels")) {

      return 150;
    } else if (type.equals("Light high-speed cruisers") || type.equals( "High-speed runabouts")) {
      return 190;
    } else if (type.equals("Racing boats")) {
      return 210;
    } else if (type.equals("Hydroplanes")) {
      return 220;
    } 
    
    return 0;
  
}

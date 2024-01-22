class Wave extends Force {

  float wavelength;
  float tick;
  float attack;

  Wave(float a, float s, float attack, PVector o, color c, float wavelength) {

    // calls force constructor
    super(a, s, o, c);

    this.wavelength = wavelength;
    this.tick = 0;

    // a should be between 0 and 1.5
    this.attack = attack;
  }

  float getStrength(int x, int y) {
    float l = this.wavelength;
    float t = this.attack;
    float s = this.strength;

    x+=this.tick;

    //float off = sin(radians(this.angle))*sqrt(x*x+y*y);
    //float str = (sin(2*PI*off/l - t * cos(2*PI*off/l)) + 1 )*s;
    float str = (sin(2*PI*x/l - t * cos(2*PI*x/l)) + 1 )*s;

    //println("angle: "+this.angle+" x: "+x+" y: "+y+" off: "+off+" str: "+str);

    return str;
  }

  //float getStrength() {
  //  // return this.strength * this.tick/this.wavelength;

  //  float x = this.tick;
  //  float l = this.wavelength;
  //  float t = this.attack;
  //  float s = this.strength;

  //  float str = (sin(2*PI*x/l - t * cos(2*PI*x/l)) + 1 )*s;

  //  //println("tick: "+tick+" str: "+str);
  //  return str;
  //}

  void drawMe() {
    super.drawMe();
    this.tick = (this.tick+1);

    //text(getStrength(), 20, 20);
    resetMatrix();
    //    for (int i =  int(boat.coords.x) -200; i < int(boat.coords.x) + 200; i += 5 ) {
    //      for (int j = int(boat.coords.y)-200 ; j < int(boat.coords.y) + 200; j += 5 ) {

    for (int i =  0; i < width; i += 10 ) {
      for (int j = 0; j < height; j += 10 ) {


        float str = wave.getStrength(i, j)/wave.strength;

        stroke(str*100, str*100, 50);
        //fill(str*50, str*50, 50);
        //point(i, j);
        rect(i,j,2,2);
      }
    }

    stroke(0, 0, 0);
    resetMatrix();
  }
}

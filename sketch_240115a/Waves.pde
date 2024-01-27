class Wave extends Force {

  // fields
  float wavelength, tick, attack;

  // constructor
  Wave(float s, float a, float wl, PVector o, color c, String type) {

    // calls force constructor
    super(180, s, o, c, type);


    this.wavelength = wl;
    this.tick = 0;
    this.attack = a;
  }



  // calculate and return the strength using an asymmetric sinusoidal function with parameters based on wavelength, attack, and the current coordinates
  float getStrength(int x, int y) {

    if (this.strength > 0) {
      x+=this.tick;
      y+=this.tick;
    } else {
      x-=this.tick;
      y-=this.tick;
    }
    return (sin(2*PI*x/this.wavelength - this.attack * sin(2*PI*x/this.wavelength)) + 1 ) * this.strength;
  }



  void drawMe() {

    this.tick++;

    // draw grid of rectangles with colour based on wave strength
    for (int i = 0; i < width; i += 10) {
      for (int j = 0; j < height; j += 10) {
        float str = wave.getStrength(i, j) / wave.strength;
        stroke(str * 100, str * 100, 50);
        rect(i, j, 2, 2);
      }
    }

    stroke(0, 0, 0);

    // call superclass drawMe method
    super.drawMe();

    resetMatrix();
  }
}

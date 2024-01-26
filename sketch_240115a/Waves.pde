class Wave extends Force {

  float wavelength;
  float tick;
  float attack;

  Wave(float s, float attack, float wavelength, PVector o, color c, String type) {

    // calls force constructor
    super(180, s, o, c, type);

    this.wavelength = wavelength;
    this.tick = 0;

    // a should be between 0 and 1.5
    this.attack = attack;
  }


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
    this.tick = (this.tick+1);

    resetMatrix();

    for (int i =  0; i < width; i += 10 ) {
      for (int j = 0; j < height; j += 10 ) {


        float str = wave.getStrength(i, j)/wave.strength;

        stroke(str*100, str*100, 50);

        rect(i, j, 2, 2);
      }
    }

    stroke(0, 0, 0);
        super.drawMe();

    resetMatrix();
  }
}

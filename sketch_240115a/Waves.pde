class Wave extends Force {

  float wavelength;
  float tick;
  float attack;

  Wave(float s, float attack, float wavelength, PVector o, color c) {

    // calls force constructor
    super(180, s, o, c);

    this.wavelength = wavelength;
    this.tick = 0;

    // a should be between 0 and 1.5
    this.attack = attack;
  }


  float getStrength(int x, int y) {
    float l = this.wavelength;
    float t = this.attack;
    float s = this.strength;


    if(this.strength > 0) {
      x+=this.tick;
      y+=this.tick;
    } else {
      x-=this.tick;
      y-=this.tick;
    }
    float str = (sin(2*PI*x/l - t * sin(2*PI*x/l)) + 1 )*s;

    //println("angle: "+this.angle+" x: "+x+" y: "+y+" str: "+str);

    return str;
  }

  

  void drawMe() {
    super.drawMe();
    this.tick = (this.tick+1);

    //text(getStrength(), 20, 20);
    resetMatrix();

    for (int i =  0; i < width; i += 10 ) {
      for (int j = 0; j < height; j += 10 ) {


        float str = wave.getStrength(i, j)/wave.strength;

        stroke(str*100, str*100, 50);
        //fill(str*50, str*50, 50);
        //point(i, j);
        rect(i, j, 2, 2);
      }
    }

    stroke(0, 0, 0);
    resetMatrix();
  }
}

class radarTarget {
  /*-----------------------------------Variables-----------------------------------*/
  float x, y; // center of the image
  float d; //diameter of pulses
  float o; // length of x
  float a; // length of y
  /*-----------------------------------Start Constructor-----------------------------------*/
  radarTarget(float tx, float ty) {
    x = tx;
    y = ty;
  }
  /*-----------------------------------End Constructor-----------------------------------*/
  /*-----------------------------------Start Method-----------------------------------*/
  void display( float d, float r, float o, float a) {
    float k = map(d, 0, 120, 0, 255); //maping the value of increasing diameter of pulse to the range of opacity (0,255)
    // triangle; calculation of hypotenus   
    float tang = atan(a/o);
    float h = a/sin(tang);
    // drawing the ellipse
    if (d/2 > int(h)-r) {
      noStroke();
      fill(colors[0], 255-k); // fadeOut effect
      ellipse(x+o, y+a, r, r);
    }
  }
  /*-----------------------------------End Method-----------------------------------*/
}

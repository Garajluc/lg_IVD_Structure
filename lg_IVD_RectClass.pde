/*Grid/Structure of objects*/
class Rect {
  // Global variables
  int a; // x position
  int b; // y position
  int c; // width
  int d; // height
  float colorMode;

  // Constructor
  Rect(int ta, int tb, int tc, int td) {
    a = ta;
    b = tb;
    c = tc;
    d = td;
  }

  // Methods
  void display(float colorMode) {
    stroke(255-colorMode);
    strokeWeight(1);
    noFill();
    rect(a, b, c, d);
    noStroke();
  }
}

/*Grid/Structure of objects*/
class Rect {
  // Global variables
  int a; // x position
  int b; // y position
  int c; // width
  int d; // height

  // Constructor
  Rect(int ta, int tb, int tc, int td) {
    a = ta;
    b = tb;
    c = tc;
    d = td;
  }

  // Methods
  void display() {
    strokeWeight(1);
    noFill();
    rect(a, b, c, d);
  }
}

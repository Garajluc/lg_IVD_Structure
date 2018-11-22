/*Grid/Structure of objects*/
class Frame {
  // Global variables
  int a; // x position
  int b; // y position
  int c; // width
  int d; // height
  float colorMode;

  // Constructor
  Frame(int ta, int tb, int tc, int td) {
    a = ta;
    b = tb;
    c = tc;
    d = td;
  }

  // Methods
  void display() {
    stroke(colors[0]); // color of the outlines
    strokeWeight(1);
    noFill();
    rect(a, b, c, d);
    // text
    //fill(colors[0]); // color of text 
    //textSize(16);
    //text(text, a+10,b+20); // text and its position
    noFill();
    noStroke();
  }
}

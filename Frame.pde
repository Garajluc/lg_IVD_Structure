/*Grid/Structure of objects*/
class Frame {
  /*-----------------------------------Variables-----------------------------------*/
  int a; // x position
  int b; // y position
  int c; // width
  int d; // height
  float colorMode;

  /*-----------------------------------Start Constructor-----------------------------------*/
  Frame(int ta, int tb, int tc, int td) {
    a = ta;
    b = tb;
    c = tc;
    d = td;
  }
  /*-----------------------------------End Constructor-----------------------------------*/
  /*-----------------------------------Start Method-----------------------------------*/
  void display() {
    stroke(colors[0]); // color of the outlines
    strokeWeight(1);
    noFill();
    rect(a, b, c, d);
    noFill();
    noStroke();
  }

  void title(String text) {
    fill(colors[4]);
    textFont(pressStart);
    textSize(16);
    text(text, a+10, b+30);
    textSize(10);
  }
  /*-----------------------------------End Method-----------------------------------*/
}

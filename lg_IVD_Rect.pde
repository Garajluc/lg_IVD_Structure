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
  void display(float colorMode, String text) {
    stroke(colors[0]); // color of the outlines
    strokeWeight(1);
    noFill();
    rect(a, b, c, d);
    // text
    fill(colors[0]); // color of text 
    textSize(16);
    text(text, a+10,b+20); // text and its position
    //line(a+10,b+33,a+c-10, b+33);
    
    //lines in up-right corner
    //stroke(100, 0, 200);
    //line(a+10, b+30, a+20, b+30); // horizontal
    //line(a+10, b+30, a+c-10, b+30); // horizontal
    //line(a+10, b+30, a+10, b+40); // vertical

    //lines up-left corner
    //line(a+c-10, b+30, a+c-20, b+30); // horizontal
    //line(a+c-10, b+30, a+c-10, b+40); // vertical

    //// lines down-right corner
    //line(a+10, b+d-10, a+20, b+d-10); // horizontal
    //line(a+10, b+d-10, a+10, b+d-20); // vertical

    ////lines down-left corner
    //line(a+c-10, b+d-10, a+c-20, b+d-10); // horizontal
    //line(a+c-10, b+d-10, a+c-10, b+d-20); // vertical
    noFill();
    noStroke();
  }
}

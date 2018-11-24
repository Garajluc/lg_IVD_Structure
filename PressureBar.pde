class PressureBar {
   PressureBarRectangles[] pressureBarRectangles = new  PressureBarRectangles[10];
  
  
  int x, y;
  float radialProgressBarCurrentVal;
  int relativeSpeed;

  PressureBar(int tx, int ty, int trelativSpeed) {
    x = tx;
    y = ty;
    relativeSpeed = trelativSpeed;

    for (int i = 0; i <  pressureBarRectangles.length; i++) {
      pressureBarRectangles[i] = new  PressureBarRectangles(x, i*10+y);
    }
  }

  void display(float radialProgressBarCurrentVal) {    
    /*Pressure Progress Bar_One - follow the speed value*/
    for (int i = 0; i < pressureBarRectangles.length; i++) {
      pressureBarRectangles[i].display();
    }
    
    // changing the color of separate pieces
    float relationNumber = relativeSpeed-map(radialProgressBarCurrentVal, 0, 1, 0,10); // 10 is a number of pieces
    for (int i = 0; i < pressureBarRectangles.length; i++) {
      if (i < relationNumber) {
        pressureBarRectangles[i].colorA = color(colors[0], 100); // color of inactive pieces
      } 
      else {
        pressureBarRectangles[i].colorA = lerpColor(pressureBarRectangles[i].from, pressureBarRectangles[i].to, (float(i)/(i+5))); // gradient
      }
    }
  }
  
    void outline() {
    stroke(colors[0]);
    rect(x-3, y-3, 17, 102); // outline of slider
  }
}

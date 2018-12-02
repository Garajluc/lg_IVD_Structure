class FuelBar {
   FuelBarRectangles[] fuelBarRectangles = new  FuelBarRectangles[10];
  
  
  int x, y;
  float radialProgressBarCurrentVal;
  int relativeSpeed;

  FuelBar(int tx, int ty, int trelativSpeed) {
    x = tx;
    y = ty;
    relativeSpeed = trelativSpeed;

    for (int i = 0; i <  fuelBarRectangles.length; i++) {
      fuelBarRectangles[i] = new  FuelBarRectangles(x, i*10+y);
    }
  }

  void display(float radialProgressBarCurrentVal) {    
    /*Pressure Progress Bar_One - follow the speed value*/
    for (int i = 0; i < fuelBarRectangles.length; i++) {
      fuelBarRectangles[i].display();
    }
    
    // changing the color of separate pieces
    float relationNumber = relativeSpeed-map(radialProgressBarCurrentVal, 0, 1, 0,10); // 10 is a number of pieces
    for (int i = 0; i < fuelBarRectangles.length; i++) {
      if (i < relationNumber) {
        fuelBarRectangles[i].colorA = color(colors[0], 100); // color of inactive pieces
      } 
      else {
        fuelBarRectangles[i].colorA = lerpColor(fuelBarRectangles[i].from, fuelBarRectangles[i].to, (float(i)/(i+5))); // gradient
      }
    }
  }
  
    void outline() {
    stroke(colors[0]);
    rect(x-3, y-3, 17, 102); // outline of slider
  }
}

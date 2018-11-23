class ProgressBarPressure {
  ProgressBarPressureRectangles[] progressBarPressureRectangles = new ProgressBarPressureRectangles[10];

  int x, y;
  float radialProgressBarCurrentVal;
  int relativeSpeed;

  ProgressBarPressure(int tx, int ty, int trelativSpeed) {
    x = tx;
    y = ty;
    relativeSpeed = trelativSpeed;

    for (int i = 0; i < progressBarPressureRectangles.length; i++) {
      progressBarPressureRectangles[i] = new ProgressBarPressureRectangles(x+nColX*2+3, i*10+y+33);
    }
  }

  void display(float radialProgressBarCurrentVal) {
    /*Pressure Progress Bar_One - follow the speed value*/
    for (int i = 0; i < progressBarPressureRectangles.length; i++) {
      rect(x+nColX*2, y+30, 17, 102); // outline of slider
      progressBarPressureRectangles[i].display();
    }
    // changing the color of separate pieces
    float relationNumber = relativeSpeed-map(radialProgressBarCurrentVal, 0, 1, 0,10); // 10 is a number of pieces
    for (int i = 0; i < progressBarPressureRectangles.length; i++) {
      if (i < relationNumber) {
        progressBarPressureRectangles[i].colorA = color(colors[0], 100); // color of inactive pieces
      } 
      else {
        progressBarPressureRectangles[i].colorA = lerpColor(progressBarPressureRectangles[i].from, progressBarPressureRectangles[i].to, (float(i)/(i+5))); // gradient
      }
    }
  }
}

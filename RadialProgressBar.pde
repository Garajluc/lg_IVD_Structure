class RadialProgressBar {
  /*-----------------------------------Variables-----------------------------------*/
  int x; //xpos
  int y; //ypos
  int d; // diameter
  float deg; //degree
  String speed;
  float colorMode;
  float increment = 0.0004;
  float currentValue;
  /*-----------------------------------Objects-----------------------------------*/
  PImage speedmeter;
  /*-----------------------------------Start Constructor-----------------------------------*/
  RadialProgressBar(int tx, int ty, int td) {
    x = tx;
    y = ty;
    d = td;
    speedmeter = loadImage("layout/speedmeter.png");
  }
  /*-----------------------------------End Constructor-----------------------------------*/
  /*-----------------------------------Start Method-----------------------------------*/
  void display(float colorMode, float targetValue) {
    if (controlPanel.lightDoorButton[1].initColor != controlPanel.lightDoorButton[1].clickedColor) {

      noStroke();
      if (controlPanelButtonArr == 0) {
        if ( currentValue <= targetValue) {
          currentValue = currentValue + increment;
        } 
        if (currentValue >= targetValue) {
          currentValue = currentValue - increment;
        }
        deg = currentValue*240;
      } else if (controlPanelButtonArr == 1) {
        targetValue = 0.5;
      } else if (controlPanelButtonArr == 2) {
        targetValue = 1;
      } else if (controlPanelButtonArr == 3) { // Break - quick return to 0 speed
        if (currentValue > 0) {
          currentValue -= 0.0003;
        }
      }

      if ( currentValue <= targetValue) {
        currentValue = currentValue + increment;
      } 
      if (currentValue >= targetValue) {
        currentValue = currentValue - increment;
      }
      deg = currentValue*240;
      speed = nf(int(currentValue*240));
      fill(colors[0]);
      arc(x, y, d, d, radians(145), radians(215)+radians(deg-65)); // outside circle
    }
    noStroke();
    fill(0 + colorModeSlider.a); // black
    ellipse(x, y, 88, 88); // inside circle
    fill(colors[0]);
    textAlign(CENTER);
    fill(colors[0]);
    textSize(24);
    text(int(speed), x, y);
    fill(colors[0]);
    textSize(12);
    text("Km/h", x, y+15);
    fill(colors[1]);
    text("Arrival", x, y+35);
    fill(colors[0]);
    text("16:25 PM", x, y+50);
    textAlign(CORNER);
    fill(0);
    imageMode(CENTER);
    image (speedmeter, x, y);
    imageMode(CORNER);
  }
  /*-----------------------------------End Method-----------------------------------*/
}

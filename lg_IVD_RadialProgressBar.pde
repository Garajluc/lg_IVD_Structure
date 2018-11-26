class RadialProgressBar {
  int x; //xpos
  int y; //ypos
  int d; // diameter
  float deg; //degree
  String speed;
  float colorMode;
  float increment = 0.0004;
  float currentValue;
  PImage speedmeter;


  RadialProgressBar(int tx, int ty, int td) {
    x = tx;
    y = ty;
    d = td;
    speedmeter = loadImage("layout/speedmeter.png");
  }

  void display(float colorMode, float targetValue) {
    noStroke();
    if (currentButton3 == 0) {
      if ( currentValue <= targetValue) {
        currentValue = currentValue + increment;
      } 
      if (currentValue >= targetValue) {
        currentValue = currentValue - increment;
      }
      deg = currentValue*240;
    } else if (currentButton3 == 1) {
      targetValue = 0.25;
    } else if (currentButton3 == 2) {
      targetValue = 0.50;
    } else if (currentButton3 == 3) {
      targetValue = 0.75;
    } else if (currentButton3 == 4) {
      targetValue = 1.0;
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
    fill(colors[3]); // black
    ellipse(x, y, 88, 88); // inside circle
    fill(colors[0]);
    textAlign(CENTER);
    fill(colors[0]);
    textSize(24);
    text(int(speed)+1, x, y);
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
}

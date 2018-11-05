class RadialProgressBar {
  int x; //xpos
  int y; //ypos
  int d; // diameter
  float deg; //degree
  String speed;
  float colorMode;
  float increment = 0.001;
  float currentValue;


  RadialProgressBar(int tx, int ty, int td) {
    x = tx;
    y = ty;
    d = td;
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
      deg = currentValue*180;
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
    deg = currentValue*180;

    speed = nf(int(currentValue*100));
    fill(255-colorMode);
    arc(x, y, d, d, radians(180), radians(180)+radians(deg)); 
    fill(colorMode);
    fill(255, 0, 0);
    textSize(32);
    text(int(speed)+1, 620, 80*8+40);
    fill(0);
  }
}

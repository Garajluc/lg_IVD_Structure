class RadialProgressBar {
  int x;
  int y;
  int d;
  float rad;
  String speed;
  float colorMode;


  RadialProgressBar(int tx, int ty, int td) {
    x = tx;
    y = ty;
    d = td;
  }

  void display(float colorMode, float v, float modesButtonIndex) {
    noStroke();
    if (modesButtonIndex == 0) {
      rad = v*360;
      speed = nf(int(v*100));
    } else if (modesButtonIndex == 1) {
      rad = 90;
      speed = "25";
    } else if (modesButtonIndex == 2) {
      rad = 180;
      speed = "50";
    } else if (modesButtonIndex == 3) {
      rad = 270;
      speed = "75";
    } else if (modesButtonIndex == 4) {
      rad = 360;
      speed = "100";
    }
    fill(255-colorMode);
    arc(x, y, d, d, 0, radians(rad));
    fill(colorMode);
    arc(x, y, d+1, d+1, radians(rad), radians(360));
    fill(255, 0, 0);
    textSize(35);
    text(speed + "%", 640-30, 80*7+40+15);
    fill(0);
  }
}

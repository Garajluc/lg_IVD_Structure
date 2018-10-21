class SpeedSlider {

  int x;
  int y;
  int w;
  int h;
  float colorMode;

  float v;
  float rv;
  float value() {
    return v;
  }

  boolean bHover;

  SpeedSlider(int tx, int ty, int tw, int th, float tv) {
    x = tx;
    y = ty;
    w = tw;
    h = th;
    v = tv;
    rv = 1.0 - v;
  }

  void display(float colorMode, float modesButtonIndex) {
    stroke(255);
    fill(colorMode);
    rect(x, y, w, h);

    bHover = false;

    if (
      mouseX > x &&
      mouseX < x + w &&
      mouseY > y &&
      mouseY < y + h) {
      bHover = true;
    }

    if (modesButtonIndex == 0 && bHover && mousePressed) {
      v = 1.0 - ((mouseY - y)/float(h));
      constrain(rv, 0.0, 1.0);
      rv = 1.0 - v;
    } else if (modesButtonIndex == 1) {
      rv = 0.75;
      v = 0.25;
    } else if (modesButtonIndex == 2) {
      rv = 0.50;
      v = 0.50;
    } else if (modesButtonIndex == 3) {
      rv = 0.25;
      v = 0.75;
    } else if (modesButtonIndex == 4) {
      rv = 0.0;
      v = 1.0;
    }
    noStroke();
    fill(255-colorMode);
    rect(x+1, y + (rv * h), w-1, v * h);
    fill(0);
  }
}

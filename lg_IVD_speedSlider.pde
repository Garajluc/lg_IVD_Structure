class SpeedSlider {

  int x;
  int y;
  int w;
  int h;

  float v;// value
  float rv;// remainder value (e.g. when v = 0.6, rv = 0.4)
  float value() {return v;}

  boolean bHover;

  // constructor
  SpeedSlider(int tx, int ty, int tw, int th, float tv) {
    x = tx;
    y = ty;
    w = tw;
    h = th;
    v = tv;
    // set the remainder value of v
    rv = 1.0 - v;
  }

  void display() {
    //strokeWeight(1);
    stroke(255);
    //noFill();
    rect(x, y, w, h);

    bHover = false;

    if (
      mouseX > x &&
      mouseX < x + w &&
      mouseY > y &&
      mouseY < y + h) {
      bHover = true;
    }

    if (bHover && mousePressed) {
      noFill();
      v = 1.0 - ((mouseY - y)/float(h));
      constrain(rv, 0.0, 1.0);
      rv = 1.0 - v;
    }

    //noStroke();
    fill(255);
    rect(x, y + (rv * h), w, v * h);
  }
}

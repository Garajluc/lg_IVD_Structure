class RandomSlider {
  float xoff;
  int x, y, w, h;


  RandomSlider( int tx, int ty, int tw, int th, float nXoff) {
    x = tx;
    y = ty;
    w = tw;
    h = th;  
    xoff = nXoff;
  }

  void displayAir() {
    noStroke();
    fill(255);
    rect(x, y, w, h);
    xoff = xoff + 0.01;
    float n = noise(xoff) * h;
    rect(x-w, y+n, w*3, 10);
    noFill();
  }

  void displayEngine() {
    xoff = xoff + 0.01;
    float n = noise(xoff) * h;
    fill(255);
    rect(x, y+h, w, -h+n);
  }
  
  void displayVerticalSlider() {
    noStroke();
    fill(255);
    rect(x, y, w, h);
    xoff = xoff + 0.01;
    float n = noise(xoff) * w;
    rect(x+n, y-h, 10, h*3);
    noFill();
  }
}

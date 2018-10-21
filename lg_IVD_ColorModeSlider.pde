class ColorModeSlider {
  float a;
  float x=50;
  float w=100+x;
  float h=100+x;
  float value() {
    return a;
  }

  ColorModeSlider() {
  }

  void display() {
    stroke(255);
    fill(255-a);
    line (50, 440, 400, 440);
    rect(x, 425, 10, 30);
    noStroke();
    noFill();
  }

  void move() {
    x=mouseX;
    a = map(x, 50, 400, 0, 255);
    if (x<50) {
      x=50;
      a=0;
    } else if (x>400) {
      x=400;
      a=255;
    }
    w=100+x;
    h=100+x;
  }
}

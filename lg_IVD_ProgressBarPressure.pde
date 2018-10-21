class ProgressBarPressure {
  color colorA;
  color from = color (232, 255, 62);
  color to = color (255, 62, 143);
  float x,y;
  float rn;
  float j = 1;
  
  ProgressBarPressure(float tx, float ty) {
    x = tx;
    y = ty;
  }
  
  void display() {
    noStroke();
    fill(colorA);
    rect(x, y, 30, 5);
    noFill();
    }
}

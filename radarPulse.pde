class radarPulse {
  int x;
  int y;
  float diameter;
  /*-----------------------------------Start Constructor-----------------------------------*/
  radarPulse(int tx, int ty, float tdiameter) {
    x = tx;
    y = ty;
    diameter = tdiameter;
  }
  /*-----------------------------------End Constructor-----------------------------------*/

  /*-----------------------------------Start Method-----------------------------------*/
  void display() {
    stroke(colors[1], 255 - diameter);
    fill(colors[1], 155 - diameter);
    ellipse(x, y, diameter, diameter);
    diameter += 1;
    if (diameter > 120) diameter = 0;
  }
  /*-----------------------------------End Method-----------------------------------*/
}

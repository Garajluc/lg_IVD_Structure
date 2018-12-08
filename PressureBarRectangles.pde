//Reference:
//https://forum.processing.org/two/discussion/4958/how-to-create-gradient-progress-bar-with-transparecy?fbclid=IwAR3ulY8jskWSGY8YLlHkTT5APAmJjdZdHPRiL8MQYOigSdJzHCQyJocuVHY
class PressureBarRectangles {
  /*-----------------------------------Variables-----------------------------------*/
  color colorA;
  color from = colors[0];
  color to = colors[4];
  float x, y; // position
/*-----------------------------------Start Constructor-----------------------------------*/
   PressureBarRectangles(float tx, float ty) {
    x = tx;
    y = ty;
  }
  /*-----------------------------------End Constructor-----------------------------------*/
  /*-----------------------------------Start Method-----------------------------------*/
  void display() {
    noStroke();
    fill(colorA);
    rect(x, y, 12, 7);
    noFill();
  }
  /*-----------------------------------End Method-----------------------------------*/
}

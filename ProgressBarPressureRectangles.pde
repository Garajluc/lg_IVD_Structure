//Reference:
//https://forum.processing.org/two/discussion/4958/how-to-create-gradient-progress-bar-with-transparecy?fbclid=IwAR3ulY8jskWSGY8YLlHkTT5APAmJjdZdHPRiL8MQYOigSdJzHCQyJocuVHY
class ProgressBarPressureRectangles {
  color colorA;
  color from = colors[0];
  color to = colors[4];
  float x, y; // position

  ProgressBarPressureRectangles(float tx, float ty) {
    x = tx;
    y = ty;
  }

  void display() {
    noStroke();
    fill(colorA);
    rect(x, y, 12, 7);
    noFill();
  }
}

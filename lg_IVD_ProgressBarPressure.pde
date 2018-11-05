//Reference:
//https://forum.processing.org/two/discussion/4958/how-to-create-gradient-progress-bar-with-transparecy?fbclid=IwAR3ulY8jskWSGY8YLlHkTT5APAmJjdZdHPRiL8MQYOigSdJzHCQyJocuVHY
class ProgressBarPressure {
  color colorA;
  color from = color (255,0,0);
  color to = color (100,0,200);
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

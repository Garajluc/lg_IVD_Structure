class RadialProgressBar {
  int x;
  int y;
  int d;
  
  
  RadialProgressBar(int tx, int ty, int td) {
    x = tx;
    y = ty;
    d = td;
  }
  
  void display(float v) {
    arc(x,y,d,d,radians(90),radians(v*480));
    fill(0);
    arc(x,y,d+1,d+1,radians(v*480),radians(480));
  }
}

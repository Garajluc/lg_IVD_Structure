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
    arc(x,y,d,d,0,radians(v*360));
    fill(0);
    arc(x,y,d+1,d+1,radians(v*360),radians(360));
    fill(255,0,0);
    textSize(50);
    text(nf(int(v*100)),640-30,80*7+40+15);
  }
  
  void modes(float v, float modesButtonIndex) {
    if (modesButtonIndex == 0) {
      arc(x,y,d,d,0,radians(v*360));
      fill(0);
      arc(x,y,d+1,d+1,radians(v*360),radians(360));
      fill(255,0,0);
      textSize(50);
      text(nf(int(v*100)),640-30,80*7+40+15);
    } else if (modesButtonIndex == 1) {
      arc(x,y,d,d,0,radians(90));
      fill(0);
      arc(x,y,d+1,d+1,radians(90),radians(360));
      fill(255,0,0);
      textSize(50);
      text("45",640-30,80*7+40+15);
    }
  }
}

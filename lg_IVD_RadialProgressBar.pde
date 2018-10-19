class RadialProgressBar {
  float x; // changing
  float speed = 1;
  
  RadialProgressBar() {
  }
  
  void display(float v) {
    arc(200,200,300,300,0,radians(v*360));
  }
  
  //void move() {
  //  x = x + speed;    
  //}
}

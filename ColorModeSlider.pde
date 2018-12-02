class ColorModeSlider {
  /*moving triangle*/
  float targetValue;
  /*background rectangle*/
  int x, y, w, h;
  /*color*/
  float a;
  /*fixed rectangle*/
  float mRectY;
  float increment = 2;
  float currentValue;

  PImage arrow;

  ColorModeSlider(int tx, int ty, int tw, int th) {
    x = tx;
    y = ty;
    w = tw;
    h = th;
    arrow = loadImage("layout/arrow.png");
    currentValue=x;
    targetValue=x;
  }

  void display() {
    image(arrow, currentValue, y-15);

    stroke(colors[1]);
    line (x, y, x+w, y); // horizontal line
    // vertical lines
    line(x+5, y-5, x+5, y-5+10); 
    line(x+(w/3), y-5, x+(w/3), y-5+10);
    line(x+(w/3)*2, y-5, x+(w/3)*2, y-5+10);
    line(x+w-5, y-5, x+w-5, y-5+10);
  }

  void move() {
    if (mousePressed) {
      if (mouseX >= x && mouseX <= x+10 && mouseY >= y-15 && mouseY <= y+15) {
        targetValue=x;
      } else if (mouseX >= x-5+w/3 && mouseX <= (x+w/3)+10 && mouseY >= y-15 && mouseY <= y+15) {
        targetValue=x-2+w/3;
      } else if (mouseX >= x+(w/3)*2-5 && mouseX <= x+(w/3)*2+10 && mouseY >= y-15 && mouseY <= y+15) {
        targetValue=x-5+w/3*2;
      } else if (mouseX >= x+w-10 && mouseX <= x+w && mouseY >= y-15 && mouseY <= y+15) {
        targetValue=x-8+w;
      }
    }
    
    a=map(currentValue, 90, 180, 0, 35);
    println(a);
    if ( currentValue <= targetValue) {
      currentValue = currentValue + increment;
    } 
    if (currentValue >= targetValue) {
      currentValue = currentValue - increment;
    }
  }
}

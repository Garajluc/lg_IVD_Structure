class PressureUI {
  PressureBar[] pressureBar = new PressureBar[2];
  PImage scale;
  float radialProgressBarCurrentVal;
  int x,y;

  PressureUI(int tx, int ty) {
    x =tx;
    y =ty;
    
    for (int i = 0; i < pressureBar.length; i++) {
      pressureBar[i] = new PressureBar(x+nColX*2+3+i*50, y+33, 9+i*(-2));
    }
    scale = loadImage("layout/scale.png");
  }

  void display(float radialProgressBarCurrentVal) {
    for (int i = 0; i < pressureBar.length; i++) { // Pressure Progress Bar_One - follow the speed value
      pressureBar[i].display(radialProgressBarCurrentVal, 297+i*303, 603+i*303);
      pressureBar[i].outline();
    }
    image(scale, x+nColX*2+27, y+30);
    fill(colors[0]); // #FFF
    textFont(pressStart);
    textSize(10);
    text("A1 Ful A2", x+nColX*2, y+nColY*2-12);
  }
}

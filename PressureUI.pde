class PressureUI {
  /*-----------------------------------Objects-----------------------------------*/
  PressureBar[] pressureBar = new PressureBar[2];
  PImage scale;
  /*-----------------------------------Variables-----------------------------------*/
  float radialProgressBarCurrentVal;
  int x, y;
  /*-----------------------------------Start COnstructor-----------------------------------*/
  PressureUI(int tx, int ty) {
    x =tx;
    y =ty;

    for (int i = 0; i < pressureBar.length; i++) {
      pressureBar[i] = new PressureBar(x+nColX*2+3+i*50, y+33, 9+i*(-2));
    }
    scale = loadImage("layout/scale.png");
  }
  /*-----------------------------------End Constructor-----------------------------------*/
  /*-----------------------------------Start Method-----------------------------------*/
  void display() {
    for (int i = 0; i < pressureBar.length; i++) { // Pressure Progress Bar_One - follow the speed value
      pressureBar[i].display(297+i*303, 603+i*303);
      pressureBar[i].outline();
    }
    image(scale, x+nColX*2+27, y+30);
    fill(colors[0]); // #FFF
    textFont(pressStart);
    textSize(10);
    text("A1 Ful A2", x+nColX*2, y+nColY*2-12);
  }
  /*-----------------------------------End Methos-----------------------------------*/
}

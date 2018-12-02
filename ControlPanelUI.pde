class ControlPanelUI {
  /*-----------------------------------Objects-----------------------------------*/
  Frame controlPanelFrame;
  PressureUI pressureUI;
  Slider speedSlider;
  RadialProgressBar radialProgressBar;
  Button[] speedModeButton = new Button[4];
  Button[] lightDoorButton = new Button[2];
  /*-----------------------------------Variables-----------------------------------*/
  int x, y, w, h; // start point position: Left Up Corner of the Frame
  float currentValue; // currentValue from the .......
  int bx, by; // position of buttons

  /*-----------------------------------Start Constructor-----------------------------------*/
  ControlPanelUI(int tx, int ty, int tw, int th) {
    x = tx;
    y = ty;
    w = tw;
    h = th;

    controlPanelFrame = new Frame(x, y, w, h);
    pressureUI = new PressureUI(x+25, y);
    speedSlider = new Slider (x+nColX*3+20, y+33, 11, 112, 0.1);
    radialProgressBar = new RadialProgressBar(x+nColX*4+33, y+nColY+10, 100);
    /*--------------Buttons--------------*/
    for (int i = 0; i < speedModeButton.length; i++) {
      if (i < 3) {
        bx = 70+nColX*7;
        by = y+33+i*40;
      } else {
        bx = nColX*8+55;
        by = y+33+(i*40-120);
      }
      speedModeButton[i] = new Button(bx, by, 70, 20, i, 3);
      if (i == controlPanelButtonArr) speedModeButton[i].toggle = true;
    }

    for (int i = 0; i < lightDoorButton.length; i++) {
      lightDoorButton[i] = new Button(nColX*8+55, y+73+i*40, 70, 20, i, 3);
    }
  }
  /*-----------------------------------End Constructor-----------------------------------*/

  /*-----------------------------------Start Method-----------------------------------*/
  void display() {
    controlPanelFrame.display();
    pressureUI.display(radialProgressBar.currentValue);
    radialProgressBar.display(colorModeSlider.value(), speedSlider.targetValue);
    speedSlider.display(2, 2);
    speedSlider.speedSlider(colorModeSlider.value());
    /*--------------Title--------------*/
    fill(colors[0]); // #FFF
    textFont(pressStart);
    textSize(10);
    text("Control Panel", x+15, y+20);
    /*--------------Message--------------*/
    fill(colors[3], 0);
    stroke(colors[0]);
    rect(x+15, y+30, 180, 115);
    /*--------------Stops--------------*/
    rect(x+15, y+155, nColX*6+70, 35);
    /*--------------Button--------------*/
    for (int i = 0; i < speedModeButton.length; i++) {
      if (controlPanelButtonArr != i)  speedModeButton[i].toggle = false;
      speedModeButton[i].display(4, 8);
      speedModeButton[i].hover();
      speedModeButton[i].pressed();
    }

    for (int i = 0; i < lightDoorButton.length; i++) {
      lightDoorButton[i].display(4, 8);
      lightDoorButton[i].hover();
    }
    /*-----------------------------------End Method-----------------------------------*/
  }
}

class ControlPanelUI {
  /*-----------------------------------Objects-----------------------------------*/
  Frame controlPanelFrame;
  PressureUI pressureUI;
  SpeedSlider speedSlider;




  RadialProgressBar radialProgressBar;
  Button[] speedModeButton = new Button[5];
  /*-----------------------------------Variables-----------------------------------*/
  int x, y, w, h;
  float currentValue;

  /*-----------------------------------Start Constructor-----------------------------------*/
  ControlPanelUI(int tx, int ty, int tw, int th) {
    x = tx;
    y = ty;
    w = tw;
    h = th;

    controlPanelFrame = new Frame(x, y, w, h);
    pressureUI = new PressureUI(x+5,y);
    speedSlider = new SpeedSlider(x+nColX*3, y+33, 17, 102, 0.3);
    radialProgressBar = new RadialProgressBar(x+nColX*4, y+170, 100);


    /*--------------Buttons--------------*/
    for (int i = 0; i < speedModeButton.length; i++) {
      speedModeButton[i] = new Button(385+nColX*4, 530+i*25, 70, 20, i, 3);
      if (i == currentButton3) speedModeButton[i].toggle = true;
    }
  }
  /*-----------------------------------End Constructor-----------------------------------*/

  /*-----------------------------------Start Method-----------------------------------*/
  void display() {
    controlPanelFrame.display();
    pressureUI.display(radialProgressBar.currentValue);



    radialProgressBar.display(colorModeSlider.value(), speedSlider.value());
    speedSlider.display(colorModeSlider.value());
    /*--------------Title--------------*/
    fill(colors[0]); // #FFF
    textFont(pressStart);
    textSize(12);
    text("Control Panel", x+15, y+20);
    /*--------------Message--------------*/
    fill(colors[3], 0);
    stroke(colors[0]);
    rect(x+15, y+30, 160, 115);
    /*--------------Stops--------------*/
    rect(x+15, y+155, nColX*6+70, 35);
    /*--------------Button--------------*/
    for (int i = 0; i < speedModeButton.length; i++) {
      if (currentButton3 != i)  speedModeButton[i].toggle = false;
      speedModeButton[i].display();
      speedModeButton[i].hover();
      speedModeButton[i].pressed();
    }
  }
  /*-----------------------------------End Method-----------------------------------*/
}

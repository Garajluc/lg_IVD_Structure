class ControlPanelUI {
  /*-----------------------------------Objects-----------------------------------*/
  Frame controlPanelFrame;

  ProgressBarPressure[] progressBarPressure = new ProgressBarPressure[2];

  SpeedSlider speedSlider;
  RadialProgressBar radialProgressBar;
  Button[] speedModeButton = new Button[5];
  Button[] controlModeButton = new Button[2];
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
    radialProgressBar = new RadialProgressBar(x+300, y+170, 150);
    speedSlider = new SpeedSlider(x+160, y+45, 30, 125, 0.3);

    /*--------------Pressure Progress Bar--------------*/
    for (int i = 0; i < progressBarPressure.length; i++) {
      progressBarPressure[i] = new ProgressBarPressure(x+i*50, y, 9+i*(-2));
    }

    /*--------------Buttons--------------*/
    for (int i = 0; i < speedModeButton.length; i++) {
      speedModeButton[i] = new Button(385, 530+i*25, 70, 20, i, 3);
      if (i == currentButton3) speedModeButton[i].toggle = true;
    }
    for (int i = 0; i < controlModeButton.length; i++) {
      controlModeButton[i] = new Button(x+45+(i*55), y+nColY*3-50, 50, 30, i, 0);
    }
  }
  /*-----------------------------------End Constructor-----------------------------------*/

  /*-----------------------------------Start Method-----------------------------------*/
  void display() {
    controlPanelFrame.display();

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
    /*--------------Pressure Progress Bar--------------*/
    ///*Pressure Progress Bar_One - follow the speed value*/
    for (int i = 0; i < progressBarPressure.length; i++) {
      progressBarPressure[i].display(radialProgressBar.currentValue);
    }
    /*--------------Button--------------*/
    for (int i = 0; i < speedModeButton.length; i++) {
      if (currentButton3 != i)  speedModeButton[i].toggle = false;
      speedModeButton[i].display();
      speedModeButton[i].hover();
      speedModeButton[i].pressed();
    }
    for (int i = 0; i < controlModeButton.length; i++) {
      controlModeButton[i].display();
      controlModeButton[i].hover();
    }
  }
  /*-----------------------------------End Method-----------------------------------*/
}

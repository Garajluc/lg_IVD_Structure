class ControlPanelUI {
  /*-----------------------------------Objects-----------------------------------*/
  Frame sideBarBottom;
  SpeedSlider speedSlider;
  RadialProgressBar radialProgressBar;
  Button[] speedModeButton = new Button[5];
  Button[] controlModeButton = new Button[2];
  ProgressBarPressure[] progressBarPressure = new ProgressBarPressure[12];
  ProgressBarPressure[] progressBarPressure1 = new ProgressBarPressure[12];
  ProgressBarPressure[] progressBarPressure2 = new ProgressBarPressure[12];
  /*-----------------------------------Variables-----------------------------------*/
  int x, y, w, h;

  /*-----------------------------------Start Constructor-----------------------------------*/
  ControlPanelUI(int tx, int ty, int tw, int th) {
    x = tx;
    y = ty;
    w = tw;
    h = th;

    sideBarBottom = new Frame(x, y, w, h);
    radialProgressBar = new RadialProgressBar(x+300, y+170, 150);
    speedSlider = new SpeedSlider(x+160, y+45, 30, 125, 0.3);

    /*--------------Buttons--------------*/
    for (int i = 0; i < speedModeButton.length; i++) {
      speedModeButton[i] = new Button(385, 530+i*25, 70, 20, i, 3);
      if (i == currentButton3) speedModeButton[i].toggle = true;
    }
    for (int i = 0; i < controlModeButton.length; i++) {
      controlModeButton[i] = new Button(x+45+(i*55), y+nColY*3-50, 50, 30, i, 0);
    } 
    /*--------------Pressure Progress Bar--------------*/
    for (int i = 0; i < progressBarPressure.length; i++) {
      progressBarPressure[i] = new ProgressBarPressure(nColX*8-50, i*10+nColY*7-25);
    }
    for (int i = 0; i < progressBarPressure1.length; i++) {
      progressBarPressure1[i] = new ProgressBarPressure(nColX*8+50, i*10+nColY*7-25);
    }
    for (int i = 0; i < progressBarPressure2.length; i++) {
      progressBarPressure2[i] = new ProgressBarPressure(nColX*8, i*10+nColY*7-25);
    }
  }
  /*-----------------------------------End Constructor-----------------------------------*/

  /*-----------------------------------Start Method-----------------------------------*/
  void display() {
    //sideBarBottom.display(colorModeSlider.value(), "Control Panel");
    radialProgressBar.display(colorModeSlider.value(), speedSlider.value());
    speedSlider.display(colorModeSlider.value());

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

    /*--------------Pressure Progress Bar--------------*/
    /*Pressure Progress Bar_Random*/
    for (int i = 0; i < progressBarPressure.length; i++) {
      progressBarPressure[i].display();
    }
    if (frameCount % (60 * 0.65) == 1) {
      float rn = floor(random(progressBarPressure.length));
      for (int i = 0; i < progressBarPressure.length; i++) {
        if (i<rn) {
          progressBarPressure[i].colorA = 125;
        } else {
          progressBarPressure[i].colorA = lerpColor(progressBarPressure[i].from, progressBarPressure[i].to, (float(i)/(i+5)));
        }
      }
    }
    /*Pressure Progress Bar_One - follow the speed value*/
    for (int i = 0; i < progressBarPressure1.length; i++) {
      progressBarPressure1[i].display();
    }
    if (frameCount % (60 * 0.65) == 1) {
      float rn = 13-map(radialProgressBar.currentValue, 0, 1, 0, 15);
      for (int i = 0; i < progressBarPressure1.length; i++) {
        if (i<rn) {
          progressBarPressure1[i].colorA = 125;
        } else {
          progressBarPressure1[i].colorA = lerpColor(progressBarPressure1[i].from, progressBarPressure1[i].to, (float(i)/(i+5)));
        }
      }
    }
    /*Pressure Progress Bar_Two - follow the speed value*/
    for (int i = 0; i < progressBarPressure2.length; i++) {
      progressBarPressure2[i].display();
    }
    if (frameCount % (60 * 0.65) == 1) {
      float rn = map(radialProgressBar.currentValue, 0, 1, 0, 15);
      for (int i = 0; i < progressBarPressure2.length; i++) {
        if (i<rn) {
          progressBarPressure2[i].colorA = 125;
        } else {
          progressBarPressure2[i].colorA = lerpColor(progressBarPressure2[i].from, progressBarPressure2[i].to, (float(i)/(i+5)));
        }
      }
    }
  }
  /*-----------------------------------End Method-----------------------------------*/
}

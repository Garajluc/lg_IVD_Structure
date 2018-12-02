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

  float xpos = 275;
  float speed;
  float cv;
  float tv;
  float increment = 0.1;

  /*-----------------------------------Start Constructor-----------------------------------*/
  ControlPanelUI(int tx, int ty, int tw, int th) {
    x = tx;
    y = ty;
    w = tw;
    h = th;
    cv = 275;
    tv=275;
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
    radialProgressBar.display(colorModeSlider.a, speedSlider.targetValue);
    speedSlider.display(2, 2);
    speedSlider.speedSlider(colorModeSlider.a);
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
    stops();
    if (controlPanel.speedModeButton[3].initColor == controlPanel.speedModeButton[3].clickedColor) {
      move();
    }
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
  }

  /*bottom stops representation*/
  void stops() {
    rect(x+15, y+155, nColX*6+70, 35);
    line(x+35, y+180, x+nColX*6+60, y+ 180);
    fill(colors[3]);
    ellipse(275, y+180, 10, 10);
    ellipse(432, y+180, 10, 10);
    ellipse(589, y+180, 10, 10);
    ellipse(746, y+180, 10, 10);
    ellipse(903, y+180, 10, 10);
    fill(colors[2]);
    ellipse(cv, y+180, 10, 10);
  }

  /*move the train from one stop to another*/
  void move() {
    // if I press the city circle 
    if (mousePressed) {
      if (mouseX >= 270 && mouseX <= 280 && mouseY >= y+175 && mouseY <= y+185) {
        tv = 275;
      } else if (mouseX >= 427 && mouseX <= 437 && mouseY >= y+175 && mouseY <= y+185) {
        tv=432;
      } else if (mouseX >= 584 && mouseX <= 594 && mouseY >=  y+175 && mouseY <= y+185) {
        tv=590;
      } else if (mouseX >= 741 && mouseX <= 751 && mouseY >=  y+175 && mouseY <= y+185) {
        tv=746;
      } else if (mouseX >= 898 && mouseX <= 908 && mouseY >=  y+175 && mouseY <= y+185) {
        tv=903;
      }
    }

    if ( cv <= tv) {
      cv = cv + increment;
    } 
    if (cv >= tv) {
      cv = cv - increment;
    }
  }
  /*-----------------------------------End Method-----------------------------------*/
}

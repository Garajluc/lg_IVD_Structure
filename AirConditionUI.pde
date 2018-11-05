class AirConditionUI {
  /*-----------------------------------Objects-----------------------------------*/
  Rect sideBarRightBottom;
  Button[] airConditionButton = new Button[5];
  RandomSlider[] airConditionSlider = new RandomSlider[6];
  RandomSlider heatSlider;
  RandomSlider lightSlider;
  
  int x,y; // position
  int w,h; // dimension

  /*-----------------------------------Start Constructor-----------------------------------*/
  AirConditionUI(int tx, int ty, int tw, int th) {
    x = tx;
    y = ty;
    w = tw;
    h = th;
    
    sideBarRightBottom = new Rect(x,y,w,h);
    /*--------------Buttons--------------*/
    for (int i = 0; i < airConditionButton.length; i++) {
      airConditionButton[i] = new Button(x+(i*52)+20, y+nColY*3-50, 52, 30, i, 1);
      if (i == currentButton1) airConditionButton[i].toggle = true;
    }
    /*--------------Sliders--------------*/
    for (int i = 0; i < airConditionSlider.length; i++) {
      airConditionSlider[i] = new RandomSlider(x+80+i*35, nColY*7+30, 5, 50, i*3);
    }
    heatSlider = new RandomSlider(x+80, y+45, nColX*2-20, 5, 2);
    lightSlider = new RandomSlider(x+80, y+70, nColX*2-20, 5, 3.5);
  }
  /*-----------------------------------End Constructor-----------------------------------*/

  /*-----------------------------------Start Method-----------------------------------*/
  void display() {
    sideBarRightBottom.display(colorModeSlider.value(), "Carriage Conditions");
    
    text("Heat:",x+20, y+50);
    text("Light:",x+20, y+80);
    text("Air:",x+20, y+110);
    for (int i = 0; i < airConditionButton.length; i++) {
      if (currentButton1 != i)  airConditionButton[i].toggle = false;
      airConditionButton[i].display();
      airConditionButton[i].hover();
      airConditionButton[i].pressed();
    }
    
    for (int i = 0; i < airConditionSlider.length; i++) {
      airConditionSlider[i].displayAir();
    }
    heatSlider.displayVerticalSlider();
    lightSlider.displayVerticalSlider();
  }
  /*-----------------------------------End Method-----------------------------------*/
}

class CarriageConditionUI {
  /*-----------------------------------Objects-----------------------------------*/
  Frame carriageConditionFrame;
  Button[] airConditionButton = new Button[7];
  //RandomSlider[] airConditionSlider = new RandomSlider[4];
  //RandomSlider[] airConditionSlider1 = new RandomSlider[4];
  //RandomSlider heatSlider;
  Slider lightSlider;

  int x, y; // position
  int w, h; // dimension

  /*-----------------------------------Start Constructor-----------------------------------*/
  CarriageConditionUI(int tx, int ty, int tw, int th) {
    x = tx;
    y = ty;
    w = tw;
    h = th;

    carriageConditionFrame = new Frame(nColX*9+nBorder, nColY*6, nColX*3, nColY*2+40);
    /*--------------Buttons--------------*/
    for (int i = 0; i < airConditionButton.length; i++) {
      airConditionButton[i] = new Button(x+(i*40)+10, y+nColY*2-5, 40, 35, i, 1);
      if (i == carriageConditionButtonArrIndex) airConditionButton[i].toggle = true;
    }
    /*--------------Sliders--------------*/
    //for (int i = 0; i < airConditionSlider.length; i++) {
    //  airConditionSlider[i] = new RandomSlider(x+30+i*30, nColY*7+10, 5, 50, i*3);
    //}
    //for (int i = 0; i < airConditionSlider1.length; i++) {
    //  airConditionSlider1[i] = new RandomSlider(x+180+i*30, nColY*7+10, 5, 50, i*3);
    //}
    //heatSlider = new RandomSlider(x+nColX+20, y+35, nColX*2-80, 5, 2);
    lightSlider = new Slider(x+nColX+20, y+50, 160, 9, 0.5);
  }
  /*-----------------------------------End Constructor-----------------------------------*/

  /*-----------------------------------Start Method-----------------------------------*/
  void display() {
    carriageConditionFrame.display();
    text("Carrigae Condition", x+20, y+20);
    text("Temperatue:", x+20, y+40);
    text("Light:", x+20, y+60);
    text("Air Condition:", x+20, y+80);
    for (int i = 0; i < airConditionButton.length; i++) {
      if (carriageConditionButtonArrIndex != i)  airConditionButton[i].toggle = false;
      airConditionButton[i].display(4, 8);
      airConditionButton[i].hover();
      airConditionButton[i].pressed();
    }

    //for (int i = 0; i < airConditionSlider.length; i++) {
    //  airConditionSlider[i].displayAir();
    //}
    //for (int i = 0; i < airConditionSlider1.length; i++) {
    //  airConditionSlider1[i].displayAir();
    //}

    //heatSlider.displayVerticalSlider();
    lightSlider.display(2,2);
    lightSlider.lightSlider();
  }
  /*-----------------------------------End Method-----------------------------------*/
}

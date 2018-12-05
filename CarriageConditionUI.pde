class CarriageConditionUI {
  /*-----------------------------------Objects-----------------------------------*/
  Frame carriageConditionFrame;

  Slider[] airConditionSliderLeft = new Slider[4];
  Slider[] airConditionSliderRight = new Slider[4];
  Slider heatSlider;
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


    /*--------------Sliders--------------*/
    for (int i = 0; i < airConditionSliderLeft.length; i++) {
      airConditionSliderLeft[i] = new Slider(x+30+i*30, nColY*7+10, 6, 50, 0.4);
    }
    for (int i = 0; i < airConditionSliderRight.length; i++) {
      airConditionSliderRight[i] = new Slider(x+180+i*30, nColY*7+10, 6, 50, 0.4);
    }
    heatSlider = new Slider(x+nColX+20, y+35, 160, 6, 0.5);
    lightSlider = new Slider(x+nColX+20, y+50, 160, 6, 0.5);
  }
  /*-----------------------------------End Constructor-----------------------------------*/

  /*-----------------------------------Start Method-----------------------------------*/
  void display() {
    carriageConditionFrame.display();
    textSize(10);
    fill(colors[0]);
    text("Carrigae Condition", x+20, y+20);
    text("Temperatue:", x+20, y+40);
    text("Light:", x+20, y+60);
    text("Air Condition:", x+20, y+80);

    for (int i = 0; i < airConditionSliderLeft.length; i++) {
      airConditionSliderLeft[i].display(2, 2);
      airConditionSliderLeft[i].verticalSlider();
    }
    for (int i = 0; i < airConditionSliderRight.length; i++) {
      airConditionSliderRight[i].display(2, 2);
      airConditionSliderRight[i].verticalSlider();
    }

    heatSlider.display(2, 2);
    heatSlider.horisontalSlider(0.0002);
    lightSlider.display(2,2);
    lightSlider.horisontalSlider(0);
  }
  /*-----------------------------------End Method-----------------------------------*/
}

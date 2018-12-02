class EngineStatusUI {
  /*-----------------------------------Objects-----------------------------------*/
  Frame engineFrame;
  PImage engineBackground;
  Slider[] engineConditionSliderLeft = new Slider[4];
  Slider[] engineConditionSliderRight = new Slider[4];

  /*-----------------------------------Start Constructor-----------------------------------*/
  EngineStatusUI() {
    engineFrame = new Frame(nBorder, nColY*6, nColX*2, nColY*2+40);
    engineBackground = loadImage ("layout/scale.png");

    /*--------------Random Sliders--------------*/
    for (int i = 0; i < engineConditionSliderLeft.length; i++) {
      engineConditionSliderLeft[i] = new Slider(nBorder+15+i*18, nColY*6+33, 9, 98, i*0.2);
    }
    for (int i = 0; i < engineConditionSliderRight.length; i++) {
      engineConditionSliderRight[i] = new Slider(nColX+60+i*18, nColY*6+33, 9, 98, i*0.3);
    }
  }
  /*-----------------------------------End Constructor-----------------------------------*/

  /*-----------------------------------Start Method-----------------------------------*/
  void display() {
    fill(colors[0]);
    text("Engine", nBorder+15, nColY*6+20);
    engineFrame.display();
    image(engineBackground, nBorder+nColX-6, nColY*6+30);
    stroke(colors[0]);
    rect(nBorder+15, nColY*6+155, nColX*2-30, 35);

    for (int i = 0; i < engineConditionSliderLeft.length; i++) {
      engineConditionSliderLeft[i].display(2,2);
      engineConditionSliderLeft[i].engineSlider(0.001+0.001*i);
    }
    for (int i = 0; i < engineConditionSliderRight.length; i++) {
      engineConditionSliderRight[i].display(2,2);
      engineConditionSliderRight[i].engineSlider(0.001+0.001*i);
    }
  }
  /*-----------------------------------End Method-----------------------------------*/
}

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
    textSize(10);
    text("Engine", nBorder+15, nColY*6+20);
    engineFrame.display();
    image(engineBackground, nBorder+nColX-6, nColY*6+30);
    stroke(colors[0]);
    rect(nBorder+15, nColY*6+155, nColX*2-30, 35);
    
    /*Text under bars*/
    text("AA", nBorder+20, nColY*8-15);
    text("AB", nBorder+56, nColY*8-15);
    text("BB", nBorder+126, nColY*8-15);
    text("BC", nBorder+163, nColY*8-15);
    
    /*Text inside rectangle*/
    fill(colors[1]);
    text("AA", nBorder+20, nColY*8+10);
    text("AB", nBorder+20, nColY*8+25);
    text("BB", nBorder+100, nColY*8+10);
    text("BC", nBorder+100, nColY*8+25);
    
    fill(colors[0]);
    text(nf(int(engineConditionSliderLeft[0].currentValue*100),4), nBorder+50, nColY*8+10);
    text(nf(int(engineConditionSliderLeft[3].currentValue*100),4), nBorder+50, nColY*8+25);
    text(nf(int(engineConditionSliderRight[1].currentValue*100),4), nBorder+130, nColY*8+10);
    text(nf(int(engineConditionSliderRight[3].currentValue*100),4), nBorder+130, nColY*8+25);

    for (int i = 0; i < engineConditionSliderLeft.length; i++) {
      engineConditionSliderLeft[i].display(2, 2);
      engineConditionSliderLeft[i].engineSlider(0.5+2*i,0.001);
    }
    for (int i = 0; i < engineConditionSliderRight.length; i++) {
      engineConditionSliderRight[i].display(2, 2);
      engineConditionSliderRight[i].engineSlider(0.2*i,0.001);
    }
  }
  /*-----------------------------------End Method-----------------------------------*/
}

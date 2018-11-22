class EngineStatusUI {
  /*-----------------------------------Objects-----------------------------------*/
  Rect sideBarLeftBottom;
  RandomSlider[] engineConditionSlider0 = new RandomSlider[4];
  RandomSlider[] engineConditionSlider1 = new RandomSlider[4];

  /*-----------------------------------Start Constructor-----------------------------------*/
  EngineStatusUI() {
    sideBarLeftBottom = new Rect(nBorder, nColY*6, nColX*3, nColY*3);
    
    /*--------------Random Sliders--------------*/
    for (int i = 0; i < engineConditionSlider0.length; i++) {
      engineConditionSlider0[i] = new RandomSlider(nBorder+20+i*30, nColY*6+30, 15, 130, i*2);
    }
    for (int i = 0; i < engineConditionSlider1.length; i++) {
      engineConditionSlider1[i] = new RandomSlider(nColX*2+13+i*30, nColY*6+30, 15, 130, i*3);
    }
  }
  /*-----------------------------------End Constructor-----------------------------------*/
  
  /*-----------------------------------Start Method-----------------------------------*/
  void display() {
    //sideBarLeftBottom.display(colorModeSlider.value(), "Engine Status");

    for (int i = 0; i < engineConditionSlider0.length; i++) {
      engineConditionSlider0[i].displayEngine();
    }
    for (int i = 0; i < engineConditionSlider1.length; i++) {
      engineConditionSlider1[i].displayEngine();
    }
    
    // I am going to replace it with image
    strokeWeight(1);
    stroke(255);
    line(nColX*2-10, nColY*8, nColX*2-10, nColY*6+50);
    
    line(nColX*2-20, nColY*8,nColX*2, nColY*8);
    line(nColX*2-15, nColY*8-10,nColX*2-5, nColY*8-10);
    line(nColX*2-15, nColY*8-20,nColX*2-5, nColY*8-20);
    line(nColX*2-15, nColY*8-30,nColX*2-5, nColY*8-30);
    line(nColX*2-15, nColY*8-40,nColX*2-5, nColY*8-40);
    line(nColX*2-20, nColY*8-50,nColX*2, nColY*8-50);
    line(nColX*2-15, nColY*8-60,nColX*2-5, nColY*8-60);
    line(nColX*2-15, nColY*8-70,nColX*2-5, nColY*8-70);
    line(nColX*2-15, nColY*8-80,nColX*2-5, nColY*8-80);
    line(nColX*2-15, nColY*8-90,nColX*2-5, nColY*8-90);
    line(nColX*2-20, nColY*8-100,nColX*2, nColY*8-100);

    noStroke();
  }
  /*-----------------------------------End Method-----------------------------------*/
}

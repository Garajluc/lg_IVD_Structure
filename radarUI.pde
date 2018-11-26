class radarUI {
  /*-----------------------------------Objects-----------------------------------*/
  Frame radarFrame;
  radarPulse[] arPulse = new radarPulse[1];
  radarTarget[] target1 = new radarTarget[2];
  radarTarget[] target2 = new radarTarget[2];
  PImage radarBackground;

  /*-----------------------------------Variables-----------------------------------*/
  int x = nBorder + nColX; // X center of image and pulses
  int y = nColY*2+20; // Y center of image and pulses
  int r = 60; // diameter of ellipse when the next one is displayed

  /*-----------------------------------Start Constructor-----------------------------------*/
  radarUI() {
    radarFrame = new Frame(nBorder, nColY, nColX*2, nColY*3-40);
    radarBackground = loadImage ("layout/radar.png");
    for (int i = 0; i < arPulse.length; i++) {
      arPulse[i] = new radarPulse(x, y, i * r);
    }
    
    for (int i = 0; i < target1.length; i++) {
      target1[i] = new radarTarget(x,y);
    }
    for (int i = 0; i < target2.length; i++) {
      target2[i] = new radarTarget(x,y);
    }
  }
  /*-----------------------------------End Constructor-----------------------------------*/

  /*-----------------------------------Start Method-----------------------------------*/
  void  display() {
    radarFrame.display();
    imageMode(CENTER);
    image(radarBackground, x, y);
    imageMode(CORNER);

    for (int i=0; i < arPulse.length; i++) {
      arPulse[i].display();
    }
    
    for(int i =0; i < target1.length; i++) {
      target1[i].display(arPulse[0].diameter, 5, 20+i*8, 20-i*15);
    }
    for(int i =0; i < target2.length; i++) {
      target2[i].display(arPulse[0].diameter, 5, 25-i*12, 15-i*3);
    }
  }
  /*-----------------------------------Start Method-----------------------------------*/
}

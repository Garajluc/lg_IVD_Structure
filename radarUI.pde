class radarUI {
  /*-----------------------------------Objects-----------------------------------*/
  Frame radarFrame;
  radarPulse[] arPulse = new radarPulse[1];
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


    float g = arPulse[0].diameter;
    float k = map(g, 0, 120, 0, 255);
    
    // vypocet r
    int o = 20;
    int a = 20;
    float tang = atan(20/20);
    float h = o/sin(tang);

    if (g/2 > int(h)-5) {
      noStroke();
      fill(255, 255-k);
      ellipse(x+20, y+20, 10, 10);
    }
  }
  /*-----------------------------------Start Method-----------------------------------*/
}

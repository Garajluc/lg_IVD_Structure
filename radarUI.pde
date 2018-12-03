class radarUI {
  /*-----------------------------------Objects-----------------------------------*/
  Frame radarFrame;
  radarPulse[] arPulse = new radarPulse[1];
  radarTarget[] target1 = new radarTarget[2];
  radarTarget[] target2 = new radarTarget[2];
  PImage radarBackground;
  PImage arrowRadar;
  Slider sliderLeft[] = new Slider[4];
  Slider sliderDown[] = new Slider[4];

  /*-----------------------------------Variables-----------------------------------*/
  int x, y, w, h; // center position of image and pulses
  float r; // diameter of ellipse when the next one is displayed
  float xoff = 0.0; // arrow rotation: increasing value
  float an = 0; // line rotation: increasing value
  float n;
  
  float xx;

  /*-----------------------------------Start Constructor-----------------------------------*/
  radarUI(int tx, int ty, int tw, int th, float tr) {
    x = tx;
    y = ty;
    w = tw;
    h = th;
    r = tr;
    radarFrame = new Frame(x, y, w, h);
    radarBackground = loadImage ("layout/radar.png");
    arrowRadar = loadImage("layout/arrow_radar.png");
    for (int i = 0; i < arPulse.length; i++) {
      arPulse[i] = new radarPulse(x+w/2, y+h/2, i * r);
    }

    for (int i = 0; i < target1.length; i++) {
      target1[i] = new radarTarget(x+w/2, y+h/2);
    }
    for (int i = 0; i < target2.length; i++) {
      target2[i] = new radarTarget(x+w/2, y+h/2);
    }

    for (int i = 0; i < sliderLeft.length; i++) {
      sliderLeft[i] = new Slider(x+15, y+15+i*7, 20, 4, 0.3*i);
    }
    for (int i = 0; i < sliderDown.length; i++) {
      sliderDown[i] = new Slider(x+160+i*7, nColY*2+y+25, 4, 20, 0.3*i);
    }
  }
  /*-----------------------------------End Constructor-----------------------------------*/

  /*-----------------------------------Start Method-----------------------------------*/
  void  display() {
    radarFrame.display();
    imageMode(CENTER);
    image(radarBackground, x+w/2, y+h/2);
    imageMode(CORNER);

    for (int i=0; i < arPulse.length; i++) {
      arPulse[i].display();
    }
    for (int i =0; i < target1.length; i++) {
      target1[i].display(arPulse[0].diameter, 5, 20+i*8, 20-i*15);
    }
    for (int i =0; i < target2.length; i++) {
      target2[i].display(arPulse[0].diameter, 5, 25-i*12, 15-i*3);
    }
    arrow(); // yellow arrow 
    lineRot(); // rotating line
    slider();
  }

  void arrow() {
    pushMatrix();
    translate(nBorder+nColX, nColY+nColY+20);
    if (controlPanel.increment > 0) {
      xoff = xoff + .0005;
      n = noise(xoff) * 10;
    }
    rotate(n);
    image (arrowRadar, 0, 0);
    popMatrix();
  }

  void lineRot() {
    an+=0.01;
    stroke(colors[0]);
    line(nBorder + nColX, nColY*2+20, nBorder + nColX+cos(an)*r, nColY*2+20+sin(an)*r);
  }

  void slider() {
    for (int i =0; i < sliderLeft.length; i++) {
      sliderLeft[i].randomSlider();
    }
    for (int i =0; i < sliderDown.length; i++) {
      sliderDown[i].randomSlider();
    }
  }
  /*-----------------------------------Start Method-----------------------------------*/
}

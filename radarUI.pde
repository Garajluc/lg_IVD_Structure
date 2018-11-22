// Reference: Week6 "jr_IVD_radarPulse_remix.zip"
class radarUI {
  Rect sideBarLeftUp;
  radarPulse[] arPulse = new radarPulse[5];
  radarTarget[] arTargets = new radarTarget[5];

  int x;
  int y;
  int w;
  int h;

  radarUI(int tx, int ty, int tw, int th) {
    x = tx;
    y = ty;
    w = tw;
    h = th;
    // Outlines of the radar window
    sideBarLeftUp = new Rect(nBorder, nColY, nColX*2, nColY*3-40);

    for (int i = 0; i < arPulse.length; i++) {
      arPulse[i] = new radarPulse(w/2+x, h/2+y, i * 50);
    }
    for (int i = 0; i < arTargets.length; i++) {
      arTargets[i] = new radarTarget(w/2+x, h/2+y, 3);
    }
  }

  void display() {
    sideBarLeftUp.display(colorModeSlider.value(), "Radar");
    
    for (int i=0; i < arPulse.length; i++) {
      arPulse[i].display();
    }
    for (int i=0; i < arTargets.length; i++) {
      arTargets[i].display();
    }
    noFill();
  }
}

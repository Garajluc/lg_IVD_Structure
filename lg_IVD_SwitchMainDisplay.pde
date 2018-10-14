class SwitchMainDisplay {
  int nCurrentScreen;
  int nColX = 100;
  int nColY = 80;
  int x;
  int y;
  int w;
  int h;
  int alpha = 1;

  SwitchMainDisplay(int tx, int ty, int tw, int th) {
    x = tx;
    y = ty;
    w = tw;
    h = th;
  }
/*Switch by Clicking in Area*/ 
  void display() {
    switch(nCurrentScreen) {
      case 0: drawScreenZero(); break;
      case 1: drawScreenOne(); break;
      case 2: drawScreenTwo(); break;
    }
  }
  
  void drawScreenZero() {
    fill(255,0,0);
    rect(x,y,w,h);
  }
  void drawScreenOne() {
    fill(0,255,0);
    rect(x,y,w,h);
  }
  void drawScreenTwo() {
    fill(0,0,255);
    rect(x,y,w,h);
  }
  
    void switchScreen() {
    nCurrentScreen++;
    if(nCurrentScreen > 2) {
      nCurrentScreen = 0;
    }
  }

/*Switch by Clicking on Button*/
  void screenZero() {
    nCurrentScreen = 0;
  }
  
  void screenOne() {
    nCurrentScreen = 1;
  }
  
    void screenTwo() {
    nCurrentScreen = 2;
  }
}

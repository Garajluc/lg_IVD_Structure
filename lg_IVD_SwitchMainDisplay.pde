class SwitchMainDisplay {
  int nCurrentScreen;
  //int nColX = 100;
  //int nColY = 80;
  int x;
  int y;
  int w;
  int h;
  //int alpha = 1;
  PImage image1; 
  PImage image2;
  PImage image3;

  SwitchMainDisplay(int tx, int ty, int tw, int th, PImage timage1, PImage timage2, PImage timage3) {
    x = tx;
    y = ty;
    w = tw;
    h = th;
    image1 = timage1;
    image2 = timage2;
    image3 = timage3;
  }
  
  /*Switch by Clicking in Area*/
  void display() {
    switch(nCurrentScreen) {
    case 0: 
      drawScreenZero(); 
      break;
    case 1: 
      drawScreenOne(); 
      break;
    case 2: 
      drawScreenTwo(); 
      break;
    }
  }

  void drawScreenZero() {
    image(image1,x+1,y,w,h);
  }

  void drawScreenOne() {
    image(image2,x+1,y,w,h);
  }
  void drawScreenTwo() {
    image(image3,x+1,y,w,h);
  }

  void switchScreen() {
    nCurrentScreen++;
    if (nCurrentScreen > 2) {
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

PImage camera;
PImage location;
PImage wind;
PImage wave;
PImage text;
PImage flow;

class MainDisplayUI {
  /*-----------------------------------Objects-----------------------------------*/
  Frame mainDisplayHeader;
  Frame mainDiplayUpFrame;
  SwitchMainDisplay switchMainDisplayBottom;
  SwitchMainDisplay switchMainDisplayTop;
  Button[] mainDisplayButton = new Button[3];

  /*-----------------------------------Start Constructor-----------------------------------*/
  MainDisplayUI() {
    camera = loadImage("camera.jpg");
    location = loadImage("location.png");
    wind = loadImage("wind_map.png");
    wave = loadImage("wave.jpg");
    text = loadImage("text.jpg");
    flow = loadImage("flow.jpg");

    mainDisplayHeader = new Frame(nColX*2+nBorder, nColY/2, nColX*7, nColY/2);
    mainDiplayUpFrame = new Frame(nColX*2+nBorder, nColY, nColX*7, nColY*3+40);
    
    switchMainDisplayTop = new SwitchMainDisplay(nColX*3+40+15, 50, nColX*6-30, nColY*3+20, location, wind, camera);
    switchMainDisplayBottom = new SwitchMainDisplay(nColX*3+55, nColY*4+20, nColX*6-30, nColY*2-40, wave, text, flow);

    /*--------------Buttons--------------*/
    for (int i = 0; i < mainDisplayButton.length; i++) {
      mainDisplayButton[i] = new Button((nColX*6+nBorder+50)+i*80, nColY*6, 75, 20, i, 2);
      if (i == currentButton2) mainDisplayButton[i].toggle = true;
    }
  }
  /*-----------------------------------End Constructor-----------------------------------*/

  /*-----------------------------------Start Method-----------------------------------*/
  void display() {
    mainDisplayHeader.display();
    mainDiplayUpFrame.display();
    
    switchMainDisplayBottom.display();
    switchMainDisplayTop.display();
    if (mousePressed) {
      /*Switch Image Main Display*/
      if (mouseX >= nColX*6+nBorder+50 && 
        mouseX <= nColX*6+nBorder+50+75 && 
        mouseY >= nColY*6 && 
        mouseY <= nColY*6+20) {
        switchMainDisplayTop.screenZero();
      } else if (mouseX >= nColX*6+nBorder+50+80 && 
        mouseX <= nColX*6+nBorder+50+80+75 && 
        mouseY >=nColY*6 && 
        mouseY <= nColY*6+20) {
        switchMainDisplayTop.screenOne();
      } else if (mouseX >= nColX*6+nBorder+50+160 && 
        mouseX <= nColX*6+nBorder+50+160+75 && 
        mouseY >= nColY*6 && 
        mouseY <= nColY*6+20) {
        switchMainDisplayTop.screenTwo();
      }
    }
    /*Main Display Buttons*/
    for (int i = 0; i < mainDisplayButton.length; i++) {
      if (currentButton2 != i)  mainDisplayButton[i].toggle = false;
      mainDisplayButton[i].display();
      mainDisplayButton[i].hover();
      mainDisplayButton[i].pressed();
    }

    // lines over mouse on main display
    if (mouseX >  nColX*3+55 && 
      mouseX <  nColX*3+25+nColX*6 && 
      mouseY > 50 && mouseY < nColY*4-40) {
      strokeWeight(1);
      stroke(100, 0, 200);
      line(mouseX, 50, mouseX, nColY*4-40);
      line(nColX*3+55, mouseY, nColX*3+25+nColX*6, mouseY);
      rectMode(CENTER);
      fill(100, 0, 200, 100);
      rect(mouseX, mouseY, 20, 20);
      rectMode(CORNER);
      noStroke();
    }
  }

  void switchBottomDisplay() {
    if (mouseX >= nColX*3+55 && mouseX <= nColX*3+55+nColX*6-30 && 
      mouseY >= nColY*4+20 && mouseY <= nColY*4+20+nColY*2-40) {
      switchMainDisplayBottom.switchScreen();
    }
  }
  /*-----------------------------------End Method-----------------------------------*/
}

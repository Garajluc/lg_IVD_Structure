PImage camera;
PImage location;
PImage wind;
PImage wave;
PImage text;
PImage flow;
int x = nColX*2+nBorder;
int y = nColY;
int w = nColX*7;
PImage mouse;

class MainDisplayUI {
  /*-----------------------------------Objects-----------------------------------*/
  Frame mainDisplayHeader;
  Frame mainDiplayUpFrame;
  Frame mainDisplayBottom;

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

    mouse = loadImage("layout/mouse.png");

    switchMainDisplayTop = new SwitchMainDisplay(x, y, w, nColY*3+40, location, wind, camera);
    switchMainDisplayBottom = new SwitchMainDisplay(x, y*4+40, w, nColY+40, wave, text, flow);

    mainDisplayHeader = new Frame(nColX*2+nBorder, nColY/2, nColX*7, nColY/2);
    mainDiplayUpFrame = new Frame(nColX*2+nBorder, nColY, nColX*7, nColY*3+40);
    mainDisplayBottom = new Frame(nColX*2+nBorder, nColY*4+40, nColX*7, nColY+40);

    /*--------------Buttons--------------*/
    for (int i = 0; i < mainDisplayButton.length; i++) {
      mainDisplayButton[i] = new Button(x+i*80, y*4+20, 75, 20, i, 2);
      if (i == mainDisplayButtonArr) mainDisplayButton[i].toggle = true;
    }
  }
  /*-----------------------------------End Constructor-----------------------------------*/

  /*-----------------------------------Start Method-----------------------------------*/
  void display() {
    //switchMainDisplayBottom.display();
    switchMainDisplayTop.display();

    /*Main Display Buttons*/
    for (int i = 0; i < mainDisplayButton.length; i++) {
      if (mainDisplayButtonArr != i)  mainDisplayButton[i].toggle = false;
      mainDisplayButton[i].display(4, 8);
      mainDisplayButton[i].hover();
      mainDisplayButton[i].pressed();
    }

    if (mousePressed) {
      /*Switch Image Main Display*/
      if (mainDisplayButton[0].initColor == mainDisplayButton[0].clickedColor) {
        switchMainDisplayTop.screenZero();
      } else if (mainDisplayButton[1].initColor == mainDisplayButton[0].clickedColor) {
        switchMainDisplayTop.screenOne();
      } else if (mainDisplayButton[2].initColor == mainDisplayButton[0].clickedColor) {
        switchMainDisplayTop.screenTwo();
      }
    }

    // lines over mouse on main display
    if (mouseX >  x && 
      mouseX <  x+w && 
      mouseY > y && mouseY < y+nColY*3+40) {
      imageMode(CENTER);
      image(mouse, mouseX, mouseY);
      imageMode(CORNER);
    }

    mainDisplayHeader.display();
    mainDisplayHeader.title("Main Display");
    mainDiplayUpFrame.display();
  }

  //void switchBottomDisplay() {
  //  if (mouseX >= x && mouseX <= x+w && 
  //    mouseY >= y*4+40 && mouseY <= y*4+40+nColY+40) {
  //    switchMainDisplayBottom.switchScreen();
  //  }
  //}
  /*-----------------------------------End Method-----------------------------------*/
}

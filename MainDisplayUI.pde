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

boolean pressed = true;
boolean mouseDown = false;

class MainDisplayUI {
  /*-----------------------------------Objects-----------------------------------*/
  Frame mainDisplayHeader;
  Frame mainDiplayUpFrame;
  Frame mainDisplayBottom;
  Earthquake earthquake;
  ScrollingText scrollingText;

  Button[] mainDisplayButton = new Button[3];

  /*-----------------------------------Start Constructor-----------------------------------*/
  MainDisplayUI() {

    mainDisplayHeader = new Frame(nColX*2+nBorder, nColY/2, nColX*7, nColY/2);
    mainDiplayUpFrame = new Frame(nColX*2+nBorder, nColY, nColX*7, nColY*3+40);
    mainDisplayBottom = new Frame(nColX*2+nBorder, nColY*4+40, nColX*7, nColY+40);
    mouse = loadImage("layout/mouse.png");
    earthquake = new Earthquake();
    scrollingText = new ScrollingText();

    /*--------------Buttons--------------*/
    for (int i = 0; i < mainDisplayButton.length; i++) {
      mainDisplayButton[i] = new Button(x+i*80, y*4+20, 75, 20, i, 2);
      if (i == mainDisplayButtonArr) mainDisplayButton[i].toggle = true;
    }
  }
  /*-----------------------------------End Constructor-----------------------------------*/

  /*-----------------------------------Start Method-----------------------------------*/
  void display() {
    /*Main Display Buttons*/
    for (int i = 0; i < mainDisplayButton.length; i++) {
      if (mainDisplayButtonArr != i)  mainDisplayButton[i].toggle = false;
      mainDisplayButton[i].display(4, 8);
      mainDisplayButton[i].hover();
      mainDisplayButton[i].pressed();
    }


    /*Switch Image Main Display*/
    if (mainDisplayButton[0].initColor == mainDisplayButton[0].clickedColor) {
      earthquake.display();
      scrollingText.display(nColX*7+40, nColY*3, 50);
    } else if (mainDisplayButton[1].initColor == mainDisplayButton[0].clickedColor) {
    } else if (mainDisplayButton[2].initColor == mainDisplayButton[0].clickedColor) {
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



    if (mouseX >  0 && 
      mouseX <  100 && 
      mouseY > 0 && mouseY < 100) { // if I click Edinburgh
      if (mousePressed && !mouseDown) {
        pressed = !pressed;
        mouseDown = true;
      } else if (!mousePressed) {
        mouseDown = false;
      }
    }
    if (pressed) {
      fill(colors[0]);
      rect(10, 10, 200, 20);
    }
  }
  /*-----------------------------------End Method-----------------------------------*/
}

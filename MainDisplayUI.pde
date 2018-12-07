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
  Sphere sphere;
  ScrollingText scrollingText;
  Slider[] sliderRotation = new Slider[2];

  Button[] mainDisplayButton = new Button[3];

  /*-----------------------------------Start Constructor-----------------------------------*/
  MainDisplayUI() {

    mainDisplayHeader = new Frame(nColX*2+nBorder, nColY/2, nColX*7, nColY/2);
    mainDiplayUpFrame = new Frame(nColX*2+nBorder, nColY, nColX*7, nColY*3+40);
    mainDisplayBottom = new Frame(nColX*2+nBorder, nColY*4+40, nColX*7, nColY+40);
    mouse = loadImage("layout/mouse.png");
    earthquake = new Earthquake();
    sphere = new Sphere();
    scrollingText = new ScrollingText();

    /*--------------Buttons--------------*/
    for (int i = 0; i < mainDisplayButton.length; i++) {
      mainDisplayButton[i] = new Button(x+i*80, y*4+20, 75, 20, i, 2);
      if (i == mainDisplayButtonArr) mainDisplayButton[i].toggle = true;
    }
    /*--------------Sliders--------------*/
    for (int i = 0; i < sliderRotation.length; i++) {
      sliderRotation[i] = new Slider(nColX*2+60, nColY+20+i*18, 112, 11, 0.4);
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
      scrollingText.display(nColX*8+60, nColY-20, 50);
      // lines over mouse on main display
      if (mouseX >  x && 
        mouseX <  x+w && 
        mouseY > y && mouseY < y+nColY*3+40) {
        imageMode(CENTER);
        image(mouse, mouseX, mouseY);
        imageMode(CORNER);
      }
    } else if (mainDisplayButton[1].initColor == mainDisplayButton[1].clickedColor) {
      for (int i = 0; i < sliderRotation.length; i++) {
        sliderRotation[i].display(2, 2);
        sliderRotation[i].horisontalSlider(0);
      }
    } else if (mainDisplayButton[2].initColor == mainDisplayButton[0].clickedColor) {
    }

    //// lines over mouse on main display
    //if (mouseX >  x && 
    //  mouseX <  x+w && 
    //  mouseY > y && mouseY < y+nColY*3+40) {
    //  imageMode(CENTER);
    //  image(mouse, mouseX, mouseY);
    //  imageMode(CORNER);
    //}

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

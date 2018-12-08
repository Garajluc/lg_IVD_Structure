/*-----------------------------------Objects-----------------------------------*/
PImage camera;
PImage location;
PImage wind;
PImage wave;
PImage text;
PImage flow;
PImage mouse;
/*-----------------------------------Variables-----------------------------------*/
int x = nColX*2+nBorder;
int y = nColY;
int w = nColX*7;
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
  MainDisplayUI(PApplet pa) {

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
        textSize(10);
        fill(colors[0]);
        float degreesX = map(sphere.angleX, 0, 5, 360, 0);
        float degreesY = map(sphere.angleY, 0, 5, 360, 0);
        text("X: " + int(nf(degreesX, 0, 0)) + "deg", nColX*2+60, nColY*2);
        text("Y: " + int(nf(degreesY, 0, 0)) + "deg", nColX*2+60, nColY*2 +20);
      }
    } else if (mainDisplay.mainDisplayButton[2].initColor == mainDisplay.mainDisplayButton[2].clickedColor) {
      if (!pressed) {
        image(trainTimelaps, nColX*2+nBorder, nColY, nColX*7, nColY*3+40); // full screen
        if (controlPanel.increment > 0) {
          trainTimelaps.loop();
          trainTimelaps.speed(0.5);
        } else if (controlPanel.increment <= 0) {
          trainTimelaps.pause();
        }
        image(insideTrain, nColX*6+nBorder+70, nColY+nColY*1+90, nColX*3-90, nColY*1+10);
        insideTrain.loop();
      } else if (pressed) {      
        image(insideTrain, nColX*2+nBorder, nColY, nColX*7, nColY*3+40); // full screen
        insideTrain.loop();
        image(trainTimelaps, nColX*6+nBorder+70, nColY+nColY*1+90, nColX*3-90, nColY*1+10);
        if (controlPanel.increment > 0) {
          trainTimelaps.loop();
          trainTimelaps.speed(0.5);
        } else if (controlPanel.increment <= 0) {
          trainTimelaps.pause();
        }
      }
    }

    /*Main Display Buttons*/
    for (int i = 0; i < mainDisplayButton.length; i++) {
      if (mainDisplayButtonArr != i)  mainDisplayButton[i].toggle = false;
      mainDisplayButton[i].display(4, 8);
      mainDisplayButton[i].hover();
      mainDisplayButton[i].pressed();
    }

    mainDisplayHeader.display();
    mainDisplayHeader.title("Main Display");
    mainDiplayUpFrame.display();

    if (mouseX >  nColX*6+nBorder+70 && 
      mouseX <  nColX*6+nBorder+70 +  nColX*3-90 && 
      mouseY > nColY+nColY*1+90 && mouseY < nColY+nColY*1+90 + nColY*1+10) { // if I click Edinburgh
      if (mousePressed && !mouseDown) {
        pressed = !pressed;
        mouseDown = true;
      } else if (!mousePressed) {
        mouseDown = false;
      }
    }
  }
  /*-----------------------------------End Method-----------------------------------*/
}

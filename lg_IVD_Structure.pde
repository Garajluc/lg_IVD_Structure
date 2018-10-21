/*-----------------------------------Start Objects-----------------------------------*/
/*Grid*/
Rect sideBarLeft;
Rect sideBarRight;
Rect sideBarBottom;
Rect mainDisplay;
/*Buttons*/
Button[] arBtn = new Button[6];
Button[] vagonBtn = new Button[6];
Button[] mainDisplayButton = new Button[3];
Button[] modesButton = new Button[5];
/*Text*/
ModesText[] modesText = new ModesText[5];
/*Main Screen*/
SwitchMainDisplay switchMainDisplayBottom;
SwitchMainDisplay switchMainDisplayTop;
/*Radiap Progress Bar*/
RadialProgressBar radialProgressBar;
/*Speed Slider*/
SpeedSlider speedSlider;
/*Pressure Progress Bar*/
ProgressBarPressure[] progressBarPressure = new ProgressBarPressure[15];
ProgressBarPressure[] progressBarPressure1 = new ProgressBarPressure[15];
ProgressBarPressure[] progressBarPressure2 = new ProgressBarPressure[15];
/*Digital Clock*/
DigitalClock digitalClock;
/*Color Mode Slider*/
ColorModeSlider colorModeSlider;
/*-----------------------------------End Objects-----------------------------------*/

/*------Global Variables------*/
int nBorder = 40; // 2*40=80
int nColX = 100; // 12*100=1200
int nColY = 80; // 9*80=720
float modesButtonIndex;

/*-----------------------------------Start Setup-----------------------------------*/
void setup() {
  size(1280, 720);

  /*------Initiate the objects------*/
  /*Layout*/
  sideBarLeft = new Rect(nBorder, 0, nColX*3, nColY*9);
  sideBarRight = new Rect(nColX*9+nBorder, 0, nColX*3, nColY*9);
  mainDisplay = new Rect(nColX*3+nBorder, 0, nColX*6, nColY*6);
  sideBarBottom = new Rect(nColX*3+nBorder, nColY*6, nColX*6, nColY*3);
  /*Buttons*/
  for (int i = 0; i < arBtn.length; i++) {
    arBtn[i] = new Button(nBorder+(i*50), nColY*9-50, 50, 20);
  } 
  for (int i = 0; i < vagonBtn.length; i++) {
    vagonBtn[i] = new Button(nColX*9+nBorder+(i*50), nColY*9-50, 50, 20);
  }
  for (int i = 0; i < mainDisplayButton.length; i++) {
    mainDisplayButton[i] = new Button((nColX*3+nBorder)+i*80, nColY*6-20, 75, 20);
  }
  for (int i = 0; i < modesButton.length; i++) {
    modesButton[i] = new Button(nColX*4-15, nColY*7+i*30-30, 70, 25);
  }
  /*Text*/
  for (int i = 0; i < modesText.length; i++) {
    modesText[i] = new ModesText(nColX*4-5, nColY*7+i*30-10);
  }
  /*Swicth Main Screen*/
  switchMainDisplayBottom = new SwitchMainDisplay(0, nColY*4, nColX*6, nColY*2-20);
  switchMainDisplayTop = new SwitchMainDisplay(0, 0, nColX*6, nColY*4);
  /*Radial Progress Bar*/
  radialProgressBar = new RadialProgressBar(nColX*6+nBorder, nColY*7+40, 150);
  /*Speed Slider*/
  speedSlider = new SpeedSlider(nColX*5, nColY*6+45, 30, 150, 0.3);
  /*Pressure Progress Bar*/
  for (int i = 0; i < progressBarPressure.length; i++) {
    progressBarPressure[i] = new ProgressBarPressure(nColX*8-50, i*10+nColY*7-30);
  }
  for (int i = 0; i < progressBarPressure1.length; i++) {
    progressBarPressure1[i] = new ProgressBarPressure(nColX*8+50, i*10+nColY*7-30);
  }
  for (int i = 0; i < progressBarPressure2.length; i++) {
    progressBarPressure2[i] = new ProgressBarPressure(nColX*8, i*10+nColY*7-30);
  }
  /*Digital Clock*/
  digitalClock = new DigitalClock();
  /*Color Mode Slider*/
  colorModeSlider = new ColorModeSlider();
}
/*-----------------------------------End Setup-----------------------------------*/

/*-----------------------------------Start Draw Loop-----------------------------------*/
void draw() {  
  background(colorModeSlider.value());

  /*Background*/
  pointGrid(5, 5, 28, 28, 2, 209, 219, 189, 120);
  pointGrid(9, 6, 28, 28, 1, 252, 255, 245, 80);
  /*------Objects------*/
  /*Structure*/
  sideBarLeft.display(colorModeSlider.value());
  sideBarRight.display(colorModeSlider.value());
  sideBarBottom.display(colorModeSlider.value());
  mainDisplay.display(colorModeSlider.value());

  /*Buttons*/
  for (int i = 0; i < arBtn.length; i++) {
    arBtn[i].display();
    arBtn[i].hover();
  }
  for (int i = 0; i < vagonBtn.length; i++) {
    vagonBtn[i].display();
    vagonBtn[i].hover();
  }
  for (int i = 0; i < modesButton.length; i++) {
    modesButton[i].display();
    modesButton[i].hover();
    // get the specifi index of clicked rectangle
    if (mousePressed) {
      if (mouseX > nColX*4-15 && mouseX < nColX*4-15+70 && 
        mouseY > nColY*7+i*30-30 && mouseY < nColY*7+i*30-30+25) {
        modesButtonIndex = i;
      }
    }
  }

  /*Text*/
  for (int i = 0; i < modesText.length; i++) {
    modesText[i].display(i+1);
  }

  /*Speed Slider*/
  speedSlider.display(colorModeSlider.value(), modesButtonIndex);

  /*Pressure Progress Bar*/
  for (int i = 0; i < progressBarPressure.length; i++) {
    progressBarPressure[i].display();
  }
  if (frameCount % (60 * 0.65) == 1) {
    float rn = floor(random(progressBarPressure.length));
    for (int i = 0; i < progressBarPressure.length; i++) {
      if (i<rn) {
        progressBarPressure[i].colorA = 125;
      } else {
        color to = color (232, 255, 62);
        color from = color (255, 62, 143);
        progressBarPressure[i].colorA = lerpColor(from, to, (float(i)/(i+10)));
      }
    }
  }
  for (int i = 0; i < progressBarPressure1.length; i++) {
    progressBarPressure1[i].display();
  }
  if (frameCount % (60 * 0.65) == 1) {
    float rn = 13-map(speedSlider.value(), 0, 1, 0, 15);
    for (int i = 0; i < progressBarPressure1.length; i++) {
      if (i<rn) {
        progressBarPressure1[i].colorA = 125;
      } else {
        color to = color (232, 255, 62);
        color from = color (255, 62, 143);
        progressBarPressure1[i].colorA = lerpColor(from, to, (float(i)/(i+10)));
      }
    }
  }
  for (int i = 0; i < progressBarPressure2.length; i++) {
    progressBarPressure2[i].display();
  }
  if (frameCount % (60 * 0.65) == 1) {
    float rn = map(speedSlider.value(), 0, 1, 0, 15);
    for (int i = 0; i < progressBarPressure2.length; i++) {
      if (i<rn) {
        progressBarPressure2[i].colorA = 125;
      } else {
        color to = color (232, 255, 62);
        color from = color (255, 62, 143);
        progressBarPressure2[i].colorA = lerpColor(from, to, (float(i)/(i+10)));
      }
    }
  }

  /*Radial Progress Bar*/
  // get the value form slider and set it in radialProgressBar
  radialProgressBar.display(colorModeSlider.value(), speedSlider.value(), modesButtonIndex);
  /*Digital Clock*/
  digitalClock.display(colorModeSlider.value());

  /*Color Mode Slider*/
  colorModeSlider.display();

  /*Main Display*/
  pushMatrix();
  translate(nColX*3+40, 0);
  /*Swicth Main Screen*/
  switchMainDisplayBottom.display();
  switchMainDisplayTop.display();
  popMatrix();
  /*Main Display Buttons*/
  for (int i = 0; i < mainDisplayButton.length; i++) {
    mainDisplayButton[i].display();
    mainDisplayButton[i].hover();
  }
}
/*-----------------------------------End Draw Loop-----------------------------------*/

/*----------------------------------Start Mouse Functions----------------------------------*/
void mousePressed() {
  /*Buttons*/
  for (int i = 0; i < arBtn.length; i++) {
    this.arBtn[i].pressed();
  }
  for (int i = 0; i < vagonBtn.length; i++) {
    vagonBtn[i].toggle();
  }
  for (int i = 0; i < mainDisplayButton.length; i++) { 
    mainDisplayButton[i].pressed();
  }
  for (int i = 0; i < modesButton.length; i++) { 
    modesButton[i].pressed();
    modesButton[i].store(i);
  }

  /*Switch Image Main Display*/
  if (mouseX >= nColX*3+nBorder && mouseX <= nColX*3+nBorder+nColX*6 && 
    mouseY >= nColY*4 && mouseY <= nColY*4+nColY*2-20) {
    switchMainDisplayBottom.switchScreen();
  }
  if (mouseX >= nColX*3+nBorder && mouseX <= nColX*3+nBorder+75 && 
    mouseY >= nColY*6-20 && mouseY <= nColY*6) {
    switchMainDisplayTop.screenZero();
  } else if (mouseX >= nColX*3+nBorder+80 && mouseX <= nColX*3+nBorder+155 && 
    mouseY >= nColY*6-20 && mouseY <= nColY*6) {
    switchMainDisplayTop.screenOne();
  } else if (mouseX >= nColX*3+nBorder+160 && mouseX <= nColX*3+nBorder+235 && 
    mouseY >= nColY*6-20 && mouseY <= nColY*6) {
    switchMainDisplayTop.screenTwo();
  }
}

void mouseDragged() {
  if (mouseX >= 50 && mouseX <= 350 && 
    mouseY >= 440 && mouseY <= 470) {
    colorModeSlider.move();
  }
}
/*----------------------------------End Mouse Functions----------------------------------*/

//for (Button m : modesButton) {
//  println(m.index);
//}

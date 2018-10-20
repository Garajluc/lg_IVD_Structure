/*------Objects------*/
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
/*Slider*/
SpeedSlider speedSlider;

/*------Global Variables------*/
int nBorder = 40; // 2*40=80
int nColX = 100; // 12*100=1200
int nColY = 80; // 9*80=720
float modesButtonIndex;

/*-------Setup-------*/
void setup() {
  size(1280, 720);
  background(0);

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

  /*------Methods------*/
  /*Background*/
  pointGrid(5, 5, 28, 28, 2, 209, 219, 189, 120);
  pointGrid(9, 6, 28, 28, 1, 252, 255, 245, 80);
}


/*-------Draw Loop-------*/
void draw() {  
  /*------Objects------*/
  /*Structure*/
  sideBarLeft.display();
  sideBarRight.display();
  sideBarBottom.display();
  mainDisplay.display();
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
  fill(0);
  speedSlider.display();
  /*Radial Progress Bar*/
  // get the value form slider and set it in radialProgressBar
  noStroke();
  //radialProgressBar.display(speedSlider.value());
  radialProgressBar.modes(speedSlider.value(), modesButtonIndex);
  stroke(255);

  /*Main Display*/
  pushMatrix();
  translate(nColX*3+40, 0);
  /*Swicth Main Screen*/
  switchMainDisplayBottom.display();
  switchMainDisplayTop.display();
  popMatrix();
  /*Buttons*/
  for (int i = 0; i < mainDisplayButton.length; i++) {
    mainDisplayButton[i].display();
    mainDisplayButton[i].hover();
  }
}

/*------Mouse Functions------*/
void mousePressed() {
  /*Button Get Color*/
  for (int i = 0; i < arBtn.length; i++) {
    this.arBtn[i].pressed();
  }
  for (int i = 0; i < vagonBtn.length; i++) {
    vagonBtn[i].toggle();
  }
  for (int i = 0; i < mainDisplayButton.length; i++) { 
    mainDisplayButton[i].pressed();
  }
  //for (Button m : modesButton) {
  //  println(m.index);
  //}
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

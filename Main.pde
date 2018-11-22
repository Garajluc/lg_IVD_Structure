/*-----------------------------------Start Objects-----------------------------------*/
/*Buttons*/
//Button[] controlButton = new Button[5];

/*Icons*/
//Icons icons;

/*Digital Clock */
DigitalClock digitalClock;
/*Color Mode Slider*/
ColorModeSlider colorModeSlider;
/*Control Panel UI*/
ControlPanelUI controlPanel;
/*Engine Status UI*/
EngineStatusUI engineStatus;
/*Radar UI*/
radarUI radar;
/*Audio Visualiser UI*/
AudioVisualiserUI audioVisualiser;
QueryPanel queryPanel;
/*Main Display UI*/
MainDisplayUI mainDisplay;
/*CarriageUI*/
CarriageUI carriage;
/*Air Condition UI*/
AirConditionUI airCondition;
/*-----------------------------------End Objects-----------------------------------*/

/*------Global Variables------*/
int nBorder = 40; // 2*40=80
int nColX = 100; // 12*100=1200
int nColY = 80; // 9*80=720
float modesButtonIndex;
boolean toggle = false;
int index = 0;
int currentButton1 = 0;
int currentButton2 = 0;
int currentButton3 = 0;
color strokeColor = color(100, 0, 200);
int[] colors = {#66C8CB, #19777B, #EBE719, #000000}; // Set of color palette
/*-----------------------------------Start Setup-----------------------------------*/
void setup() {
  size(1280, 720);

  /*------Initiate the objects------*/
  /*Buttons*/
  //for (int i = 0; i < controlButton.length; i++) {
  //  controlButton[i] = new Button(nBorder+20+(i*52), nColY*9-50, 52, 30, i, 0);
  //} 
  /*Icons*/
  //icons = new Icons("icon_", 5, nBorder+20, nColY*8+30);
  /*Digital Clock*/
  digitalClock = new DigitalClock(55, 70);
  /*Radar UI*/
  radar = new radarUI();
  /*Audio Visualiser*/
  audioVisualiser = new AudioVisualiserUI(nBorder+10, nColY*4, nColX*3-10, nColY*2);
  queryPanel = new QueryPanel();
  /*Control Panel UI*/
  controlPanel = new ControlPanelUI(nColX*3+nBorder, nColY*6, nColX*6, nColY*3);
  /*Engine Status UI*/
  engineStatus = new EngineStatusUI();
  /*Main Display UI*/
  mainDisplay = new MainDisplayUI();
  /*Carriage UI*/
  carriage = new CarriageUI();
  /*Air Condition UI*/
  airCondition = new AirConditionUI(nColX*9+nBorder, nColY*6, nColX*3, nColY*3);
  /*Color Mode Slider*/
  colorModeSlider = new ColorModeSlider(nColX*3+55, 50, nColX*6-30, nColY*3+20);
/*-----------------------------------End Setup-----------------------------------*/
}


/*-----------------------------------Start Draw Loop-----------------------------------*/
void draw() {  
  background(colorModeSlider.value());
  fill(255);
  textSize(32);
  text("C-MIST", 50, 40);

  /*Background*/
  pointGrid(5, 5, 28, 28, 2, 209, 219, 189, 120);
  pointGrid(9, 6, 28, 28, 1, 252, 255, 245, 80);

  /*------Objects------*/
  /*Buttons*/
  //for (int i = 0; i < controlButton.length; i++) {
  //  controlButton[i].display();
  //  controlButton[i].hover();
  //}
  /*Icons*/
  //icons.display();
  /*Digital Clock and Date */
  digitalClock.display(colorModeSlider.value());
  /*Radar UI*/
  radar.display();
  /*Audio Visualiser UI*/
  audioVisualiser.display();
  queryPanel.display();
  /*Engine Status UI*/
  engineStatus.display();
  /*Main Display UI*/
  mainDisplay.display();
  /*Control Panel UI*/
  controlPanel.display();
  /*Carriage UI*/
  carriage.display();
  /*Air Condition UI*/
  airCondition.display();

  /*Warning message*/
  if (currentButton3 == 3) {
    stroke(100, 0, 200);
    fill(100, 0, 200, 100);
    rect(nColX*3+40+15, nColY*2,nColX*6-30, nColY*2-40);
    fill(255,0,0);
    textSize(16);
    text("Warning Message", nColX*3+40+35, nColY*2+20);
  }

  /*Color Mode Slider*/
  //if (controlButton[0].initColor == controlButton[0].clickedColor) {
  //  colorModeSlider.display();
  //  colorModeSlider.move();
  //}
  //if (controlButton[4].initColor == controlButton[4].clickedColor) {
  //  audioVisualiser.on();
  //}
/*-----------------------------------End Draw Loop-----------------------------------*/
}


/*----------------------------------Start Mouse Functions----------------------------------*/
void mousePressed() {
  /*Buttons*/
  for (int i = 0; i < queryPanel.queryButton.length; i++) {
    queryPanel.queryButton[i].toggleBtn();
  }
  /*Switch Image Main Display*/
  mainDisplay.switchBottomDisplay();
}
/*----------------------------------End Mouse Functions----------------------------------*/

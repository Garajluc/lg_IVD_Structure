//Audio
import processing.sound.*;
/*-----------------------------------Start Objects-----------------------------------*/
/*Digital Clock */
Header header;
/*Color Mode Slider*/
ColorModeSlider colorModeSlider;
/*Control Panel UI*/
ControlPanelUI controlPanel;
/*Engine Status UI*/
EngineStatusUI engineStatus;
/*Radar UI*/
radarUI radar;
/*Audio Visualiser UI*/
//AudioVisualiserUI audioVisualiser;
QueryPanel queryPanel;
/*Main Display UI*/
MainDisplayUI mainDisplay;
/*CarriageUI*/
CarriageUI carriage;
/*Carriage Condition UI*/
CarriageConditionUI carriageCondition;
//Audio
AudioIn in;
Amplitude amp;
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
int[] colors = {#66C8CB, #19777B, #EBE719, #000000, #FFFFFF}; // Set of color palette
PFont pressStart;
//Audio
Float ampscalar = 100.0;
Float[] amps = new Float[160];
int wx = 50;
int wy = 320;
/*-----------------------------------Start Setup-----------------------------------*/
void setup() {
  size(1280, 720);
  pixelDensity(displayDensity());
  smooth(2);
  pressStart = createFont ("font/OCR A Std Regular.ttf", 16);

  /*------Initiate the objects------*/
  /*Digital Clock*/
  header = new Header(40, 55);
  /*Radar UI*/
  radar = new radarUI(nBorder, nColY, nColX*2, nColY*2+40, 59);
  /*Audio Visualiser*/
  //audioVisualiser = new AudioVisualiserUI(nBorder+10, nColY*4, nColX*3-10, nColY*2);
  queryPanel = new QueryPanel();
  /*Control Panel UI*/
  controlPanel = new ControlPanelUI(nBorder+nColX*2, nColY*6, nColX*7, nColY*2+40);
  /*Engine Status UI*/
  engineStatus = new EngineStatusUI();
  /*Main Display UI*/
  mainDisplay = new MainDisplayUI();
  /*Carriage UI*/
  carriage = new CarriageUI();
  /*Air Condition UI*/
  carriageCondition = new CarriageConditionUI(nColX*9+nBorder, nColY*6, nColX*3, nColY*3);
  /*Color Mode Slider*/
  colorModeSlider = new ColorModeSlider(nColX*3+55, 50, nColX*6-30, nColY*3+20);
  // Audio
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  for(int i = 0; i < amps.length; i++){
    amps[i] = 0.0;
  }
  /*-----------------------------------End Setup-----------------------------------*/
}


/*-----------------------------------Start Draw Loop-----------------------------------*/
void draw() {  
  background(0);
  fill(colors[4]);

  /*Background*/
  pointGrid(5, 5, 28, 28, 2, 209, 219, 189, 120);
  pointGrid(9, 6, 28, 28, 1, 252, 255, 245, 80);

  /*------Objects------*/
  /*Digital Clock and Date */
  header.display(colorModeSlider.value());
  /*Radar UI*/
  radar.display();
  /*Audio Visualiser UI*/
  //audioVisualiser.display();
  queryPanel.display();
  /*Engine Status UI*/
  engineStatus.display();
  /*Control Panel UI*/
  controlPanel.display();
  /*Main Display UI*/
  mainDisplay.display();
  /*Carriage UI*/
  carriage.display();
  /*Air Condition UI*/
  carriageCondition.display();

  /*Warning message*/
  if (currentButton3 == 3) {
    stroke(100, 0, 200);
    fill(100, 0, 200, 100);
    rect(nColX*3+40+15, nColY*2, nColX*6-30, nColY*2-40);
    fill(255, 0, 0);
    textSize(16);
    text("Warning Message", nColX*3+40+35, nColY*2+20);
  }
  //Audio
  stroke(255);
  for(int i = 0; i < amps.length -1; i++){
    amps[i] = amps[i+1];
  }
  amps[amps.length - 1] = amp.analyze();
  for(int i = 0; i < amps.length; i++){
    line(wx + i,wy - amps[i] * ampscalar,wx + i,wy + amps[i] * ampscalar);
  }
  /*-----------------------------------End Draw Loop-----------------------------------*/
}


/*----------------------------------Start Mouse Functions----------------------------------*/
void mousePressed() {
  /*Buttons*/
  for (int i = 0; i < queryPanel.queryButton.length; i++) {
    queryPanel.queryButton[i].toggleBtn();
  }
  for (int i = 0; i < controlPanel.lightDoorButton.length; i++) {
    controlPanel.lightDoorButton[i].toggleBtn();
  }
  /*Switch Image Main Display*/
  mainDisplay.switchBottomDisplay();
}
/*----------------------------------End Mouse Functions----------------------------------*/

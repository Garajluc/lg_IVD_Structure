/*-----------------------------------Libraries-----------------------------------*/
import processing.sound.*;
import processing.video.*;
/*-----------------------------------Start Objects-----------------------------------*/
Movie trainTimelaps;
Movie insideTrain;
SoundFile train;
WelcomeScreen welcomeScreen;
Header header;
ColorModeSlider colorModeSlider;
ControlPanelUI controlPanel;
EngineStatusUI engineStatus;
radarUI radar;
AudioVisualiserUI audioVisualiser;
QueryPanel queryPanel;
MainDisplayUI mainDisplay;
CarriageUI carriage;
CarriageConditionUI[] carriageCondition = new CarriageConditionUI[7];
Button[] airConditionButton = new Button[7];
Waves waves;
WarningMessages highSpeed;
/*-----------------------------------End Objects-----------------------------------*/

/*------Global Variables------*/
int nBorder = 40; // 2*40=80
int nColX = 100; // 12*100=1200
int nColY = 80; // 9*80=720
int carriageConditionButtonArrIndex = 0; // index of corriage condition buttons
int mainDisplayButtonArr = 0; // index of the main display buttons
int controlPanelButtonArr = 0; // index of control panel
int[] colors = {#66C8CB, #19777B, #EBE719, #000000, #FFFFFF}; // Set of color palette
PFont pressStart;
boolean soundIsPlaying = false;
/*-----------------------------------Start Setup-----------------------------------*/
void setup() {
  size(1280, 720, P3D);
  pixelDensity(displayDensity());
  smooth(2);
  pressStart = createFont ("font/OCR A Std Regular.ttf", 16);
  trainTimelaps = new Movie(this, "video/Train_Timelapse.mov");
  insideTrain = new Movie(this, "video/insideTrain.mp4");
  train = new SoundFile(this, "train.wav");

  /*------Initiate the objects------*/
  welcomeScreen = new WelcomeScreen();
  header = new Header(40, 55);
  radar = new radarUI(nBorder, nColY, nColX*2, nColY*2+40, 59);
  audioVisualiser = new AudioVisualiserUI(nBorder+20, nColY*4+30, this);
  queryPanel = new QueryPanel();
  controlPanel = new ControlPanelUI(nBorder+nColX*2, nColY*6, nColX*7, nColY*2+40);
  engineStatus = new EngineStatusUI();
  mainDisplay = new MainDisplayUI(this);
  carriage = new CarriageUI();
  colorModeSlider = new ColorModeSlider(nBorder+30, nColY*5+25, nColX*2-40, nColY/2);
  waves = new Waves();
  highSpeed = new WarningMessages();
  /*--------------Carriage Condition Sliders--------------*/
  for (int i = 0; i < carriageCondition.length; i++) {
    carriageCondition[i] = new CarriageConditionUI(nColX*9+nBorder, nColY*6, nColX*3, nColY*3);
  }
  /*--------------Buttons--------------*/
  for (int i = 0; i < airConditionButton.length; i++) {
    airConditionButton[i] = new Button(nColX*9+nBorder+(i*40)+10, nColY*6+nColY*2-5, 40, 35, i, 1);
    if (i == carriageConditionButtonArrIndex) airConditionButton[i].toggle = true;
  }
  /*-----------------------------------End Setup-----------------------------------*/
}

/*-----------------------------------Start Draw Loop-----------------------------------*/
void draw() {
  /*Welcome Screen*/
  welcomeScreen.display();
  /*Draw after the code was passed*/
  if (welcomeScreen.start) {
    background(0 + colorModeSlider.a);
    fill(colors[4]);
    /*------Objects------*/
    /*Background*/
    pointGrid(5, 5, 28, 28, 2, 209, 219, 189, 120);
    pointGrid(9, 6, 28, 28, 1, 252, 255, 245, 80);
    header.display(colorModeSlider.a);
    radar.display();
    queryPanel.display();
    engineStatus.display();
    mainDisplay.display();
    controlPanel.display();
    carriage.display();
    highSpeed.highSpeed();
    /*Buttons for Carriage Condition*/
    for (int i = 0; i < airConditionButton.length; i++) {
      if (carriageConditionButtonArrIndex != i)  airConditionButton[i].toggle = false;
      airConditionButton[i].display(4, 8);
      airConditionButton[i].hover();
      airConditionButton[i].pressed();
    }
    /*Sliders for Carriage Condition*/
    for (int i=0; i < carriageCondition.length; i++) {
      if (carriageConditionButtonArrIndex == i) {
        carriageCondition[i].display();
      }
    }
    /*Conditions for sound play*/
    if (controlPanel.radialProgressBar.currentValue > 0 && !soundIsPlaying) {
      train.loop();
      soundIsPlaying = true;
    } else if (controlPanel.radialProgressBar.currentValue < 0 && soundIsPlaying) {
      train.pause();
      soundIsPlaying = false;
    }
    
    waves.display();
    if (mainDisplay.mainDisplayButton[1].initColor == mainDisplay.mainDisplayButton[1].clickedColor) {
      mainDisplay.sphere.display();
    }
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
}

void movieEvent(Movie m) {
  m.read();
}
/*----------------------------------End Mouse Functions----------------------------------*/

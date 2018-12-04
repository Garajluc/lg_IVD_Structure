/*-----------------------------------Start Objects-----------------------------------*/
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
//CarriageConditionUI carriageCondition;
CarriageConditionUI[] carriageCondition = new CarriageConditionUI[7];
/*-----------------------------------End Objects-----------------------------------*/

/*------Global Variables------*/
// Layout
int nBorder = 40; // 2*40=80
int nColX = 100; // 12*100=1200
int nColY = 80; // 9*80=720
//Buttons
int carriageConditionButtonArrIndex = 0; // index of corriage condition buttons
int mainDisplayButtonArr = 0; // index of the main display buttons
int controlPanelButtonArr = 0; // index of control panel
int[] colors = {#66C8CB, #19777B, #EBE719, #000000, #FFFFFF}; // Set of color palette
PFont pressStart;
/*-----------------------------------Start Setup-----------------------------------*/
void setup() {
  size(1280, 720);
  pixelDensity(displayDensity());
  smooth(2);
  pressStart = createFont ("font/OCR A Std Regular.ttf", 16);

  /*------Initiate the objects------*/
  welcomeScreen = new WelcomeScreen();
  header = new Header(40, 55);
  radar = new radarUI(nBorder, nColY, nColX*2, nColY*2+40, 59);
  audioVisualiser = new AudioVisualiserUI(nBorder+20, nColY*4+30, this);
  queryPanel = new QueryPanel();
  controlPanel = new ControlPanelUI(nBorder+nColX*2, nColY*6, nColX*7, nColY*2+40);
  engineStatus = new EngineStatusUI();
  mainDisplay = new MainDisplayUI();
  carriage = new CarriageUI();
  //carriageCondition = new CarriageConditionUI(nColX*9+nBorder, nColY*6, nColX*3, nColY*3);
  colorModeSlider = new ColorModeSlider(nBorder+30, nColY*5+25, nColX*2-40, nColY/2);
  
  for (int i = 0; i < carriageCondition.length; i++) {
      carriageCondition[i] = new CarriageConditionUI(nColX*9+nBorder, nColY*6, nColX*3, nColY*3);
    }
  /*-----------------------------------End Setup-----------------------------------*/
}


/*-----------------------------------Start Draw Loop-----------------------------------*/
void draw() {
  /*Welcome Screen*/
  //welcomeScreen.display();
  /*Draw after the code was passed*/
  //if (welcomeScreen.start) {
    background(0 + colorModeSlider.a);
    fill(colors[4]);

    /*Background*/
    pointGrid(5, 5, 28, 28, 2, 209, 219, 189, 120);
    pointGrid(9, 6, 28, 28, 1, 252, 255, 245, 80);

    /*------Objects------*/
    header.display(colorModeSlider.a);
    radar.display();
    audioVisualiser.display();
    queryPanel.display();
    engineStatus.display();
    mainDisplay.display();
    controlPanel.display();
    carriage.display();
    //carriageCondition.display();
   
    
    if (carriageConditionButtonArrIndex == 0) {
      carriageCondition[0].display();
    } else if (carriageConditionButtonArrIndex == 1) {
      carriageCondition[1].display();
    } else if (carriageConditionButtonArrIndex == 2) {
      carriageCondition[2].display();
    } else if (carriageConditionButtonArrIndex == 3) {
      carriageCondition[3].display();
    } else if (carriageConditionButtonArrIndex == 4) {
      carriageCondition[4].display();
    } else if (carriageConditionButtonArrIndex == 5) {
      carriageCondition[5].display();
    } else if (carriageConditionButtonArrIndex == 6) {
      carriageCondition[6].display();
    }
  //}
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

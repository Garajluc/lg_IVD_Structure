/*-----------------------------------Start Objects-----------------------------------*/
Header header;
ColorModeSlider colorModeSlider;
ControlPanelUI controlPanel;
EngineStatusUI engineStatus;
radarUI radar;
AudioVisualiserUI audioVisualiser;
QueryPanel queryPanel;
MainDisplayUI mainDisplay;
CarriageUI carriage;
CarriageConditionUI carriageCondition;
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
  header = new Header(40, 55);
  radar = new radarUI(nBorder, nColY, nColX*2, nColY*2+40, 59);
  audioVisualiser = new AudioVisualiserUI(nBorder+20, nColY*4+30, this);
  queryPanel = new QueryPanel();
  controlPanel = new ControlPanelUI(nBorder+nColX*2, nColY*6, nColX*7, nColY*2+40);
  engineStatus = new EngineStatusUI();
  mainDisplay = new MainDisplayUI();
  carriage = new CarriageUI();
  carriageCondition = new CarriageConditionUI(nColX*9+nBorder, nColY*6, nColX*3, nColY*3);
  colorModeSlider = new ColorModeSlider(nBorder+30, nColY*5+25, nColX*2-40, nColY/2);
  /*-----------------------------------End Setup-----------------------------------*/
}


/*-----------------------------------Start Draw Loop-----------------------------------*/
void draw() {  
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
  carriageCondition.display();

  /*Warning message*/
  if (controlPanelButtonArr == 3) {
    stroke(100, 0, 200);
    fill(100, 0, 200, 100);
    rect(nColX*3+40+15, nColY*2, nColX*6-30, nColY*2-40);
    fill(255, 0, 0);
    textSize(16);
    text("Warning Message", nColX*3+40+35, nColY*2+20);
  }  

  //if (controlPanel.speedModeButton[3].initColor == controlPanel.speedModeButton[3].clickedColor ) {
  //  controlPanel.vagon();
  //  if (controlPanel.xpos > (controlPanel.tv)-1) {
  //    println("xpos" + controlPanel.xpos + "=" + "tv" + controlPanel.tv);
  //    controlPanel.speedModeButton[3].clickedColor = colors[1];
  //  }
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

class CarriageUI {
  /*-----------------------------------Objects-----------------------------------*/
  Frame headerCarriageFrame;
  Frame carriageFrame;
  Carriage[] carriage = new Carriage[7];
  WarningMessages warningStationApproaching;

  /*-----------------------------------Start Constructor-----------------------------------*/
  CarriageUI() {
    headerCarriageFrame = new Frame(nColX*9+nBorder, nColY/2, nColX*3, nColY/2);
    carriageFrame = new Frame(nColX*9+nBorder, nColY, nColX*3, nColY*5);
    warningStationApproaching = new WarningMessages();

    for (int i = 0; i < carriage.length; i++) {
      carriage[i] = new Carriage(nBorder+nColX*9+15, nColY+nColY/2+i*50, 130, 35);
    }
  }
  /*-----------------------------------End Constructor-----------------------------------*/

  /*-----------------------------------Start Method-----------------------------------*/
  void display() {
    headerCarriageFrame.display();
    headerCarriageFrame.title("Carriage");
    carriageFrame.display();
    warningStationApproaching.approachStation();
    for (int i = 0; i < carriage.length; i++) {
      carriage[i].display();
    }
    
    for (int i=0; i < carriage.length; i++) {
      textSize(10);
      fill(colors[0]);
      text("Temp:", nBorder+nColX*9+20, nColY+57+i*50);
      text("°C", nBorder+nColX*9+128, nColY+57+i*50);
      text("Light:", nBorder+nColX*9+20, nColY+75+i*50);
      text("%", nBorder+nColX*9+135, nColY+75+i*50);
      float heat = map(1-carriageCondition[i].heatSlider.currentValue, 0, 1, 0, 45);
      textAlign(RIGHT);
      text(int(nf((heat), 0, 0)), nBorder+nColX*9+128, nColY+57+i*50);
      text(int(nf((1-carriageCondition[i].lightSlider.currentValue)*100, 0, 0)), nBorder+nColX*9+128, nColY+75+i*50);
      textAlign(LEFT);
    }
  
  
  if (controlPanel.lightDoorButton[1].initColor == controlPanel.lightDoorButton[1].clickedColor && controlPanel.increment <= 0) {
      fill(colors[2]);
      textSize(14);
      text("!- DOORS OPEN -!", nColX*9+45, nColY+25);
    }
  }
  /*-----------------------------------End Method-----------------------------------*/
}

class CarriageUI {
  float fade = 5;
  float fadeTargetValue = 0;
  float fadeCurrentValue = 255;

  /*-----------------------------------Objects-----------------------------------*/
  Frame headerCarriageFrame;
  Frame carriageFrame;
  Carriage[] carriage = new Carriage[7];

  /*-----------------------------------Start Constructor-----------------------------------*/
  CarriageUI() {
    headerCarriageFrame = new Frame(nColX*9+nBorder, nColY/2, nColX*3, nColY/2);
    carriageFrame = new Frame(nColX*9+nBorder, nColY, nColX*3, nColY*5);

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
    for (int i = 0; i < carriage.length; i++) {
      carriage[i].display();
    }

    /*Display the alert - approaching the train station*/
    if (controlPanel.cv > nBorder+nColX*2+135 && controlPanel.cv < nBorder+nColX*2+190
      || controlPanel.cv > nBorder+nColX*2+135+157 && controlPanel.cv < nBorder+nColX*2+190+157
      || controlPanel.cv > nBorder+nColX*2+135+157*2 && controlPanel.cv < nBorder+nColX*2+190+157*2
      || controlPanel.cv > nBorder+nColX*2+135+157*3 && controlPanel.cv < nBorder+nColX*2+190+157*3
      || controlPanel.cv > nBorder+nColX*2+135+157*4 && controlPanel.cv < nBorder+nColX*2+190+157*4) {

      if (fadeCurrentValue ==  0) {
        fadeTargetValue = 255; // visible
      } else if (fadeCurrentValue == 250) {
        fadeTargetValue = 0;
      }

      if (fadeTargetValue > fadeCurrentValue) {
        fadeCurrentValue = fadeCurrentValue + fade;
      } else if (fadeTargetValue < fadeCurrentValue) {
        fadeCurrentValue -= fade;
        println(fadeCurrentValue);
      }

      textSize(14);
      fill(colors[2], fadeCurrentValue);
      text("!- APPROACHING THE STATION -!", nColX*9+45, nColY+25);
    }
  }
  /*-----------------------------------End Method-----------------------------------*/
}

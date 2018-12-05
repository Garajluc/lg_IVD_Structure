class WarningMessages {
  float fade = 5;
  float fadeTargetValue = 0;
  float fadeCurrentValue = 255;

  WarningMessages() {
  }

  void approachStation() {
    /*Display the alert - approaching the train station*/
    if (controlPanel.cv > nBorder+nColX*2+135 && controlPanel.cv < nBorder+nColX*2+190
      || controlPanel.cv > nBorder+nColX*2+135+157 && controlPanel.cv < nBorder+nColX*2+190+157
      || controlPanel.cv > nBorder+nColX*2+135+157*2 && controlPanel.cv < nBorder+nColX*2+190+157*2
      || controlPanel.cv > nBorder+nColX*2+135+157*3 && controlPanel.cv < nBorder+nColX*2+190+157*3
      || controlPanel.cv > nBorder+nColX*2+135+157*4 && controlPanel.cv < nBorder+nColX*2+190+157*4) {
      if (controlPanel.increment > 0) {
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
  }
}

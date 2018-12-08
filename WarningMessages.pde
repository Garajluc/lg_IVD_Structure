class WarningMessages {
  /*-----------------------------------Variables-----------------------------------*/
  float fade = 5;
  float fadeTargetValue = 0;
  float fadeCurrentValue = 255;
  /*-----------------------------------Start Constructor-----------------------------------*/
  WarningMessages() {
  }
  /*-----------------------------------End Constructor-----------------------------------*/
  /*-----------------------------------Start Method-----------------------------------*/
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

  void doorOpen() {
    if (controlPanel.lightDoorButton[1].initColor == controlPanel.lightDoorButton[1].clickedColor && controlPanel.increment <= 0) {
      fill(colors[2]);
      textSize(14);
      text("!- DOORS OPEN -!", nColX*9+45, nColY+25);
    }
  }

  void carriageCondition() {
    for (int i=0; i < carriageCondition.length; i++) {
      if (carriageCondition[i].heatSlider.targetValue > 0.8) {
        fill(colors[2]);
        textSize(18);
        text("!", nColX*11+16, nColY+66+i*50);
        if (mouseX >nColX*11 && mouseX < nColX*11+40 && mouseY > nColY+50+i*50 && mouseY < nColY+80+i*50) {
          carriageCondition[i].heatSlider.targetValue = 0.5;
        }
      }
    }
  }

  void highSpeed() {
    if (controlPanel.radialProgressBar.currentValue > 0.6) {
      if (controlPanel.increment > 0) {
        if (fadeCurrentValue ==  0) {
          fadeTargetValue = 255;
        } else if (fadeCurrentValue == 250) {
          fadeTargetValue = 0;
        }

        if (fadeTargetValue > fadeCurrentValue) {
          fadeCurrentValue = fadeCurrentValue + fade;
        } else if (fadeTargetValue < fadeCurrentValue) {
          fadeCurrentValue -= fade;
          println(fadeCurrentValue);
        }

        fill(colors[3], 100);
        rect(nColX*4, nColY*2, 400, 100);
        textSize(20);
        fill(colors[2], fadeCurrentValue);
        textAlign(CENTER);
        textMode(CENTER);
        text("!- WARNING -!", width/2-40, nColY*3-50);
        text("!- HIGH SPEED -!", width/2-40, nColY*3-25);
        text("!- SLOW DOWN -!", width/2-40, nColY*3);
        textMode(CORNER);
        textAlign(LEFT);
      }
    }
  }
  /*-----------------------------------End Method-----------------------------------*/
}

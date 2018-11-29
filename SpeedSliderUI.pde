/*Speed Slider UI used inside Control Panel UI*/
class SpeedSliderUI {
  int x,y,w,h; // x and y position, width and height
  boolean bHover; // indicates if the mouse is over specific area
  
  float currentValue;
  float targetValue;
  float inverCurrentValue; // starting position (height) of blue rectangle
  //PImage speedmeter;
  float colorMode;


  SpeedSliderUI(int tx, int ty, int tw, int th, float tinverCurrentValue) {
    x = tx;
    y = ty;
    w = tw;
    h = th;
    inverCurrentValue = tinverCurrentValue;
    currentValue = 1.0 - inverCurrentValue;
    //speedmeter = loadImage("layout/speedmeter.png");
  }

  void display(float colorMode) {
    /*Outline rectangle*/
    stroke(colors[0]); // outline
    fill(colors[3]); // #000000 fill
    rect(x, y-3, w, h+3);

    /*Setting mouse hover boolean */
    bHover = false;
    if (
      mouseX > x &&
      mouseX < x + w &&
      mouseY > y &&
      mouseY < y + h) {
      bHover = true;
    }

    if (controlPanelButtonArr == 0 && bHover && mousePressed) {
      inverCurrentValue = 1.0 - ((mouseY - y)/float(h));
      constrain(currentValue, 0.0, 1.0);
    } else if (controlPanelButtonArr == 1) { 
      if (currentValue < 0.75) {
        currentValue += + 0.001;
        inverCurrentValue = 1.0-currentValue;
      } else if (currentValue > 0.75) {
        currentValue -= 0.001;
        inverCurrentValue = 1.0-currentValue;
      }
    } else if (controlPanelButtonArr == 2) {
      if (currentValue < 0.5) {
        currentValue += + 0.001;
        inverCurrentValue = 1.0-currentValue;
      } else if (currentValue > 0.5) {
        currentValue -= 0.001;
        inverCurrentValue = 1.0-currentValue;
      }
    } else if (controlPanelButtonArr == 3) {
      if (currentValue < 0.25) {
        currentValue += + 0.001;
        inverCurrentValue = 1.0-currentValue;
      } else if (currentValue > 0.25) {
        currentValue -= 0.001;
        inverCurrentValue = 1.0-currentValue;
      }
    } else if (controlPanelButtonArr == 4) {
      if (currentValue > 1) {
        currentValue += + 0.001;
        inverCurrentValue = 1.0-currentValue;
      } else if (currentValue < 1 && currentValue > 0) {
        currentValue -= 0.001;
        inverCurrentValue = 1.0-currentValue;
      }
    }
    currentValue = 1.0 - inverCurrentValue;
    noStroke();
    fill(colors[0]);
    rect(x+3, y+(currentValue*h)-2, w-5, inverCurrentValue*h);
    fill(0);
  }
}

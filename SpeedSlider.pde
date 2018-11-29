/*Speed Slider UI used inside the Control Panel UI*/
class SpeedSlider {
  int x, y, w, h; // x, y position; width and height
  boolean bHover; // indicates if the mouse is over specific area
  float currentValue; // current value of speed = height of black rectangle
  float targetValue; // starting position (height) of blue rectangle
  float colorMode;

  SpeedSlider(int tx, int ty, int tw, int th, float ttargetValue) {
    x = tx;
    y = ty;
    w = tw;
    h = th;
    targetValue = ttargetValue;
    currentValue = 1.0 - targetValue;
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

    if (controlPanelButtonArr == 0 && bHover && mousePressed) { // Manual - ON/OFF!!!
      targetValue = 1.0 - ((mouseY - y)/float(h));
      constrain(currentValue, 0.0, 1.0);
    } else if (controlPanelButtonArr == 1) { // Mode A speed 1/4
      if (currentValue < 0.75) {
        currentValue += + 0.001;
        targetValue = 1.0-currentValue;
      } else if (currentValue > 0.75) { 
        currentValue -= 0.001;
        targetValue = 1.0-currentValue;
      }
    } else if (controlPanelButtonArr == 2) { // Mode B speed 1/2
      if (currentValue < 0.5) {
        currentValue += + 0.001;
        targetValue = 1.0-currentValue;
      } else if (currentValue > 0.5) {
        currentValue -= 0.001;
        targetValue = 1.0-currentValue;
      }
    } else if (controlPanelButtonArr == 3) {
      // Autonomus driving
    }


    /*Skusala som to zjednodusit ale nieco je tam dodobane*/
    //if (controlPanelButtonArr == 0 && bHover && mousePressed) { // Manual - ON/OFF!!!
    //  //n = 0.1;
    //  targetValue = 1.0 - ((mouseY - y)/float(h));
    //  constrain(currentValue, 0.0, 1.0);
    //} else if (controlPanelButtonArr == 1) { // Mode A speed 1/4
    //  n = 0.75;
    //} else if (controlPanelButtonArr == 2) { // Mode B speed 1/2
    //  n = 0.5;
    //} else if (controlPanelButtonArr == 3) {
    //  // Autonomus driving
    //}

    //if (currentValue < n) {
    //  currentValue += + 0.001;
    //  targetValue = 1.0-currentValue;
    //  currentValue = 1.0 - targetValue;
    //} else if (currentValue > n) {
    //  currentValue -= 0.001;
    //  targetValue = 1.0-currentValue;
    //  currentValue = 1.0 - targetValue;
    //}

    // blue fill rectangle
    currentValue = 1.0 - targetValue;
    noStroke();
    fill(colors[0]);
    rect(x+3, y+(currentValue*h)-2, w-5, targetValue*h);
    fill(0);
  }
}

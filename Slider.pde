class Slider {
  /*-----------------------------------Variables-----------------------------------*/
  int x, y, w, h; // x, y position; width and height
  boolean bHover; // indicates if the mouse is over specific area
  float currentValue; // current value of speed = height of black rectangle
  float targetValue; // starting position (height) of blue rectangle
  int offx, offy; // offset of fill rectangle 
  float colorMode;

  float increment;
  /*-----------------------------------Constructor Start-----------------------------------*/
  Slider(int tx, int ty, int tw, int th, float ttargetValue) {
    x = tx;
    y = ty;
    w = tw;
    h = th;
    targetValue = ttargetValue;
    currentValue = 1.0 - targetValue;
  }
  /*-----------------------------------Constructor End-----------------------------------*/

  /*-----------------------------------Method Start-----------------------------------*/
  void display(int offx, int offy) {
    /*Outline rectangle*/
    stroke(colors[0]); // outline
    fill(0 + colorModeSlider.a); // #000000 fill
    rect(x-offx, y-offy, w+(2*offx)-1, h+(2*offy)-1);

    /*Blue fill rectangle*/
    currentValue = 1.0 - targetValue;
    noStroke();
    fill(colors[0]);
    if ( w < h ) { // vertical slider
      rect(x, y+(currentValue*h), w, targetValue*h);
    } else if ( w > h) { // horizontal slider
      rect(x, y, targetValue*w, h);
    }
    fill(0);

    /*Setting mouse hover boolean */
    bHover = false;
    if (mouseX > x &&
      mouseX < x + w &&
      mouseY > y &&
      mouseY < y + h) {
      bHover = true;
    }
  }

  void horisontalSlider(float increment) {
    if (bHover && mousePressed) {
      targetValue =((mouseX - x)/float(w));
      constrain(currentValue, 0.0, 1.0);
    } else if (targetValue < 1) {
      targetValue += increment;
    }
  }

  void verticalSlider() {
    if (bHover && mousePressed) {
      targetValue =1.0-((mouseY -y)/float(h));
      constrain(currentValue, 0.0, 1.0);
    }
  }

  void randomSlider(float speed) {
    stroke(colors[0]);
    fill(colors[0]);
    targetValue = targetValue + speed;
    if ( w < h ) { // vertical slider
      float n = 1-noise(targetValue) * h;
      rect(x, y, w, n);
    } else if ( w > h) { // horizontal slider
      float n = noise(targetValue) * w;
      rect(x, y, n, h);
    }
  }

  void engineSlider(float yoff, float speed) {
    constrain(currentValue, 0.0, 1.0);
    float n = map(controlPanel.radialProgressBar.currentValue, 0, 1, 1, 0);

    if (currentValue < map(n+yoff, 1+yoff, 0, 1, 0)) {
      currentValue += + speed;
      targetValue = 1.0-currentValue;
    } else if (currentValue > map(n+yoff, 1+yoff, 0, 1, 0)) { 
      currentValue -= speed;
      targetValue = 1.0-currentValue;
    }
  }

  void speedSlider() {
    if (controlPanel.lightDoorButton[1].initColor != controlPanel.lightDoorButton[1].clickedColor) {
      if (controlPanelButtonArr == 0 && bHover && mousePressed) { // Manual - ON/OFF!!!
        targetValue = 1.0 - ((mouseY - y)/float(h));
        constrain(currentValue, 0.0, 1.0);
      } else if (controlPanelButtonArr == 1) { // Mode A speed 1/4
        if (currentValue < 0.5) {
          currentValue += + 0.001;
          targetValue = 1.0-currentValue;
        } else if (currentValue > 0.5) { 
          currentValue -= 0.001;
          targetValue = 1.0-currentValue;
        }
      } else if (controlPanelButtonArr == 2) { // Mode B speed 1/2
        if (currentValue < 0) {
          currentValue += + 0.001;
          targetValue = 1.0-currentValue;
        } else if (currentValue > 0) {
          currentValue -= 0.001;
          targetValue = 1.0-currentValue;
        }
      } else if (controlPanelButtonArr == 3) {
        targetValue = 0;
      }
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
  }
  /*-----------------------------------Method End-----------------------------------*/
}

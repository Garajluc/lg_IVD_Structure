class Button {
  float nRectX, nRectY, nRectW, nRectH;
  float x, y;
  color initColor, 
    clickedColor, 
    rectHighlight;
  boolean rectOver = false;
  boolean toggle = false;
  boolean overRect(float x, float y, float width, float height) {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
  boolean clickedOut(float x, float y, float width, float height) {
     if (mouseX >= x && mouseX <= x+width && 
      return true;
    } else {
      return false;
    }
  }

  Button(float trectX, float trectY, float trectW, float trectH) {
    initColor = color(0);
    rectHighlight = color(51);
    clickedColor = color(225, 0, 0);
    nRectW = trectW;
    nRectH = trectH;
    nRectX = trectX;
    nRectY = trectY;
  }

/*Display Bittons*/
  void display() {
    fill(initColor);
    if (rectOver) {
      fill(rectHighlight);
    }
    rect(nRectX, nRectY, nRectW, nRectH);
  }
  
/*Hover and Update Position of Cursor*/
  void update() {
    if (overRect(nRectX, nRectY, nRectW, nRectH) ) {
      rectOver = true;
    } else {
      rectOver = false;
    }
  }

/*Change Color when Mouse Pressed*/
  void pressed() {
    if (rectOver) {
      initColor = clickedColor;
    } else {
      initColor = color(0);
    }
  }

/*Change Color and Toggle*/
  void toggle() {
    if (rectOver) {
      initColor = clickedColor;
      if (toggle) {
        initColor = color(0);
      }
      toggle = !toggle;
    }
  }
}

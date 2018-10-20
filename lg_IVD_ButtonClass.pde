class Button {
  float nRectX, nRectY, nRectW, nRectH;
  //float x, y;
  color initColor, 
    clickedColor, 
    rectHighlight;
  boolean rectOver = false;
  boolean buttonPressed = false;
  boolean toggle = false;
  boolean overRect(float x, float y, float width, float height) {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
  int index;

  Button(float trectX, float trectY, float trectW, float trectH) {
    initColor = color(0);
    rectHighlight = color(51);
    clickedColor = color(225, 0, 0);
    nRectW = trectW;
    nRectH = trectH;
    nRectX = trectX;
    nRectY = trectY;
  }

  /*Display Buttons*/
  void display() {
    fill(initColor);
    if (rectOver) {
      fill(rectHighlight);
    }
    rect(nRectX, nRectY, nRectW, nRectH);
  }

  /*Hover and Update Position of Cursor*/
  void hover() {
    if (overRect(nRectX, nRectY, nRectW, nRectH) ) {
      rectOver = true;
      buttonPressed = true;
    } else {
      rectOver = false;
      buttonPressed = false;
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
  
  void store(int i) {
    if(rectOver) {
      index = i;
    }
  } 
  
  float getNRectX () {
    return nRectX;
  }
}

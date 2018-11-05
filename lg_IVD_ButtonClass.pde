class Button {
  ModesText[] modesText = new ModesText[5];

  int nRectX, nRectY, nRectW, nRectH; //x and y position, width and height dimensions
  color initColor = color(100, 0, 200, 100); // initial color of button
  color clickedColor =color(100, 0, 200, 200); // color after click
  color rectHighlight = color(100, 0, 200, 150); // mouse over the button color
  boolean rectOver = false; // mouse over the button
  boolean toggle = false; // toggle change color
  boolean overRect(float x, float y, float width, float height) {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
  int index;
  int btnIndex;
  boolean mouseDown = true;
  int arrayNumber;

  Button(int trectX, int trectY, int trectW, int trectH, int ti, int arNum) {
    nRectW = trectW;
    nRectH = trectH;
    nRectX = trectX;
    nRectY = trectY;
    btnIndex = ti;
    arrayNumber = arNum;
    /*modeText*/
    for (int i = 0; i < modesText.length; i++) {
      modesText[i] = new ModesText(nColX*4-2, nColY*7+i*25-13);
    }
  }

  /*Display Buttons*/
  void display() {
    strokeWeight(1);
    stroke(100, 0, 200);
    fill(initColor);
    if (toggle) {
      initColor = clickedColor;
    } else if (!toggle) {
      initColor = color(100, 0, 200, 100);
    }
    if (rectOver) {
      fill(rectHighlight);
    }
    rect(nRectX, nRectY, nRectW, nRectH);
    /*modeText*/
    for (int i = 0; i < modesText.length; i++) {
      modesText[i].displayMode(i+1);
    }
    noStroke();
  }

  /*Hover and Update Position of Cursor*/
  void hover() {
    if (overRect(nRectX, nRectY, nRectW, nRectH) ) {
      rectOver = true;
    } else {
      rectOver = false;
    }
  }

  void pressed() {
    if (rectOver) {
      if (mousePressed && !mouseDown) {
        mouseDown = true;
        if (!toggle) toggle = !toggle;
        if (arrayNumber == 1) {
          currentButton1=btnIndex;
        } else if (arrayNumber == 2) {
          currentButton2=btnIndex;
        } else if (arrayNumber == 3) {
          currentButton3=btnIndex;
        }
      } else if (!mousePressed) {
        mouseDown = false;
      }
    }
  }


  /*Change Color and Toggle*/
  void toggleBtn() {
    if (rectOver) {
      initColor = clickedColor;
      if (toggle) {
        initColor = color(100, 0, 200, 100);
      }
      toggle = !toggle;
    }
  }
}

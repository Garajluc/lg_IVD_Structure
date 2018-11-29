class Button {
  /*-----------------------------------Objects-----------------------------------*/
  int nRectX, nRectY, nRectW, nRectH; //x and y position, width and height dimensions
  color initColor; // initial color of button
  color clickedColor = colors[0]; // color after click
  color rectHighlight = colors[1]; // mouse over the button color
  boolean rectOver = false; // mouse over the button
  boolean toggle = false; // toggle change color
  int btnIndex; // button index passed into constructor
  boolean mouseDown = true; // boolean for duble chenking if the mouse is pressed 
  int arrayNumber; // indicates whitch one of buttons array was clicked

  /*-----------------------------------Start Constructor-----------------------------------*/
  Button(int trectX, int trectY, int trectW, int trectH, int ti, int arNum) {
    nRectW = trectW;
    nRectH = trectH;
    nRectX = trectX;
    nRectY = trectY;
    btnIndex = ti; 
    arrayNumber = arNum;
  }
  /*-----------------------------------End Constructor-----------------------------------*/

  ///*-----------------------------------Start Methods-----------------------------------*/
  void display(int offx, int offy) { // offx, offy = offset from outlined rectangle 
    // outlined rectangle
    strokeWeight(1);
    stroke(colors[0]);
    fill(colors[3]); // #000000
    rect(nRectX, nRectY, nRectW, nRectH);
    fill(initColor);

    if (rectOver) { // when is cursor over the are the button highlights
      fill(rectHighlight);
    }
    
    // toto musi byt pod condition rectOver inak mi nefunguje highlight
    rect(nRectX+offx, nRectY+offx, nRectW-offy, nRectH-offy);
    fill(colors[0]);
    ellipse(nRectX+nRectH/2, nRectY+nRectH/2, 3, 3);

    if (toggle) { // color toggle on click between buttons in one array
      initColor = clickedColor;
      stroke(colors[3]);
      fill(colors[3]);
      ellipse(nRectX+nRectH/2, nRectY+nRectH/2, 3, 3);
    } else if (!toggle) {
      initColor = colors[3];
    }
    noStroke();
  }

  /*Checking if mouse if over specific area of button*/
  void hover() {
    if (mouseX >= nRectX && mouseX <= nRectX+nRectW && 
      mouseY >= nRectY && mouseY <= nRectY+nRectH ) {
      rectOver = true;
    } else {
      rectOver = false;
    }
  }

  void pressed() {
    if (rectOver) {
      if (mousePressed && !mouseDown) {
        mouseDown = true;
        /*When is diffrent button clicked the color changes*/
        if (!toggle) {
          toggle = !toggle;
        }
        /*Specification whitch of buttons array I am cliking on*/
        if (arrayNumber == 1) { // 1 = carriage condition
        /* if array of carriage condition buttons is clicked 
        then pass the value of index of the specific 
        index of clicked button to the varieable carriageConditionButtonIndexArr*/          
          carriageConditionButtonArrIndex = btnIndex;
        } else if (arrayNumber == 2) { // 2 = main display
          mainDisplayButtonArr = btnIndex;
              println("cB2");
        } else if (arrayNumber == 3) { // 3 = control panel
          controlPanelButtonArr = btnIndex;
              println("cB3");
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
      toggle = !toggle;
    }
  }
  /*-----------------------------------End Methods-----------------------------------*/
}

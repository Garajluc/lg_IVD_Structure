class Button {
  /*-----------------------------------Objects-----------------------------------*/
  //ModesText[] modesText = new ModesText[5];

  int nRectX, nRectY, nRectW, nRectH; //x and y position, width and height dimensions
  color initColor; // initial color of button
  color clickedColor = colors[0]; // color after click
  color rectHighlight = colors[1]; // mouse over the button color
  boolean rectOver = false; // mouse over the button
  boolean toggle = false; // toggle change color

  int btnIndex; // button index passed into constructor
  
  boolean mouseDown = true;
  int arrayNumber;

  /*-----------------------------------Start Constructor-----------------------------------*/
  Button(int trectX, int trectY, int trectW, int trectH, int ti, int arNum) {
    nRectW = trectW;
    nRectH = trectH;
    nRectX = trectX;
    nRectY = trectY;
    btnIndex = ti;
    arrayNumber = arNum;
    
    
    /*modeText*/
    //for (int i = 0; i < modesText.length; i++) {
    //  modesText[i] = new ModesText(nColX*4-2, nColY*7+i*25-13);
    //}
    
    
  }
  /*-----------------------------------End Constructor-----------------------------------*/

  ///*-----------------------------------Start Methods-----------------------------------*/
  void display(int offx, int offy) {
    strokeWeight(1);
    stroke(colors[0]);
    fill(colors[3]);
    rect(nRectX, nRectY, nRectW, nRectH); // creating the button
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

    /*modeText*/
    //for (int i = 0; i < modesText.length; i++) {
    //  modesText[i].displayMode(i+1);
    //}
    noStroke();
  }

  /*Hover and Update Position of Cursor*/
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
        /*Connecting specific value of button according to button index from array*/
        if (arrayNumber == 1) { // if index=1 (the second element of array)
          currentButton1=btnIndex;
          println("cB1");
        } else if (arrayNumber == 2) {
          currentButton2=btnIndex;
              println("cB2");
        }
        else if (arrayNumber == 3) {
          currentButton3=btnIndex;
              println("cB3");
        }
      } 
      else if (!mousePressed) {
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
  /*-----------------------------------End Methods-----------------------------------*/
}

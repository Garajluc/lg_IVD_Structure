class QueryPanel {
  Button[] queryButton = new Button[20];
  int x; // x position of buttons
  int y; // y position of button

  QueryPanel() {
    // this is NOT a LOOP
    // creating two rows of the same button array
    for (int i = 0; i < queryButton.length; i++) {
      if (i < 10) { // first row 
        x = nBorder+(i*20);
        y = nColY*5+40;
      } else { // second row
        x = (i*20)-160;
        y = nColY*5+60;
      }
      queryButton[i] = new Button(x, y, 20, 20, i, 0);
    }
  }

  void display() {
    for (int i = 0; i < queryButton.length; i++) {
      queryButton[i].display(0,0);
      queryButton[i].hover();
    }
    // conditions must be inside the loop to be updated everytame the state changes
    if (queryButton[0].initColor == queryButton[0].clickedColor) {
      colorModeSlider.display();
      colorModeSlider.move();
    }
    if (queryButton[4].initColor == queryButton[4].clickedColor) {
      //audioVisualiser.on();
    }
  }
}

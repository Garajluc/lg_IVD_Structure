class QueryPanel {
  Button[] queryButton = new Button[20];
  Frame frame;
  int x; // x position of buttons
  int y; // y position of button
  boolean audioOn = false;

  PImage portrait;

  QueryPanel() {
    portrait = loadImage("portrait.png");
    frame = new Frame(nBorder, 3*nColY+nColY/2, nColX*2, nColY*2+40);
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
      queryButton[i].display(0, 0);
      queryButton[i].hover();
    }

    if (!audioOn) {
      frame.display();
      fill(colors[0]);
      textFont(pressStart);
      image(portrait, nBorder+10, 290);
      textSize(12);
      text("-WELCOME-", nBorder +80, 300);
      textSize(10);
      text("Statues: Active", nBorder +80, 320);
      text("SBnkcd^**hbs%#$%#vsk", nBorder +10, 385);
      text("csduiin78943wn5c&*T #vsk", nBorder+10, 395);
      text("dskj^% u839h u7t73t439 *()", nBorder+10, 405);
    }

    // conditions must be inside the loop to be updated everytame the state changes
    /*Display Color mode slider*/
    if (queryButton[0].initColor == queryButton[0].clickedColor
      && queryButton[19].initColor == queryButton[19].clickedColor) {
      colorModeSlider.display();
      colorModeSlider.move();
    }
    /*Record Audio*/
    if (queryButton[4].initColor == queryButton[4].clickedColor 
      && queryButton[9].initColor == queryButton[9].clickedColor
      && queryButton[10].initColor == queryButton[10].clickedColor) {
      audioVisualiser.on();
    }
    if (queryButton[4].initColor == queryButton[4].clickedColor 
      && queryButton[9].initColor == queryButton[9].clickedColor) {
      audioVisualiser.display();
      //audioVisualiser.on();
      audioOn = true;
    } else if (queryButton[4].initColor != queryButton[4].clickedColor 
      || queryButton[9].initColor != queryButton[9].clickedColor) {
      audioOn = false;
    }
  }
}

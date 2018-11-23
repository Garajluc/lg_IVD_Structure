class DigitalClock {
  /*-----------------------------------Objects-----------------------------------*/
  Frame headerFrame;
  /*-----------------------------------Variables-----------------------------------*/
  int x;
  int y;
  int hour, minute, second;
  int day, month, year;
  float colorMode;

  /*-----------------------------------Start Constructor-----------------------------------*/
  DigitalClock(int tx, int ty) {    
    headerFrame = new Frame(nBorder, nColY/2, nColX*2, nColY/2);

    x = tx;
    y = ty;
  }
  /*-----------------------------------End Constructor-----------------------------------*/

  /*-----------------------------------Start Method-----------------------------------*/
  void display(float colorMode) {
    headerFrame.display();

    noStroke();
    fill(colors[4]);
    textSize(24);
    text("C-MIST", x+5,y+17);
    textSize(10);
    time();
    date();
  }

  void time() {
    hour = hour();
    minute = minute();
    second = second();
    text (hour + ":" + nf(minute, 2) + ":" + nf(second, 2), x+135, y);
  }

  void date() {
    day = day();
    month = month();
    year = year();
    text (day + "/" + month + "/" + year, x+120, y+17);
  }
  /*-----------------------------------End Method-----------------------------------*/
}

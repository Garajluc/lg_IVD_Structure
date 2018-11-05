class DigitalClock {
  int x;
  int y;
  int hour,minute,second;
  int day, month, year;
  float colorMode;
  
  DigitalClock(int tx, int ty) {
    x = tx;
    y = ty;
  }
  
  void display(float colorMode) {
    noStroke();
    fill(255-colorMode);
    textSize(15);
    time();
    date();
    fill(0);
  }
  
  void time() {
    hour = hour();
    minute = minute();
    second = second();
    text (hour + ":" + nf(minute, 2) + ":" + nf(second, 2), x, y);
  }
  
  void date() {
    day = day();
    month = month();
    year = year();
    text (day + "/" + month + "/" + year, x+100, y);
  }

}

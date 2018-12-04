class Carriage {
  int x, y, w, h;
  PImage carriage;

  Carriage(int tx, int ty, int tw, int th) {
    x = tx;
    y = ty;
    w = tw;
    h = th;
    carriage = loadImage("layout/carriage.png");
  }

  void display() {
    image(carriage, x+140, y);
    stroke(colors[0]);
    line(x+nColX*2, nColY+nColY/2, x+nColX*2, nColY*6-20);
    line(x+nColX*2+5, nColY+nColY/2, x+nColX*2+5, nColY*6-20);
    // tuto potrebujem nejaku vec ako su tie auticka aby som mala pohyblive ciary
    info();
  }

  void info() {
    noFill();
    rect(x, y+5, w, h);
    ellipse(x+nColX*2+30, y+10, 5, 5);
    ellipse(x+nColX*2+30, y+30, 5, 5);
    fill(colors[0]);
    textSize(10);
    text("Open", x+nColX*2+38, y+14);
    text("Close", x+nColX*2+38, y+35);
  }
}

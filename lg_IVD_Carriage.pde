class Carriage{
  int x,y,w,h;
  PImage carriage;
  
  Carriage(int tx, int ty, int tw, int th) {
    x = tx;
    y = ty;
    w = tw;
    h = th;
    carriage = loadImage("carriage_00.png");
  }
  
  void display() {
    strokeWeight(1);
    stroke(100,0,200);
    noFill();
    rect(x,y,w,h);
    image(carriage,x+180,y, 80,70);
    noStroke();
  }
}

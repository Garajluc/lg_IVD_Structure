PFont robotoLight;

class ModesText {
  int x;
  int y;

  ModesText(int tx, int ty) {
    x = tx;
    y = ty;
    robotoLight = createFont("Roboto-Light.ttf",15);
  }

  void displayMode(int i) {
    fill(255);
    textFont(robotoLight);
    text("Mode "+i, x, y);
    noFill();
  }
}

class WelcomeScreen {

  float xa;
  float ya;
  float easing = 0.05;

  boolean start = false;
  boolean hoverOne = false;
  boolean hoverTwo = false;

  WelcomeScreen() {
  }

  void display() {
    if (!start) {
      fill(0, 50);
      pointGrid(5, 5, 28, 28, 2, 209, 219, 189, 120);
      pointGrid(9, 6, 28, 28, 1, 252, 255, 245, 80);
      rect(0, 0, width, height);
      stroke(255);
      rect(0, 0, 100, 100);
      rect(0, 150, 100, 100);
      if (mousePressed) {
        fill(255);
        stroke(255);
        float targetX = mouseX;
        float dx = targetX - xa;
        xa += dx * easing;

        float targetY = mouseY;
        float dy = targetY - ya;
        ya += dy * easing;

        ellipse(xa, ya, 20, 20);
        if (xa > 30 && xa < 70 && ya > 30 && ya < 70) {
          hoverOne = true;
        } else if (xa > 30 && xa < 70 && ya > 180 && ya < 220 && hoverOne) {
          hoverTwo = true;
        }
      }
      if (hoverOne && hoverTwo) {
        start = true;
      }
    }
  }
}

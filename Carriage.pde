class Carriage {
  /*-----------------------------------Variables-----------------------------------*/
  int x, y, w, h;
  PImage carriage;
  float yoffUp = 20;
  float yoffDown = 20;
  /*-----------------------------------Start Constructor-----------------------------------*/
  Carriage(int tx, int ty, int tw, int th) {
    x = tx;
    y = ty;
    w = tw;
    h = th;
    carriage = loadImage("layout/carriage.png");
  }
  /*-----------------------------------End Constructor-----------------------------------*/

  /*-----------------------------------Start Methods-----------------------------------*/
  void display() {
    image(carriage, x+140, y);
    stroke(colors[0]);
    line(x+nColX*2, nColY+nColY/2, x+nColX*2, nColY*6-20);
    line(x+nColX*2+5, nColY+nColY/2, x+nColX*2+5, nColY*6-20);
    info();
  }

  void info() {
    noFill();
    rect(x, y+5, w, h);
    ellipse(x+nColX*2+30, y+10, 5, 5);
    ellipse(x+nColX*2+30, y+30, 5, 5);
    textSize(10);
    fill(colors[0]);
    text("Open", x+nColX*2+38, y+14);
    text("Close", x+nColX*2+38, y+35);
    stroke(colors[0]);
    fill(colors[0]);
    ellipse(x+nColX*2+30, y+30, 5, 5);
    if (controlPanel.lightDoorButton[1].initColor != controlPanel.lightDoorButton[1].clickedColor && controlPanel.increment <= 0) {
      stroke(colors[0]);
      fill(colors[0]);
      ellipse(x+nColX*2+30, y+30, 5, 5);
    } else if (controlPanel.lightDoorButton[1].initColor == controlPanel.lightDoorButton[1].clickedColor && controlPanel.increment <= 0) {
      stroke(colors[2]); // yellow
      fill(colors[2]);
      ellipse(x+nColX*2+30, y+10, 5, 5);
      fill(colors[2]);
      textSize(10);
      text("Open", x+nColX*2+38, y+14);
      stroke(colors[0]);
      fill(colors[3]);
      ellipse(x+nColX*2+30, y+30, 5, 5);
    }

    if (controlPanel.lightDoorButton[1].initColor != controlPanel.lightDoorButton[1].clickedColor) {
      if (yoffUp < 20) {
        yoffUp += 0.2;
      }
      if (yoffDown > 20) {
        yoffDown -= 0.2;
      }
      stroke(colors[0]);
      fill(colors[0]);
    } else if (controlPanel.lightDoorButton[1].initColor == controlPanel.lightDoorButton[1].clickedColor) {
      if (yoffUp > 5) {
        yoffUp -= 0.2;
      }
      if (yoffDown < 35) {
        yoffDown += 0.2;
      }
      stroke(colors[2]);
      fill(colors[2]);
    }

    ellipse(x+nColX*2, y+yoffUp, 5, 5);
    ellipse(x+nColX*2, y+yoffDown, 5, 5);
  }
  /*-----------------------------------End Methods-----------------------------------*/
}

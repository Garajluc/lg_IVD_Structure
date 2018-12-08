class Waves {
  /*-----------------------------------Variables-----------------------------------*/
  int cols, rows;
  int scl = 12;
  int w = 570;
  int h = 150;
  float flying = 0;
  float[][] terrain;
  /*-----------------------------------Start Constructor-----------------------------------*/
  Waves() {
    cols = w / scl;
    rows = h/ scl;
    terrain = new float[cols][rows];
  }
  /*-----------------------------------End Constructor-----------------------------------*/
  /*-----------------------------------Start Method-----------------------------------*/
  void display() {
    if (controlPanel.increment > 0) {
      flying -= controlPanel.increment*0.3;
    } else if (controlPanel.increment < 0) {
      flying = flying;
    }

    float yoff = flying;
    for (int y = 0; y < rows; y++) {
      float xoff = 0;
      for (int x =0; x < cols; x++) {
        terrain[x][y] = map(noise(xoff, yoff), 0, 1, -30, 30);
        xoff += 0.1;
      }
      yoff += 0.1;
    }

    noFill();
    stroke(colors[0]);

    translate(325, 395);
    rotateX(PI/2.5);

    for (int y = 0; y < rows-1; y++) {
      beginShape(TRIANGLE_STRIP);
      for (int x =0; x < cols; x++) {
        vertex(x*scl, y*scl, terrain[x][y]);
        vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      }
      endShape();
    }

    translate(-325, -395);
    rotateX(-(PI/2.5));
  }
  /*-----------------------------------End Method-----------------------------------*/
}

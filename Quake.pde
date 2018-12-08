class quake {
  /*-----------------------------------Variables-----------------------------------*/
  float fy;//lat
  float fx;//long
  float fmag; 
  float flat;
  float flong;
  String szloc;
  boolean bhover = false;
  /*-----------------------------------Start Constructor-----------------------------------*/
  quake(float tlat, float tlong, String tsloc, float tfmag) {
    flat = tlat;
    flong = tlong;
    fmag = tfmag;
    szloc = tsloc;
    fy = map(flat, 90, -90, mapy, mapy + maph);
    fx = map(flong, -180, 180, mapx, mapx + mapw);
  }
  /*-----------------------------------End Constructor-----------------------------------*/
  /*-----------------------------------Start Method-----------------------------------*/
  void display() {
    if (bhover) { 
      szquaketext = szloc;
      fill(colors[2]);
    } else fill(colors[0], map(fmag, 0, 8, 150, 100));
    ellipse(fx, fy, 3*fmag, 3*fmag);
  }

  void checkMouse() {
    if (dist(mouseX, mouseY, fx, fy) < fmag/2) {
      bhover = true;
    } else bhover = false;
  }
  /*-----------------------------------End Method-----------------------------------*/
}

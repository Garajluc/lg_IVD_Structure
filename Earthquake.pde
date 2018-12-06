int mapx = nBorder+nColX*2+50;
int mapy = nColY;
int mapw = nColX*6;
int maph = nColY*3+40;
String szquaketext = "";

class Earthquake {
  Table table;
  quake[] arQuakes;
  PImage quakemap;

  Earthquake() {
    populateArrayFromTable();
    quakemap = loadImage("jr_worldmap.png");
  }

  void display() {
    float fmagcheck = 5;
    image(quakemap, mapx, mapy, mapw, maph);
    noStroke();
    for (int i = 0; i < arQuakes.length; i++) {
      arQuakes[i].checkMouse();
      if (!arQuakes[i].bhover && arQuakes[i].fmag > fmagcheck ) arQuakes[i].display();
    }
    for (int i = 0; i < arQuakes.length; i++) {
      arQuakes[i].checkMouse();
      if (arQuakes[i].bhover && arQuakes[i].fmag > fmagcheck) arQuakes[i].display();
    }
    fill(colors[2]);
    text(szquaketext, nColX*2+55, nColY+20);
  }

  void populateArrayFromTable() {
    table = loadTable("jr_earthquake_past7.csv", "header");
    arQuakes = new quake[table.getRowCount()];
    int nRow = 0;
    for (TableRow row : table.rows ()) {
      float tlat = row.getFloat("latitude");
      float tlong = row.getFloat("longitude");
      String tloc = row.getString("place");
      float tmag = row.getFloat("mag");
      arQuakes[nRow] = new quake(tlat, tlong, tloc, tmag);
      nRow++;
    }
  }
}

class quake {
  float fy;//lat
  float fx;//long
  float fmag; 
  float flat;
  float flong;
  String szloc;
  boolean bhover = false;


  quake(float tlat, float tlong, String tsloc, float tfmag) {

    flat = tlat;
    flong = tlong;
    fmag = tfmag;
    szloc = tsloc;
    fy = map(flat, 90, -90, mapy, mapy + maph);
    fx = map(flong, -180, 180, mapx, mapx + mapw);
  }

  void display() {
    if (bhover) { 
      szquaketext = szloc;
      fill(colors[2]);
    } else fill(colors[0], map(fmag, 0, 8, 150, 100));
    ellipse(fx, fy, 3*fmag, 3*fmag); 
  }

  void checkMouse() {
    if (dist(mouseX, mouseY, fx, fy) < 5) {
      bhover = true;
    } else bhover = false;
  }
}

/*-----------------------------------Variables-----------------------------------*/
int mapx = nBorder+nColX*2+50;
int mapy = nColY;
int mapw = nColX*6;
int maph = nColY*3+40;
String szquaketext = "";
float fmagtop = 0;
float fmagbottom = 8;

class Earthquake {
  /*-----------------------------------Objects-----------------------------------*/
  Table table;
  quake[] arQuakes;
  PImage quakemap;
  Slider sliderMagFilterTop;
  Slider sliderMagFilterBottom;
  /*-----------------------------------Start Constructor-----------------------------------*/
  Earthquake() {
    populateArrayFromTable();
    quakemap = loadImage("jr_worldmap.png");
    sliderMagFilterTop = new Slider(nColX*2+50, nColY+10, 100, 9, 0.4);
  }
  /*-----------------------------------End Constructor-----------------------------------*/
  /*-----------------------------------Start Method-----------------------------------*/
  void display() {
    image(quakemap, mapx, mapy, mapw, maph);
    noStroke();
    sliderMagFilterTop.display(2, 2);
    sliderMagFilterTop.horisontalSlider(0);
    fill(colors[2]);
    text(szquaketext, nColX*2+55, nColY*4+10);
    for (int i = 0; i < arQuakes.length; i++) {
      if (arQuakes[i].fmag < fmagtop) {
        arQuakes[i].checkMouse();
        arQuakes[i].display();
      }
    }
    fmagtop = map(sliderMagFilterTop.currentValue, 1, 0, 0, 8);
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
  /*-----------------------------------End Method-----------------------------------*/
}

class ModesText{
  int x;
  int y;
  
  ModesText(int tx, int ty) {
    x = tx;
    y = ty;
  }
  
  void display(int i) {
    fill(255);
    textSize(16);
    text("Mode"+i,x,y);
    }
  
}

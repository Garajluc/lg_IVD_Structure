void pointGrid(int cx, int cy, int ox, int oy, float w, int r, int g, int b, int t) {
  int x = cx;
  while (x < width) {
    int y = cy;
    while (y < height) {
      strokeWeight(w);
      stroke(r,g,b,t);
      point(x, y);
      y = y + oy;
    }
     x = x + ox;
  }
}

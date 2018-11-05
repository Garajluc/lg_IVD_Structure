// Reference: Week6 "jr_IVD_radarPulse_remix.zip"
class radarPulse {
  int x;
  int y;
  float r;
  
  radarPulse(int tx, int ty, float tr){
    x = tx;
    y = ty;
    r = tr;
  }
  
  void display(){
    stroke(100,0,200, 255 - r);
    fill(100,0,200, 155 - r);
    ellipse(x,y,r,r);
    r += 1;
    if(r > 255) r = 0;
    }
  
}

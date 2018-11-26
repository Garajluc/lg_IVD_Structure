// Reference: Week6 "jr_IVD_radarPulse_remix.zip"
class radarTarget{
 float x, y, rx, ry;// positions - rx = center of radar - used later
 int r; // radius
 
 float xspeed, yspeed;
 
 radarTarget(float tx, float ty, int tr){
 x = tx + random(-100,100);
 y = ty + random(-100,100);
 r = tr;
 rx = tx;
 ry = ty;
 xspeed = random(-0.1,0.2);
 yspeed = random(-0.1,0.2);
 }
 
 void display(){
  x = x + xspeed;
  y = y + yspeed;

  if(x > rx + 50) {
    x = rx + 50;
    xspeed = xspeed * -1;
  }
  if(x < rx - 50){
    x = rx - 50;
    xspeed = xspeed * -1;
  }
  if(y > ry + 50){
    y = ry + 50;
    yspeed = yspeed * -1;
  }
  if(y < ry - 50){
    y = ry - 50;
    yspeed = yspeed * -1;
  }
  
  // set colors
  noStroke();
  fill(255);
  if(dist(x,y,rx,ry) < 50) fill(100,0,200);
  ellipse(x,y,r,r); 
 }
 
}

class ColorModeSlider {
  /*moving rectangle*/
  float targetValue;
  /*background rectangle*/
  float rectX;
  float rectY;
  float rectW;
  float rectH; 
  /*line*/
  float lineX1;
  float lineX2;
  float lineLength;
  /*color*/
  float a;
  float value() {
    return a;
  }
  /*fixed rectangle*/
  float mRectY;
  float increment = 4;
  float currentValue;

  ColorModeSlider(float tRectX, float tRectY, float tRectW, float tRectH) {
    rectX = tRectX;
    rectY = tRectY;
    rectW = tRectW;
    rectH = tRectH;
    currentValue = rectX + 50;
    lineX1 = rectX + 50;
    lineX2 = rectX + rectW - 50;
    lineLength = lineX2 - lineX1;
    mRectY = rectY+rectH/2;
  }

  void display() {
    fill(0, 200);
    rect(rectX, rectY, rectW, rectH);
    stroke(255);
    fill(255);
    line (lineX1, mRectY, lineX2, mRectY);
    rect(currentValue, mRectY-40, 10, 30);
    fill(255);
    line(lineX1+5, mRectY-15, lineX1+5, mRectY-15+30);
    line(lineX1+(lineLength/3), mRectY-15, lineX1+(lineLength/3), mRectY-15+30);
    line(lineX1+(lineLength/3)*2, mRectY-15, lineX1+(lineLength/3)*2, mRectY-15+30);
    line(lineX1+lineLength-5, mRectY-15, lineX1+lineLength-5, mRectY-15+30);
    noStroke();
    noFill();
  }

  void move() {
    if (mousePressed) {
      if (mouseX >= lineX1 && mouseX <= lineX1+10 && mouseY >= mRectY-15 && mouseY <= mRectY+15) {
        targetValue=lineX1;
      } else if (mouseX >= lineX1-5+lineLength/3 && mouseX <= (lineX1+lineLength/3)+10 && mouseY >= mRectY-15 && mouseY <= mRectY+15) {
        targetValue=lineX1-5/2+lineLength/3;
      } else if (mouseX >= lineX1+(lineLength/3)*2 && mouseX <= lineX1+(lineLength/3)*2+10 && mouseY >= mRectY-15 && mouseY <= mRectY+15) {
        targetValue=lineX1-5+lineLength/3*2;
      } else if (mouseX >= lineX1+lineLength-10 && mouseX <= lineX1+lineLength && mouseY >= mRectY-15 && mouseY <= mRectY+15) {
        targetValue=lineX1-8+lineLength;
      }
    }
    
    if (targetValue == lineX1 || 
        targetValue == lineX1-5/2+lineLength/3 || 
        targetValue == lineX1-5+lineLength/3*2 || 
        targetValue == lineX1-8+lineLength) {
      a=map(currentValue,0,850,0,35);
      if ( currentValue <= targetValue) {
        currentValue = currentValue + increment;
      } 
      if (currentValue >= targetValue) {
        currentValue = currentValue - increment;
      }
    } 
  }
}

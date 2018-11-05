// Variation fo the slider from the lecture "jr_slidersFill" Week3
class SpeedSlider {
  int x;
  int y;
  int w;
  int h;
  float colorMode;

  float value() {
    return inverCurrentValue;
  }

  boolean bHover;
  float currentValue;
  float targetValue;
  float inverCurrentValue;

  SpeedSlider(int tx, int ty, int tw, int th, float tv) {
    x = tx;
    y = ty;
    w = tw;
    h = th;
    inverCurrentValue = tv;
    currentValue = 1.0 - inverCurrentValue;
  }

  void display(float colorMode) {
    stroke(255-colorMode);
    fill(colorMode);
    rect(x, y, w, h);

    bHover = false;

    if (
      mouseX > x &&
      mouseX < x + w &&
      mouseY > y &&
      mouseY < y + h) {
      bHover = true;
    }

    if (currentButton3 == 0 && bHover && mousePressed) {
      inverCurrentValue = 1.0 - ((mouseY - y)/float(h));
      constrain(currentValue, 0.0, 1.0);
    } else if (currentButton3 == 1) { 
      if (currentValue < 0.75) {
        currentValue += + 0.001;
        inverCurrentValue = 1.0-currentValue;
      } else if (currentValue > 0.75) {
        currentValue -= 0.001;
        inverCurrentValue = 1.0-currentValue;
      }
    } else if (currentButton3 == 2) {
      if (currentValue < 0.5) {
        currentValue += + 0.001;
        inverCurrentValue = 1.0-currentValue;
      } else if (currentValue > 0.5) {
        currentValue -= 0.001;
        inverCurrentValue = 1.0-currentValue;
      }
    } else if (currentButton3 == 3) {
      if (currentValue < 0.25) {
        currentValue += + 0.001;
        inverCurrentValue = 1.0-currentValue;
      } else if (currentValue > 0.25) {
        currentValue -= 0.001;
        inverCurrentValue = 1.0-currentValue;
      }
    } else if (currentButton3 == 4) {
      if (currentValue > 1) {
        currentValue += + 0.001;
        inverCurrentValue = 1.0-currentValue;
      } else if (currentValue < 1 && currentValue > 0) {
        currentValue -= 0.001;
        inverCurrentValue = 1.0-currentValue;
      }
    }
    currentValue = 1.0 - inverCurrentValue;
    noStroke();
    fill(255-colorMode);
    rect(x+1, y + (currentValue * h), w-1, inverCurrentValue * h);
    fill(0);
  }
}

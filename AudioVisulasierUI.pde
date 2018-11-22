//Reference:
//https://www.youtube.com/watch?v=XS62cBK9E7w
/*-----------------------------------Library-----------------------------------*/
import ddf.minim.analysis.*;
import ddf.minim.*;

class AudioVisualiserUI {
  /*-----------------------------------Objects-----------------------------------*/
  Rect sideBarLeftMiddle;
  Minim minim;
  AudioPlayer jingle;
  AudioInput input;
  FFT fft;

  int[][] colo=new int[300][3];
  int x, y, w, h;

  /*-----------------------------------Start Constructor-----------------------------------*/
  AudioVisualiserUI(int tx, int ty, int tw, int th) {
    sideBarLeftMiddle = new Rect(nBorder, nColY*3+40, nColX*3, nColY*3-40);
    minim = new Minim(this);
    input = minim.getLineIn();
    fft = new FFT(input.bufferSize(), input.sampleRate());
    x = tx;
    y = ty;
    w = tw;
    h = th;
  }
  /*-----------------------------------End Constructor-----------------------------------*/

  /*-----------------------------------Start Method-----------------------------------*/
  void display() {
    //sideBarLeftMiddle.display(colorModeSlider.value(), "Speaker");
    // call ellipses
    stroke(100, 0, 200);
    for (int i = 0; i < 57; i++) {
      ellipse(x+i*5, y+h/2, 0, 5);
    }
  }

  /*Turn on and off*/
  void on() {
    // ellipses in turn off mode
    fill(255, 0, 0);
    ellipse(x+15, y+5, 10, 10);
    // text Rec and ellipses in turn on mode
    textSize(15);
    text("REC", x+25, y+10);
    fft.forward(input.mix);
    for (int i = 0; i < 57; i++) {
      noFill();
      stroke(100, 0, 200);
      ellipse(x+i*5, y+h/2, 0, fft.getBand(i)+5);
    }
    noFill();
    noStroke();
  }
  /*-----------------------------------End Method-----------------------------------*/
}

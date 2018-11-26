/*-----------------------------------Library-----------------------------------*/
import processing.sound.*;

/*-----------------------------------Class-----------------------------------*/
class AudioVisualiserUI {
  /*-----------------------------------Objects-----------------------------------*/
  Frame audioFrame;
  PImage audio;
  AudioIn in;
  Amplitude amp;
  Float ampscalar = 100.0;
  Float[] amps = new Float[160];
  int x;
  int y;
  /*-----------------------------------Start Constructor-----------------------------------*/
  AudioVisualiserUI(int tx, int ty, PApplet pa) {
    audioFrame = new Frame(nBorder, 3*nColY+nColY/2, nColX*2, nColY*2+40);
    audio = loadImage("layout/audio.png");

    amp = new Amplitude(pa);
    in = new AudioIn(pa, 0);
    in.start();
    amp.input(in);
    for (int i = 0; i < amps.length; i++) {
      amps[i] = 0.0;
    }
    x = tx;
    y = ty;
  }
  /*-----------------------------------End Constructor-----------------------------------*/

  /*-----------------------------------Start Method-----------------------------------*/
  void display() {
    audioFrame.display();
    image(audio, nBorder, 3*nColY+nColY/2);

    stroke(colors[1]);
    for (int i = 0; i < amps.length -1; i++) {
      amps[i] = amps[i+1];
    }
    amps[amps.length - 1] = amp.analyze();
    for (int i = 0; i < amps.length; i++) {
      line(x + i, y - amps[i] * ampscalar, x + i, y + amps[i] * ampscalar);
    }
    // ellipses
    //stroke(colors[0]);
    //for (int i = 0; i < 33; i++) {
    //  ellipse(x+20+i*5, 4*nColY+40, 0, 5);
    //}
  }

  ///*Turn on and off*/
  //void on() {
  //  // text
  //  fill(colors[2]);
  //  ellipse(x+2*nColX-50, 4*nColY-30, 5, 5);
  //  textSize(12);
  //  text("REC", x+2*nColX-40, 4*nColY-20);
  //  // ellipse
  //  fft.forward(input.mix);
  //  for (int i = 0; i < 33; i++) {
  //    noFill();
  //    stroke(colors[0]);
  //    ellipse(x+20+i*5, 4*nColY+40, 0, fft.getBand(i)+5);
  //  }
  //  noFill();
  //  noStroke();
  //}
  /*-----------------------------------End Method-----------------------------------*/
}

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
  float n;
  int timer;
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
    line(x, y, x+160, y);
  }

  /*Turn on and off*/
  void on() {
    /*Rec text*/
    fill(colors[2]);
    ellipse(x+2*nColX-60, 4*nColY-30, 5, 5);
    textSize(10);
    text("REC", x+nColX*2-50, 4*nColY-20);

    /*Rate[hz] text*/
    fill(colors[0]);
    text("RATE[hz]", x+15, nColY*4-20);
    text(nf(int(n), 3), x+15, nColY*4-10);

    /*Mode text*/
    text("MODE", x+15, nColY*5-10);
    text("STEREO", x+nColX*2-70, nColY*5-10);

    stroke(colors[1]);
    for (int i = 0; i < amps.length -1; i++) {
      amps[i] = amps[i+1];
      if (millis() - timer >= 500) {
        n =(amps[i]*1000);
        timer = millis();
      }
    }

    amps[amps.length - 1] = amp.analyze();
    for (int i = 0; i < amps.length; i++) {
      line(x + i, y - amps[i] * ampscalar, x + i, y + amps[i] * ampscalar);
    }
  }
  /*-----------------------------------End Method-----------------------------------*/
}

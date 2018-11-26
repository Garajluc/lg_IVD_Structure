////Reference:
////https://www.youtube.com/watch?v=XS62cBK9E7w
///*-----------------------------------Library-----------------------------------*/
//import ddf.minim.analysis.*;
//import ddf.minim.*;

///*-----------------------------------Class-----------------------------------*/
//class AudioVisualiserUI {
//  /*-----------------------------------Objects-----------------------------------*/
//  Frame audioFrame;
//  PImage audio;

//  Minim minim;
//  AudioPlayer jingle;
//  AudioInput input;
//  FFT fft;

//  int[][] colo=new int[300][3];
//  int x, y, w, h;

//  /*-----------------------------------Start Constructor-----------------------------------*/
//  AudioVisualiserUI(int tx, int ty, int tw, int th) {
//    audioFrame = new Frame(nBorder, 3*nColY+nColY/2, nColX*2, nColY*2+40);
//    audio = loadImage("layout/audio.png");
    
//    minim = new Minim(this);
//    input = minim.getLineIn();
//    fft = new FFT(input.bufferSize(), input.sampleRate());
//    x = tx;
//    y = ty;
//    w = tw;
//    h = th;
//  }
//  /*-----------------------------------End Constructor-----------------------------------*/

//  /*-----------------------------------Start Method-----------------------------------*/
//  void display() {
//    audioFrame.display();
//    image(audio,nBorder, 3*nColY+nColY/2);
    
//    // ellipses
//    stroke(colors[0]);
//    for (int i = 0; i < 33; i++) {
//      ellipse(x+20+i*5, 4*nColY+40, 0, 5);
//    }
//  }

//  /*Turn on and off*/
//  void on() {
//    // text
//    fill(colors[2]);
//    ellipse(x+2*nColX-50, 4*nColY-30, 5, 5);
//    textSize(12);
//    text("REC", x+2*nColX-40, 4*nColY-20);
//    // ellipse
//    fft.forward(input.mix);
//    for (int i = 0; i < 33; i++) {
//      noFill();
//      stroke(colors[0]);
//      ellipse(x+20+i*5, 4*nColY+40, 0, fft.getBand(i)+5);
//    }
//    noFill();
//    noStroke();
//  }
//  /*-----------------------------------End Method-----------------------------------*/
//}

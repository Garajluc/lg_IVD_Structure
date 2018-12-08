class WelcomeScreen {
  float x =0;
  float xa;
  float ya;
  float easing = 0.05;

  boolean start = false;
  boolean hoverOne = false;
  boolean hoverTwo = false;
  boolean hoverThree = false;
  boolean hoverFour = false;

  PImage portrait;

  WelcomeScreen() {
    portrait = loadImage("portrait.png");
  }

  void display() {
    if (!start) {
      background(0);
      fill(0);
      strokeWeight(0.5);
      stroke(colors[0]);

      if (mousePressed) {
        if (mouseX > nBorder && mouseX < nBorder+50 
          && mouseY > nBorder && mouseY < nBorder+50) {
          hoverOne = true;
        } else if (mouseX > nBorder && mouseX < nBorder+50 
          && mouseY > nBorder+60 && mouseY < nBorder+110 && hoverOne) {
          hoverTwo = true;
        } else if (mouseX > nBorder +120 && mouseX < nBorder+170 
          && mouseY > nBorder && mouseY < nBorder+50 && hoverOne && hoverTwo) {
          hoverThree = true;
        }
      }

      rect(nBorder, nBorder, 50, 50);
      rect(nBorder, nBorder+60, 50, 50);
      rect(nBorder, nBorder+120, 50, 50);
      rect(nBorder+60, nBorder, 50, 50);
      rect(nBorder+60, nBorder+60, 50, 50);
      rect(nBorder+60, nBorder+120, 50, 50);
      rect(nBorder+120, nBorder, 50, 50);
      rect(nBorder+120, nBorder+60, 50, 50);
      rect(nBorder+120, nBorder+120, 50, 50);

      rect(nBorder, nBorder+180, 170, 50);

      if (hoverOne) {
        fill(colors[0]);
        ellipse(nBorder+25, nBorder+180+25, 10, 10);
      }
      if (hoverTwo) {
        fill(colors[0]);
        ellipse(nBorder+25+60, nBorder+180+25, 10, 10);
      }
      if (hoverThree) {
        fill(colors[0]);
        ellipse(nBorder+25+120, nBorder+180+25, 10, 10);
        textFont(pressStart);
        image(portrait, nBorder+10, 290);
        textSize(12);
        text("-WELCOME-", nBorder +80, 300);
        textSize(10);
        text("Statues: Active", nBorder +80, 320);
        text("SBnkcd^**hbs%#$%#vsk", nBorder +10, 385);
        text("csduiin78943wn5c&*T #vsk", nBorder+10, 395);
        text("dskj^% u839h u7t73t439 *()", nBorder+10, 405);
      }


      if (hoverOne && hoverTwo && hoverThree) {
        if (x < 10) {
          x +=0.1;
          println(x);
        }
        if ( x >= 10 ) {
          start = true;
        }
      }
    }
  }
}

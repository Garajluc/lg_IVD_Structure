class ControlPanelUI {
  /*-----------------------------------Objects-----------------------------------*/
  Frame controlPanelFrame;
  PressureUI pressureUI;
  Slider speedSlider;
  RadialProgressBar radialProgressBar;
  Button[] speedModeButton = new Button[4];
  Button[] lightDoorButton = new Button[2];
  /*-----------------------------------Variables-----------------------------------*/
  int x, y, w, h; // start point position: Left Up Corner of the Frame
  float currentValue; // currentValue from the .......
  int bx, by; // position of buttons

  float cv; // current position of the train between stops
  //float tv;
  float increment; // speed of the train according tu current value of radialProgressBar

  String[] buttonFunction = {"MANUAL", "MODE A", "MODE B", "STOP", "LIGHT", "DOOR"};

  PImage arrowYellow;
  PImage arrowBlue;
  PImage arrowSpeedRadialBar;

  /*show weather condition*/
  boolean pressed = false; 
  boolean mouseDown;
  // Forecast API
  XML xml;
  String apiKey = "c7120b3fe6f6c4699847bff6325327d8";
  String city;
  
  int timer;

  /*-----------------------------------Start Constructor-----------------------------------*/
  ControlPanelUI(int tx, int ty, int tw, int th) {
    x = tx;
    y = ty;
    w = tw;
    h = th;
    cv = 275;
    //tv;
    arrowYellow = loadImage("layout/arrow_yellow.png");
    arrowBlue = loadImage("layout/arrow_blue.png");
    arrowSpeedRadialBar = loadImage("layout/arrowSpeed.png");
    controlPanelFrame = new Frame(x, y, w, h);
    pressureUI = new PressureUI(x+25, y);
    speedSlider = new Slider (x+nColX*3+20, y+33, 11, 112, 0);
    radialProgressBar = new RadialProgressBar(x+nColX*4+33, y+nColY+10, 100);

    /*--------------Buttons--------------*/
    for (int i = 0; i < speedModeButton.length; i++) {
      if (i < 3) {
        bx = 70+nColX*7;
        by = y+33+i*40;
      } else {
        bx = nColX*8+55;
        by = y+33+(i*40-120);
      }
      speedModeButton[i] = new Button(bx, by, 70, 20, i, 3);
      if (i == controlPanelButtonArr) speedModeButton[i].toggle = true;
    }

    for (int i = 0; i < lightDoorButton.length; i++) {
      lightDoorButton[i] = new Button(nColX*8+55, y+73+i*40, 70, 20, i, 3);
    }
  }
  /*-----------------------------------End Constructor-----------------------------------*/

  /*-----------------------------------Start Method-----------------------------------*/
  void display() {
    controlPanelFrame.display();
    pressureUI.display(radialProgressBar.currentValue);
    radialProgressBar.display(colorModeSlider.a, speedSlider.targetValue);
    speedSlider.display(2, 2);
    speedSlider.speedSlider();

    if (controlPanel.lightDoorButton[1].initColor != controlPanel.lightDoorButton[1].clickedColor) {
      float radialSpeedCurrentVal = map(radialProgressBar.currentValue, 0, 1, 0, 112);
      image(arrowSpeedRadialBar, x+nColX*3+5, y+140-radialSpeedCurrentVal);
    } else {
      image(arrowSpeedRadialBar, x+nColX*3+5, y+140);
    }

    /*--------------Title--------------*/
    fill(colors[0]); // #FFF
    textFont(pressStart);
    textSize(10);
    text("Control Panel", x+15, y+20);
    /*--------------Message--------------*/
    fill(colors[3], 0);
    stroke(colors[0]);
    rect(x+15, y+30, 180, 115);
    /*--------------Stops--------------*/
    stops();
    move(radialProgressBar.currentValue);
    /*--------------Button--------------*/
    for (int i = 0; i < speedModeButton.length; i++) {
      if (controlPanelButtonArr != i)  speedModeButton[i].toggle = false;
      speedModeButton[i].display(4, 8);
      speedModeButton[i].hover();
      speedModeButton[i].pressed();
    }

    //for (int i = 0; i < lightDoorButton.length; i++) {
    //  lightDoorButton[i].display(4, 8);
    //  lightDoorButton[i].hover();
    //}

    lightDoorButton[0].display(4, 8);
    lightDoorButton[0].hover();
    lightDoorButton[1].display(4, 8);
    if (controlPanel.radialProgressBar.currentValue <= 0) {
      lightDoorButton[1].hover();
    }

    /*Button text*/
    fill(colors[1]);
    for (int i = 0; i < buttonFunction.length; i++) {
      if (i < 3) {
        bx = 90+nColX*7;
        by = y+47+i*40;
      } else {
        bx = nColX*8+80;
        by = y+47+(i*40-120);
      }
      text(buttonFunction[i], bx, by);
    }
  }


  /*bottom stops representation*/
  void stops() {
    rect(x+15, y+155, nColX*6+70, 35);
    line(x+35, y+180, x+nColX*6+60, y+ 180);
    fill(0 + colorModeSlider.a);
    ellipse(275, y+180, 10, 10);
    ellipse(432, y+180, 10, 10);
    ellipse(589, y+180, 10, 10);
    ellipse(746, y+180, 10, 10);
    ellipse(903, y+180, 10, 10);
    fill(colors[0]);
    stroke(colors[0]);
    ellipse(cv, y+180, 10, 10);
    image(arrowYellow, x+130, y+180);
    image(arrowBlue, x+170, y+180);
    image(arrowYellow, x+287, y+180);
    image(arrowBlue, x+327, y+180);
    image(arrowYellow, x+444, y+180);
    image(arrowBlue, x+484, y+180);
    image(arrowYellow, x+601, y+180);
    image(arrowBlue, x+641, y+180);
    text("Edinburgh", 260, y+168);
    text("Newcastle", 250+157, y+168);
    text("York", 260+157*2, y+168);
    text("Peterborough", 240+157*3, y+168);
    text("London", 245+157*4, y+168);

    // Edinburgh
    //if (dist(275, y+180, mouseX, mouseY) <= 5
    //    || dist(432, y+180, mouseX, mouseY) <= 5
    //    || dist(589, y+180, mouseX, mouseY) <= 5
    //    || dist(746, y+180, mouseX, mouseY) <= 5
    //    || dist(903, y+180, mouseX, mouseY) <= 5) {
    //  // API for forecast for Edinburghck Edinburgh
    //  //if (mousePressed && !mouseDown) {
    //  //  pressed = !pressed;
    //  //  mouseDown = true;
    //  //} else if (!mousePressed) {
    //  //  mouseDown = false;
    //  //}
    //}

    if (dist(275, y+180, mouseX, mouseY) <= 5) {
      
      //if (millis()-timer > 2000) {
      //  fill(colors[3]);
      //  rect(x+15, y+30, 180, 115);
      //  fill(colors[0]);
      //  city = "Edinburgh";
      //  String url = "http://api.openweathermap.org/data/2.5/weather?q=" + city + "&mode=xml&APPID=" + apiKey;
      //  xml = loadXML(url); 
      //  XML childrenCity = xml.getChild("city");
      //  String name = childrenCity.getString("name");
      //  XML childrenSunRise = xml.getChild("city/sun");
      //  String sunrise = childrenSunRise.getString("rise");
      //  XML childrenSunSet = xml.getChild("city/sun");
      //  String sunset = childrenSunSet.getString("set");
      //  XML childrenWind = xml.getChild("wind/speed");
      //  String windSpeed = childrenWind.getString("value");
      //  XML childrenClouds = xml.getChild("clouds");
      //  String clouds = childrenClouds.getString("name");
      //  text(name, x+25, y+50);
      //  text(sunrise, x+25, y+70);
      //  text(sunset, x+25, y+85);
      //  text("Wind Speed", x+25, y+100);
      //  text(windSpeed + " Calm", x+125, y+100);
      //  text(clouds, x+25, y+115);
      //  timer = millis();
      //}
    }
  }

  /*move the train from one stop to another*/
  void move(float radiaBarCurrentValue) {
    if (controlPanel.lightDoorButton[1].initColor != controlPanel.lightDoorButton[1].clickedColor) {
      increment = radiaBarCurrentValue*0.2;
      if (cv < 903) {
        cv = cv + increment;
      } else if (cv > 903) {
        cv = 903;
      }

      if (mouseX > 0 && mouseX < 100 && mouseY >0 && mouseY < 100) {
      }
    }
  }
  /*-----------------------------------End Method-----------------------------------*/
}

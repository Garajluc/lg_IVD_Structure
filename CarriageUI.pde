class CarriageUI {
  /*-----------------------------------Objects-----------------------------------*/
  Frame sideBarRightUp;
  Carriage[] carriage = new Carriage[5];

  /*-----------------------------------Start Constructor-----------------------------------*/
  CarriageUI() {
    sideBarRightUp = new Frame(nColX*9+nBorder, 0, nColX*3, nColY*6);
    for (int i = 0; i < carriage.length; i++) {
      carriage[i] = new Carriage(nBorder+nColX*9+20, 45+i*85, 150, 70);
    }
  }
  /*-----------------------------------End Constructor-----------------------------------*/

  /*-----------------------------------Start Method-----------------------------------*/
  void display() {
    //sideBarRightUp.display(colorModeSlider.value(), "Carriage");
    for (int i = 0; i < carriage.length; i++) {
      carriage[i].display();
    }
  }
  /*-----------------------------------End Method-----------------------------------*/
}

class CarriageUI {
  /*-----------------------------------Objects-----------------------------------*/
  Frame headerCarriageFrame;
  Frame carriageFrame;
  Carriage[] carriage = new Carriage[5];

  /*-----------------------------------Start Constructor-----------------------------------*/
  CarriageUI() {
    headerCarriageFrame = new Frame(nColX*9+nBorder, nColY/2, nColX*3, nColY/2);
    carriageFrame = new Frame(nColX*9+nBorder, nColY, nColX*3, nColY*5);
    for (int i = 0; i < carriage.length; i++) {
      carriage[i] = new Carriage(nBorder+nColX*9+20, 45+i*85, 150, 70);
    }
  }
  /*-----------------------------------End Constructor-----------------------------------*/

  /*-----------------------------------Start Method-----------------------------------*/
  void display() {
    headerCarriageFrame.display();
    carriageFrame.display();
    for (int i = 0; i < carriage.length; i++) {
      carriage[i].display();
    }
  }
  /*-----------------------------------End Method-----------------------------------*/
}

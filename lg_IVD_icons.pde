class Icons {
  PImage[] images;
  int imageCount;
  int frame;
  int x;
  int y;

  Icons(String imagePrefix, int count, int tx, int ty) {
    x = tx;
    y = ty;
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      String filename = imagePrefix + nf(i, 2) + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display() {
    for (int i = 0; i < imageCount; i++) {
      image(images[i],x+i*52,y);
    }
  }
}

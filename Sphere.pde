class Sphere {
  float angle;  
  Table table;

  float angleX;
  float angleY;

  Sphere() {
    table = loadTable("https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/significant_month.csv", "header");
  }

  void display() {
    translate(nColX*6-20, -140);

    angleY = map(mainDisplay.sliderRotation[0].currentValue, 0, 1, 0, 5);
    angleX = map(mainDisplay.sliderRotation[1].currentValue, 0, 1, 0, 5);
    rotateX(angleY);
    rotateY(angleX);
    
    fill(0);
    stroke(colors[0]);
    strokeWeight(1);
    sphereDetail(40);
    float r = 190;
    sphere(r);

    for (TableRow row : table.rows()) {
      float lat = row.getFloat("latitude");
      float lon = row.getFloat("longitude");
      float mag = row.getFloat("mag");
      float theta = radians(lat) + PI/2;
      float phi = radians(lon) + PI;
      float x = r * sin(theta) * cos(phi);
      float y = r * sin(theta) * sin(phi);
      float z = r * cos(theta);
      float alpha = map(mag, 0, 7, 150, 255);
      pushMatrix();
      if (dist(x,y,mouseX,mouseY) < 10) {
        println("nieco" + lat);
      }
      stroke(colors[2], alpha);
      translate(x, y, z);
      sphere(mag);
      popMatrix();
    }
  }
}

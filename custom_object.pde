import unlekker.util.*;
import unlekker.modelbuilder.*;

MouseNav3D nav;
UGeometry model;
PImage design;

int imgWidth = 120;
int imgHeight = 230;
//byte inc = 10;

byte c = 24; //24
byte r = 46; //46

boolean[][] pixelArray = new boolean[c][r]; //stores the cube contrast

void setup() {
  smooth();
  size(700, 700, P3D); 
  nav=new MouseNav3D(this);
  nav.trans.set(width/2,height/2,0);
  design = loadImage("iphone-photo.jpg");
  design.filter(THRESHOLD);
  image(design, 0, 0);
  loadPixels();
  
  int colCounter = 0;
  for (int j=0; j < imgWidth; j+=5) {
    int rowCounter = 0;
    for (int i = 0; i < imgHeight; i+=5) {
      int pixNum = (width*i)+j;
      float brightInt = brightness(pixels[pixNum]);
      if (brightInt < 128) {
        pixelArray[colCounter][rowCounter] = true;
      } else {
        pixelArray[colCounter][rowCounter] = false;
      }
      rowCounter++;
    }
    colCounter++;
  }
  
  buildModel();
}

void draw() {
 background(0); 
  stroke(255, 0, 0);
  noFill();
 rect(0, 0, imgWidth+1, imgHeight+1);

 image(design, 0, 0);
 lights();

 nav.doTransforms();

 noStroke();
 fill(190, 243, 255);
 model.draw(this);

}

public void mouseDragged() {
  nav.mouseDragged();
}
	
public void keyPressed() {
  nav.keyPressed();

  if(key=='s') {
    model.writeSTL(this, "shape.stl");
  }
}

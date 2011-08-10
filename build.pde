void buildModel() {

  int pixelRadius = 4;
  UGeometry b; //the box
  UGeometry[][] cubes = new UGeometry[c][r];
  
  model=new UGeometry();
  b = Primitive.box(120, 230, 4);
  model.add(b);
  
  for (int cols = 0; cols < c; cols++) {
    for(int rows = 0; rows < r; rows++) {

      if (!pixelArray[cols][rows]) {
        cubes[cols][rows] = Primitive.box(3, 3, 3);
        cubes[cols][rows].translate((cols*10) - imgWidth + 5,(rows*10) - imgHeight + 5, 4);
        model.add(cubes[cols][rows]);
      }
   }
  }
}


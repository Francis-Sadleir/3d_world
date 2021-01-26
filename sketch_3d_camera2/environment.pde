void drawMap() {

  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c == dullBlue) {
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, mossyStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, mossyStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, mossyStone, gridSize);
      }
      if (c == black) {
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, oakPlanks, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, oakPlanks, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, oakPlanks, gridSize);
      }
    }
  }
}


/*void drawInterface() {
 pushMatrix();
 stroke(255, 0, 0);
 strokeWeight(5);
 line(width/2-15, height/2, width/2+15, height/2);
 line(width/2, height/2-15, width/2, height/2+15);
 popMatrix();
 }*/




/*void drawAxis() {
 stroke(255, 0, 0);
 strokeWeight(3);
 line(0, 0, 0, 1000, 0, 0);
 line(0, 0, 0, 0, 1000, 0);
 line(0, 0, 0, 0, 0, 1000);
 }
 */




void drawFloor(int floorStart, int floorEnd, int floorHeight, int floorSpacing) {

  strokeWeight(2);
  stroke(255);

  int x = floorStart;
  int z = floorStart;
  while (z < floorEnd) {
    texturedCube(x, floorHeight, z, oakPlanks, floorSpacing);
    x = x + floorSpacing;
    if (x >= floorEnd) {
      x = floorStart;
      z = z + floorSpacing;
    }
  }
}

import java.awt.Robot;

color black = #000000;    //oakPlanks
color white = #FFFFFF;    //empty
color dullBlue = #7092BE; //mpssyBrick

int gridSize;

PImage map;
PImage mossyStone;
PImage oakPlanks;

Robot rbt;

//camera variables
float eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz;

boolean wkey, akey, skey, dkey, spacekey;

float leftRightAngle;
float upDownAngle;

float textAngle = 0;



void setup() {
  noCursor();
  textAlign(CENTER, CENTER);
  try {
    rbt = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }

  leftRightAngle = 0;
  upDownAngle = 0;

  size(displayWidth, displayHeight, P3D);

  eyex = width/2;
  eyey = 9*height/10;
  eyez = height/2;

  focusx = width/2;
  focusy = height/2;
  focusz = height/2 - 300;

  upx = 0;
  upy = 1;
  upz = 0;

  map = loadImage("map.png");

  mossyStone = loadImage("Mossy_Stone_Bricks.png");

  oakPlanks = loadImage("Oak_Planks.png");

  textureMode(NORMAL);

  gridSize = 100;
}


void draw() {
  background(0);
  //background(random(0,255),random(0,255),random(0,255),random(0,255));
  pointLight(255, 255, 255, eyex, eyey, eyez); 

  camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);

  move();
  //drawAxis();
  drawFloor(-2000, 2000, height, 100);
  drawFloor(-2000, 2000, height-gridSize*4, 100);
  drawMap();
  //drawInterface();
}


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



void move() {
  pushMatrix();
  fill(255, 0, 0);
  noStroke();
  translate(focusx, focusy, focusz);
  sphere(1);
  popMatrix();



  if (akey) {
    eyex += cos(leftRightAngle - radians(90))* 10;
    eyez += sin(leftRightAngle - radians(90))* 10;
  }
  if (dkey) {
    eyex += cos(leftRightAngle + radians(90))* 10;
    eyez += sin(leftRightAngle + radians(90))* 10;
  }

  if (wkey && canMoveForward()) {
    eyex += cos(leftRightAngle)* 10;
    eyez += sin(leftRightAngle)* 10;
  }
  if (skey && canMoveBack()) {
    eyex -= cos(leftRightAngle)* 10;
    eyez -= sin(leftRightAngle)* 10;
  }
  //if (spacekey)eyey += tan(upDownAngle)*10;

  focusx = eyex + cos(leftRightAngle)*300;
  focusy = eyey + tan(upDownAngle)*300;
  focusz = eyez + sin(leftRightAngle)*300;

  leftRightAngle = leftRightAngle + (mouseX - pmouseX)*0.0085;
  upDownAngle = upDownAngle + (mouseY - pmouseY)*0.0085;

  if (upDownAngle > PI/2.5) upDownAngle = PI/2.5;
  if (upDownAngle < -PI/2.5) upDownAngle = -PI/2.5;

  if (mouseX > width-2) rbt.mouseMove(3, mouseY);
  if (mouseX < 2) rbt.mouseMove(width-3, mouseY);
  //upDownAngle = upDownAngle-0.01;
}


boolean canMoveForward() {

  float fwdx, fwdy, fwdz;
  int mapx, mapy;


  fwdx = eyex + cos(leftRightAngle)*120;
  fwdy = eyey;
  fwdz = eyez + sin(leftRightAngle)*120;

  mapx = int(fwdx+2000) / gridSize;
  mapy = int(fwdz+2000) / gridSize;

  if (map.get(mapx, mapy) == white) {
    return true;
  } else {

    return false;
  }
}

boolean canMoveBack() {

  float fwdx, fwdy, fwdz;
  int mapx, mapy;


  fwdx = eyex + cos(leftRightAngle)*120;
  fwdy = eyey;
  fwdz = eyez + sin(leftRightAngle)*120;

  mapx = int(fwdx-2000) / gridSize;
  mapy = int(fwdz-2000) / gridSize;

  if (map.get(mapx, mapy) == white) {
    return true;
  } else {

    return false;
  }
}

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

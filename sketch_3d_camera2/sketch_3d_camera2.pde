import java.awt.Robot;

color black = #000000;
color white = #FFFFFF;

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
  eyey = height/2;
  eyez = height/2;

  focusx = width/2;
  focusy = height/2;
  focusz = height/2 - 300;

  upx = 0;
  upy = 1;
  upz = 0;

  map = loadImage("map.png");
  gridSize = 100;
}


void draw() {
  background(0);

  camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);

  move();
  //drawAxis();
  drawFloor(-2000, 2000, height, 100);
  drawFloor(-2000, 2000, 0, 100);
  drawMap();
  //drawInterface();
}


void drawMap() {

  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c!= white) {
        pushMatrix();
        fill(c);
        stroke(100);
        translate(x*gridSize-2000, height/2, y*gridSize-2000);
        box(gridSize, height, gridSize);
        popMatrix();
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

  if (wkey) {
    eyex += cos(leftRightAngle)* 10;
    eyez += sin(leftRightAngle)* 10;
  }
  if (skey) {
    eyex -= cos(leftRightAngle)* 10;
    eyez -= sin(leftRightAngle)* 10;
  }
  if (spacekey)eyey += tan(upDownAngle)*10;

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
  while (x < floorEnd) {
    //strokeWeight(5);
    //stroke(random(255), random(255), random(255), random(255));
    line (x, floorHeight, floorEnd, x, floorHeight, floorStart);
    //stroke(random(255), random(255));
    line (floorStart, floorHeight, z, floorEnd, floorHeight, z);
    x = x + floorSpacing;
    z = z + floorSpacing;
  }
}

import java.awt.Robot;

Robot rbt;

//camera variables
float eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz;

boolean wkey, akey, skey, dkey;

float leftRightAngle;
float upDownAngle;



void setup() {
  noCursor();
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
}


void draw() {
  background(0);

  camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);

  move();
  drawAxis();
  drawFloor(-2000, 2000, height, 100);
  drawFloor(-2000, 2000, 0, 100);
  drawInterface();
}

void drawInterface() {
  pushMatrix();
  stroke(255, 0, 0);
  strokeWeight(5);
  line(width/2-15, height/2, width/2+15, height/2);
  line(width/2, height/2-15, width/2, height/2+15);
  popMatrix();
}

void move() {

  pushMatrix();
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

void drawAxis() {
  stroke(255, 0, 0);
  strokeWeight(3);
  line(0, 0, 0, 1000, 0, 0);
  line(0, 0, 0, 0, 1000, 0);
  line(0, 0, 0, 0, 0, 1000);
}


void drawFloor(int floorStart, int floorEnd, int floorHeight, int floorSpacing) {

  stroke(255);
  strokeWeight(2);
  int x = floorStart;
  int z = floorStart;
  while (x < floorEnd) {
    line (x, floorHeight, floorEnd, x, floorHeight, floorStart);
    line (floorStart, floorHeight, z, floorEnd, floorHeight, z);
    x = x + floorSpacing;
    z = z + floorSpacing;
  }
}

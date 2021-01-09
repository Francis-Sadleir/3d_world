import java.awt.Robot;

Robot rbt;

//camera variables
float eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz;

boolean wkey, akey, skey, dkey, spacekey;

float leftRightAngle;
float upDownAngle;

float textAngle = 0;
ArrayList<Snowflake> snowList;


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
  snowList = new ArrayList<Snowflake>();

  int i = 0;
  while (i < 100) {
    snowList.add( new Snowflake() );
    i = i + 1;
  }
}


void draw() {
  background(0);

  camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);

  move();
  //drawAxis();
  drawFloor(-4000, 4000, height, 100);
  drawFloor(-4000, 4000, 0, 100);

  //drawInterface();
  drawText();

  drawSnow();
}

/*void drawInterface() {
 pushMatrix();
 stroke(255, 0, 0);
 strokeWeight(5);
 line(width/2-15, height/2, width/2+15, height/2);
 line(width/2, height/2-15, width/2, height/2+15);
 popMatrix();
 }*/

void drawText() {
  pushMatrix();
  rotateY(textAngle);
  textSize(250);
  fill(random(100, 200), random(100, 200), random(100, 200));
  text("FRANCIS LAND", 0, 200);
  popMatrix();
  textAngle += 0.01;

  pushMatrix();
  fill(random(100, 200));
  strokeWeight(4);
  translate(0, -1000, 0);
  sphere(300);
  popMatrix();
}

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

void drawSnow() {
  int i = 0;
  while (i < 100) {
    Snowflake mySnowflake = snowList.get(i);
    mySnowflake.act();
    mySnowflake.show();
    i = i + 1;
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
  int x = floorStart;
  int z = floorStart;
  while (x < floorEnd) {
    //strokeWeight(5);
    stroke(random(255), random(255), random(255), random(255));
    line (x, floorHeight, floorEnd, x, floorHeight, floorStart);
    stroke(random(255), random(255));
    line (floorStart, floorHeight, z, floorEnd, floorHeight, z);
    x = x + floorSpacing;
    z = z + floorSpacing;
  }
}

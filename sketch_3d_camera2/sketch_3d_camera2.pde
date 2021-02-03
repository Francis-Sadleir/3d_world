import java.awt.Robot;

color black = #000000;    //oakPlanks
color white = #FFFFFF;    //empty
color dullBlue = #7092BE; //mpssyBrick
color red, blue, yellow, grey;


int mode;

final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

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

ArrayList<GameObject> objects;

PGraphics world;
PGraphics HUD;

void setup() {
  mode = GAME;


  world = createGraphics(width, height, P3D);
  HUD = createGraphics(width, height, P2D);

  objects = new ArrayList<GameObject>();
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

  size(displayWidth, displayHeight, P2D);

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



  gridSize = 100;

  objects.add(new Target());

  int i = 0;
  while (i < 100) {
    objects.add(new Snow());
    i = i + 1;
  }
}


void draw() {
  world.beginDraw();

  world.textureMode(NORMAL);

  world.background(0);
  //background(random(0,255),random(0,255),random(0,255),random(0,255));
  world.pointLight(255, 255, 255, eyex, eyey, eyez); 

  world.camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);

  move();
  //drawAxis();
  drawFloor(-2000, 2000, height, 100);
  drawFloor(-2000, 2000, height-gridSize*4, 100);
  drawMap();
  //drawInterface();

  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println ("ERROR! Mode is " + mode);
  }


  int i = 0;
  while (i < objects.size()) {
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();
    if (obj.lives == 0) {
      objects.remove(i);
    } else {
      i++;
    }
  }
  world.endDraw();
  image(world, 0, 0);

  HUD.beginDraw();
  HUD.clear();

  drawCrosshair();
  drawMinimap();
  drawEffects();

  HUD.endDraw();


  image(HUD, 0, 0);
}

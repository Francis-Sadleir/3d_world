/*
Francis Sadleir Programming 12

Controls: WASD to move. P to pause in game.


Hello Mr. Pelletier, thanks so much for a super fun quarter! It makes me so sad that we couldn't have a normal year, but this was an excellent experience none the less.
I was unable to get my target to move around when it gets hit, as I ran out of time. I just really struggled with time management this quarter. If I had more time I would 
make it so that my target moves when it gets hit and in general I feel I would've been more creative with this project. Anyways thanks so much for everything and I'll see you around!

-Francis
*/





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

Target target;

//camera variables
float eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz;

boolean wkey, akey, skey, dkey, pkey, spacekey;

float leftRightAngle;
float upDownAngle;

float textAngle = 0;

ArrayList<GameObject> objects;


PGraphics world;
PGraphics HUD;


void setup() {
  mode = INTRO;


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
  
  int i = 0;
  while (i < 100) {
    objects.add(new Snow());
    i++;
  }

  gridSize = 100;
  
  objects.add (new Target()); 
 
  target = new Target();
}


void draw() {

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

  

  
  
}

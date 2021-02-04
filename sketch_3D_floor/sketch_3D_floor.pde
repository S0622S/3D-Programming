import java.awt.Robot;

color black = #000000;
color white = #FFFFFF;
color dullBlue = #6195B4;
color red = #FF500F;
color rblack = #640000;

int gridSize;

PImage mossyStone;
PImage map;
PImage oakPlanks;

Robot rbt;

//camera variablees
float eyex, eyey, eyez, focusy, focusx, focusz, upx, upy, upz;

int floorStart, floorEnd, floorHeight, floorSpacing;
int mode;
int t, t2, T;
int nEnemy;
int score, Lives;
int rad;

final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

boolean wkey, akey, skey, dkey;

//rotation variables
float leftRightAngle, upDownAngle;

ArrayList<GameObject> objects;

//canvases
PGraphics world;
PGraphics HUD;

void setup() {  
  //create canvases
  world = createGraphics(width, height, P3D);
  HUD   = createGraphics(width, height, P2D);

  t = 30;
  t2 = 0;

  score = 0;
  Lives = 3;

  mode = INTRO;

  objects = new ArrayList<GameObject>();

  mossyStone = loadImage("Mossy_Stone_Bricks.png");
  oakPlanks = loadImage("Oak_Planks.png");

  noCursor();

  try {
    rbt = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }



  size(displayWidth, displayHeight, P2D);

  leftRightAngle = 0;
  upDownAngle = 0;

  focusx = width/2;
  focusy = height/2;
  focusz = height/2;

  eyex = width/2;
  eyey = 9*height/10;
  eyez = height/2 - 300;

  upx = 0;
  upy = 1;
  upz = 0;

  floorStart = -2000;
  floorEnd = 2000;
  floorHeight = height;
  floorSpacing = 100;


  /////////////////Gif Animation///////////
  //frame = 0;
  //leadingZero = "0";
  //gif = new PImage[15];
  //for (int i = 0; i < 15; i++) {
  //  if ( i >= 10) {
  //    leadingZero = "";
  //  }
  //  gif[i] = loadImage("frame_" + leadingZero + i + "_delay-0.03s.png");
  //}
  //////////////////////////////////////////


  map = loadImage("map.png");
  gridSize = 100;

  for (int i = 0; i < 20; i++) {
    objects.add(new Enemy());
  }

  for (int i = 0; i < 1; i++) {
    objects.add(new redEnemy());
  }
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
    println("Error: Mode is " + mode);
  }
}

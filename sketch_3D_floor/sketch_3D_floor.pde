import java.awt.Robot;

color black = #000000;
color white = #FFFFFF;
color dullBlue = #6195B4;

int gridSize;

PImage mossyStone;
PImage map;
PImage oakPlanks;

Robot rbt;

//camera variablees
float eyex, eyey, eyez, focusy, focusx, focusz, upx, upy, upz;

int floorStart, floorEnd, floorHeight, floorSpacing;

boolean wkey, akey, skey, dkey;

//rotation variables
float leftRightAngle, upDownAngle;

ArrayList<GameObject> objects;

void setup() {
  
  objects = new ArrayList<GameObject>();

  mossyStone = loadImage("Mossy_Stone_Bricks.png");
  oakPlanks = loadImage("Oak_Planks.png");
  textureMode(NORMAL);


  noCursor();
  try {
    rbt = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }

  size(displayWidth, displayHeight, P3D);

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
  frame = 0;
  leadingZero = "0";
  gif = new PImage[15];
  for (int i = 0; i < 15; i++) {
    if ( i >= 10) {
      leadingZero = "";
    }
    gif[i] = loadImage("frame_" + leadingZero + i + "_delay-0.03s.png");
  }
  //////////////////////////////////////////


  map = loadImage("map.png");
  gridSize = 100;
}

void draw() {
  background(0);

  //lights();
  pointLight(255, 255, 255, eyex, eyey, eyez);
  camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);
  drawAxis();
  drawFloor( -2000, 2000, height, gridSize);  //floor
  drawFloor( -2000, 2000, height-gridSize*4, gridSize);  //height
  drawInterface();
  //drawGIF(0, 0, 0, gif[frame], 100);
  drawMap();

  move();
  
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

}

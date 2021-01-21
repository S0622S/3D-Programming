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

void setup() {

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

  drawAxis();
  drawFloor( -2000, 2000, height, 100);  //floor
  drawFloor( -2000, 2000, height-gridSize*3, 100);  //height
  drawInterface();
  //drawGIF(0, 0, 0, gif[frame], 100);
  drawMap();

  camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);

  move();
}



void drawMap() {
  for (int x = 0; x < map.width; x++ ) {
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



void drawInterface() {

  stroke(255, 0, 0);
  strokeWeight(5);
  line(width/2-15, height/2, width/2+15, height/2);
  line(width/2, height/2-15, width/2, height/2+15);
}

void move() {

  pushMatrix();
  translate(focusx, focusy, focusz);
  sphere(5);
  popMatrix();

  if (dkey) {
    eyex += cos(leftRightAngle + PI/2) * 10;
    eyez += sin(leftRightAngle + PI/2) * 10;
  }

  if (akey) {
    eyex += cos(leftRightAngle - PI/2) * 10;
    eyez += sin(leftRightAngle - PI/2) * 10;
  }

  if (skey) {
    eyex -= cos(leftRightAngle) * 10;
    eyez -= sin(leftRightAngle) * 10;
  }

  if (wkey) {
    eyex += cos(leftRightAngle) * 10;
    eyez += sin(leftRightAngle) * 10;
  }

  focusx = eyex + cos(leftRightAngle) * 300;
  focusy = eyey + tan(upDownAngle) * 300;
  focusz = eyez + sin(leftRightAngle) * 300;

  leftRightAngle = leftRightAngle + (mouseX-pmouseX) * 0.01;

  upDownAngle = upDownAngle + (mouseY - pmouseY) * 0.01;

  //if (upDownAngle > PI/2.1) upDownAngle = PI/2.1;
  //if (upDownAngle < -PI/2.1) upDownAngle = -PI/2.1;

  //if (abs(pmouseX - mouseX) < width - 2) rbt.mouseMove(2, mouseY);
  //if (mouseX < 1) rbt.mouseMove(width-3, mouseY);

  if (mouseX > width - 2) {
    if (abs(mouseX - 0) < 5) {
      rbt.mouseMove(2, mouseY);
    }
  }

  if (mouseX < 1) {
    if (abs(mouseX - width) < 5) {
      rbt.mouseMove(2, mouseY);
    }
  }
}

void drawAxis() {
  stroke(255, 0, 0);
  strokeWeight(3);
  line(0, 0, 0, 2000, 0, 0);
  line(0, 0, 0, 0, 2000, 0);
  line(0, 0, 0, 0, 0, 2000);
}

void drawFloor(int floorStart, int floorEnd, int floorHeight, int floorSpacing) {
  stroke(255);
  strokeWeight(0.5);
  //line(width/2, height, -1000, width/2, height, 1000);
  int x = floorStart;
  int z = floorStart;
  while (x < 2000) {
    line(x, floorHeight, floorStart, x, floorHeight, floorEnd);
    line(floorStart, floorHeight, z, floorEnd, floorHeight, z);

    z = z + floorSpacing;

    x = x + floorSpacing;
  }
}

void game() {
  noCursor();



  world.beginDraw();
  world.textureMode(NORMAL);
  world.background(0);

  //lights();
  world.pointLight(255, 255, 255, eyex, eyey, eyez);
  world.camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);

  drawAxis();
  drawFloor( -2000, 2000, height, gridSize);  //floor
  drawSky( -2000, 2000, height-gridSize*10, gridSize);  //height
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

  world.endDraw();
  image(world, 0, 0);


  HUD.beginDraw();  
  HUD.clear();    //working as a background();
  drawCrosshair();
  drawMinimap();
  drawScore();
  HUD.endDraw();
  image(HUD, 0, 0);

  int j = 0;
  while (j < objects.size()) {
    GameObject obj = objects.get(j);
    if (obj instanceof Bullet2)
      if (dist(eyex, eyey, eyez, obj.loc.x, obj.loc.y, obj.loc.z) <= obj.size/2 + 20) {
        obj.lives = 0;
        Lives--;
      }
    j++;
  }

  if (Lives == 0) {
    mode = GAMEOVER;
  }
}

void gameClicks() {
}

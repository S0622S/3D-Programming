void intro() {
  //int c = 255;
  HUD.beginDraw();  
  HUD.rectMode(CENTER);
  HUD.textAlign(CENTER, CENTER);
  cursor();
  HUD.background(100);
  
  
  button(width/2, height/2, 400, 200, "START");

  if (mousePressed && buttonPressed(width/2, height/2, 400, 200)){
    mode = GAME;
  }


    HUD.endDraw();
  image(HUD, 0, 0);
}


void introClicks() {
}

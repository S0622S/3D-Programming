void gameover() {
  HUD.beginDraw();  
  HUD.rectMode(CENTER);
  HUD.textAlign(CENTER, CENTER);
  cursor();
  HUD.background(100);

  HUD.fill(0);
  HUD.text("GAMEOVER", width/2, height/2, 400, 200);

  //button(width/2, height/2 + 400, 400, 200, "RESTART");
  HUD.fill(255);
  HUD.rect(width/2, height/2 + 400, 400, 200);

  //if (buttonPressed(width/2, height/2 + 400, 400, 200)) {
  //  mode = INTRO;
  //  setup();
  //}
  if (mousePressed && mouseX > width/2 - 200 && mouseX < width/2 + 200 && mouseY > height/2 + 300 && mouseY < height/2 + 500) {
        mode = INTRO;
    setup();
  }

  HUD.endDraw();
  image(HUD, 0, 0);
}

void gameoverClicks() {
}

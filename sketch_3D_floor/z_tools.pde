void button(int x, int y, int w, int h, String lable) {
  if (mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2) {
    HUD.strokeWeight(5);
    HUD.stroke(0, 0, 255);
  } else {
    HUD.stroke(0);
    HUD.strokeWeight(1);
  }


  HUD.fill(255);
  HUD.rect(x, y, w, h);
  HUD.fill(0);
  HUD.textSize(50); //50
  HUD.text(lable, x, y);
}

void Button(int x, int y, int w, int h, int sw, String lable) {
  if (mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2) {
    HUD.strokeWeight(5);
    HUD.stroke(0, 0, 255);
  } else {
    HUD.stroke(0);
    HUD.strokeWeight(sw);
  }


  HUD.fill(255);
  HUD.rect(x, y, w, h);
  HUD.fill(0);
  HUD.textSize(50); //50
  HUD.text(lable, x, y);
}

boolean buttonPressed(int x, int y, int w, int h) {
  return mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2;
}

void mouseReleased() {

  if (mode == INTRO) {
    introClicks();
  } else if (mode == GAME) {
    gameClicks();
  } else if (mode == PAUSE) {
    pauseClicks();
  } else if (mode == GAMEOVER) {
    gameoverClicks();
  } else {
    println("Error: Mode is " + mode);
  }
}

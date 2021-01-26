void move() {

  pushMatrix();
  noLights();
  translate(focusx, focusy, focusz);
  fill(255, 0, 0);
  sphere(5);
  popMatrix();

  if (dkey && canMoveRight()) {
    eyex += cos(leftRightAngle + PI/2) * 10;
    eyez += sin(leftRightAngle + PI/2) * 10;
  }

  if (akey && canMoveLeft()) {
    eyex += cos(leftRightAngle - PI/2) * 10;
    eyez += sin(leftRightAngle - PI/2) * 10;
  }

  if (skey && canMoveBack()) {
    eyex -= cos(leftRightAngle) * 10;
    eyez -= sin(leftRightAngle) * 10;
  }

  if (wkey && canMoveForward() && canMoveFL() && canMoveFR() ) {
    eyex += cos(leftRightAngle) * 10;
    eyez += sin(leftRightAngle) * 10;
  }
  
  if (mousePressed) {
    objects.add(new Bullet());
  }

  leftRightAngle = leftRightAngle + (mouseX-pmouseX) * 0.01;

  upDownAngle = upDownAngle + (mouseY - pmouseY) * 0.01;

  focusx = eyex + cos(leftRightAngle) * 300;
  focusy = eyey + tan(upDownAngle) * 300;
  focusz = eyez + sin(leftRightAngle) * 300;

  //if (upDownAngle > PI/2.1) upDownAngle = PI/2.1;
  //if (upDownAngle < -PI/2.1) upDownAngle = -PI/2.1;

  //if (abs(pmouseX - mouseX) < width - 2) rbt.mouseMove(2, mouseY);
  //if (mouseX < 1) rbt.mouseMove(width-3, mouseY);

  if (mouseX > width - 2) {
    if (abs(mouseX - pmouseX) < 5) {
      rbt.mouseMove(2, mouseY);
    }
  }

  if (mouseX < 1) {
    if (abs(mouseX - width) < 5) {
      rbt.mouseMove(2, mouseY);
    }
  }
}

boolean canMoveForward() {
  float fwdx, fwdy, fwdz;
  int mapx, mapy;
  
  fwdx = focusx = eyex + cos(leftRightAngle) * 200;
  fwdy = eyey;
  fwdz = focusz = eyez + sin(leftRightAngle) * 200;
 
  mapx = int(fwdx + 2000  ) / gridSize;
  mapy = int(fwdz + 2000) / gridSize;
  
  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveFL() {
  float flx, fly, flz;
  int mapx, mapy;
  
  flx = focusx = eyex + cos(leftRightAngle - PI/9) * 200;
  fly = eyey;
  flz = focusz = eyez + sin(leftRightAngle - PI/9) * 200;
 
  mapx = int(flx + 2000) / gridSize;
  mapy = int(flz + 2000) / gridSize;
  
  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveFR() {
  float frx, fry, frz;
  int mapx, mapy;
  
  frx = focusx = eyex + cos(leftRightAngle + PI/9) * 200;
  fry = eyey;
  frz = focusz = eyez + sin(leftRightAngle + PI/9) * 200;
 
  mapx = int(frx + 2000) / gridSize;
  mapy = int(frz + 2000) / gridSize;
  
  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveLeft() {
  float lx, ly, lz;
  int mapx, mapy;
  
  lx = focusx = eyex + cos(leftRightAngle - PI/2) * 200;
  ly = eyey;
  lz = focusz = eyez + sin(leftRightAngle - PI/2) * 200;
 
  mapx = int(lx + 2000) / gridSize;
  mapy = int(lz + 2000) / gridSize;
  
  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveRight() {
  float rx, ry, rz;
  int mapx, mapy;
  
  rx = focusx = eyex + cos(leftRightAngle + PI/2) * 200;
  ry = eyey;
  rz = focusz = eyez + sin(leftRightAngle + PI/2) * 200;
 
  mapx = int(rx + 2000) / gridSize;
  mapy = int(rz + 2000) / gridSize;
  
  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveBack() {
  float bx, by, bz;
  int mapx, mapy;
  
  bx = focusx = eyex - cos(leftRightAngle) * 200;
  by = eyey;
  bz = focusz = eyez - sin(leftRightAngle) * 200;
 
  mapx = int(bx + 2000) / gridSize;
  mapy = int(bz + 2000) / gridSize;
  
  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}

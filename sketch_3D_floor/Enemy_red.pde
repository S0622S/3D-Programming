class redEnemy extends GameObject {
  PVector dir;
  float speed;

  redEnemy() {
    super (random(-2000, 2000), height - gridSize, random(-2000, 2000), 50);
    //speed = 5;
    float vx = (4);
    float vy = (4);
    float vz = (0);
    dir = new PVector(vx, vy, vz);
    //dir.setMag(speed);
    dir.rotate(random(TWO_PI));
  }

  void act() {

    if (loc.y >= height || loc.y < height-gridSize*10) {
      lives = 0;
      objects.add(new redEnemy());
    }

    int hitx = int(loc.x+2000) / gridSize;
    int hity = int(loc.z+2000) / gridSize;
    if (map.get(hitx, hity) == white) {
      loc.add(dir);
    } else {
      lives = 0;
      objects.add(new redEnemy());
    }

    t2++;
    if (t2 > 90) {
      objects.add(new Bullet2(loc.x, loc.y, loc.z));
      t2 = 0;
    }

    int j = 0;
    while (j < objects.size()) {
      GameObject obj = objects.get(j);
      if (obj instanceof Bullet)
        if (dist(loc.x, loc.y, loc.z, obj.loc.x, obj.loc.y, obj.loc.z) <= size/2 + obj.size/2 + 10) {
          obj.lives = 0;
          lives = 0;
          objects.add(new Particle(loc.x, loc.y, loc.z, size/3, 10));
          objects.add(new Particle(loc.x, loc.y, loc.z, size/3, 10));
          objects.add(new Particle(loc.x, loc.y, loc.z, size/3, 10));
          objects.add(new Particle(loc.x, loc.y, loc.z, size/3, 10));
          objects.add(new Particle(loc.x, loc.y, loc.z, size/3, 10));
          objects.add(new redEnemy());

          score = score + 10;
        }
      j++;
    }
  }

  void show() {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.fill(red);
    world.strokeWeight(5);
    world.stroke(100);
    world.box(size);
    world.popMatrix();
  }
}

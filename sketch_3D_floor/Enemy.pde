class Enemy extends GameObject {
  PVector dir;
  float speed;

  Enemy() {
    super (random(-2000, 2000), height - gridSize, random(-2000, 2000), 50);
    //speed = 5;
    float vx = (3);
    float vy = (3);
    float vz = (0);
    dir = new PVector(vx, vy, vz);
    //dir.setMag(speed);
    dir.rotate(random(TWO_PI));
  }

  void act() {

    if (loc.y >= height || loc.y < height-gridSize*10) {
      lives = 0;
      objects.add(new Enemy());
    }

    int hitx = int(loc.x+2000) / gridSize;
    int hity = int(loc.z+2000) / gridSize;
    if (map.get(hitx, hity) == white) {
      loc.add(dir);
    } else {
      lives = 0;
      objects.add(new Enemy());
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
          objects.add(new Enemy());
          score++;
        }
      j++;
    }
  }
}

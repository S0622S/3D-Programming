class Particle extends GameObject {  
  PVector pdir;
  int a, rate;

  Particle(float x, float y, float z, float s) {
    lives = 1;
    loc = new PVector(x, y, z);
    pdir = new PVector(random(-10, 10), random(-10, 10), random(-10, 10));
    //pdir.rotate(random(-50, 50));
    size = s;
    a = 255;
    rate = 5;
  }

  Particle(float x, float y, float z, float s, int r) {
    lives = 1;
    loc = new PVector(x, y, z);
    pdir = new PVector(random(-10, 10), random(-10, 10), random(-10, 10));
    size = s;
    a = 255;
    rate = r;
  }

  void act() {
    loc.add(pdir);
  }

  void show() {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.fill(white, a);
    world.strokeWeight(5);
    world.stroke(100, a);
    world.box(size);
    a = a - rate;
    if (a <= 0) {
      lives = 0;
    }
    world.popMatrix();
  }
}

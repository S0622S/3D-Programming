class Bullet2 extends GameObject {

  PVector dir;
  float speed;


  //Bullet2() {
  //  super(eyex, eyey, eyez, 10);  //GameObject( , , , )
  //  speed = 70;
  //  float vx = cos(leftRightAngle);
  //  float vy = tan(upDownAngle);
  //  float vz = sin(leftRightAngle);
  //  dir = new PVector(vx, vy, vz);
  //  dir.setMag(speed);
  //}

  Bullet2(float x, float y, float z) {
    super(x, y, z, 20);  //GameObject( , , , )
    speed = 20;
    float vx = eyex - loc.x;
    float vy = eyey - loc.y;
    float vz = eyez - loc.z;
    dir = new PVector(vx, vy, vz);
    dir.setMag(speed);
  }



  void act() {

    int hitx = int(loc.x+2000) / gridSize;
    int hity = int(loc.z+2000) / gridSize;
    if (map.get(hitx, hity) == white) {
      loc.add(dir);
    } else {
      lives = 0;
    }

    if (map.get(hitx, hity) != white) {
      objects.add(new Particle(loc.x, loc.y, loc.z, size/2));
      objects.add(new Particle(loc.x, loc.y, loc.z, size/2));
      objects.add(new Particle(loc.x, loc.y, loc.z, size/2));
      objects.add(new Particle(loc.x, loc.y, loc.z, size/2));
      objects.add(new Particle(loc.x, loc.y, loc.z, size/2));
    }
  }

  void show() {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.fill(rblack);
    world.strokeWeight(5);
    world.stroke(100);
    world.box(size);
    world.popMatrix();
  }
}

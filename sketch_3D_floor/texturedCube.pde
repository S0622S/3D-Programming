void texturedCube(float x, float y, float z, PImage texture, float size) {
  world.pushMatrix();
  world.translate(x, y, z);
  world.scale(size);

  world.noStroke();

  world.beginShape(QUADS);
  world.texture(texture);

  //top
  //     x, y, z, texture's x, texture's y
  world.vertex(0, 0, 0, 0, 0);
  world.vertex(1, 0, 0, 1, 0); 
  world.vertex(1, 0, 1, 1, 1);
  world.vertex(0, 0, 1, 0, 1);

  //bottom
  world.vertex(0, 1, 0, 0, 0);
  world.vertex(1, 1, 0, 1, 0); 
  world.vertex(1, 1, 1, 1, 1);
  world.vertex(0, 1, 1, 0, 1);

  //front
  world.vertex(0, 0, 1, 0, 0);
  world.vertex(1, 0, 1, 1, 0); 
  world.vertex(1, 1, 1, 1, 1);
  world.vertex(0, 1, 1, 0, 1);

  //back
  world.vertex(0, 0, 0, 0, 0);
  world.vertex(1, 0, 0, 1, 0); 
  world.vertex(1, 1, 0, 1, 1);
  world.vertex(0, 1, 0, 0, 1);


  //left
  world.vertex(0, 0, 0, 0, 0);
  world.vertex(0, 0, 1, 1, 0); 
  world.vertex(0, 1, 1, 1, 1);
  world.vertex(0, 1, 0, 0, 1);

  //right
  world.vertex(1, 0, 0, 0, 0);
  world.vertex(1, 0, 1, 1, 0); 
  world.vertex(1, 1, 1, 1, 1);
  world.vertex(1, 1, 0, 0, 1);

  world.endShape();

  //box(1);

  world.popMatrix();
}

void texturedCube(float x, float y, float z, PImage top, PImage side, PImage bottom, float size) {
  pushMatrix();
  translate(x, y, z);
  scale(size);


  noStroke();

  beginShape(QUADS);
  texture(top);


  //top
  //     x, y, z, texture's x, texture's y
  vertex(-0.5, -0.5, -0.5, 0, 0);
  vertex(0.5, -0.5, -0.5, 1, 0); 
  vertex(0.5, -0.5, 0.5, 1, 1);
  vertex(-0.5, -0.5, 0.5, 0, 1);

  endShape();

  beginShape(QUADS);
  texture(bottom);

  //bottom
  vertex(-0.5, 0.5, -0.5, 0, 0);
  vertex(0.5, 0.5, -0.5, 1, 0); 
  vertex(0.5, 0.5, 0.5, 1, 1);
  vertex(-0.5, 0.5, 0.5, 0, 1);

  endShape();

  beginShape(QUADS);
  texture(side);

  //front
  vertex(-0.5, -0.5, 0.5, 0, 0);
  vertex(0.5, -0.5, 0.5, 1, 0); 
  vertex(0.5, 0.5, 0.5, 1, 1);
  vertex(-0.5, 0.5, 0.5, 0, 1);

  //back
  vertex(0.5, -0.5, -0.5, 0, 0);
  vertex(-0.5, -0.5, -0.5, 1, 0); 
  vertex(-0.5, 0.5, -0.5, 1, 1);
  vertex(0.5, 0.5, -0.5, 0, 1);

  //left
  vertex(-0.5, -0.5, -0.5, 0, 0);
  vertex(-0.5, -0.5, 0.5, 1, 0); 
  vertex(-0.5, 0.5, 0.5, 1, 1);
  vertex(-0.5, 0.5, -0.5, 0, 1);

  //right
  vertex(0.5, -0.5, 0.5, 0, 0);
  vertex(0.5, -0.5, -0.5, 1, 0); 
  vertex(0.5, 0.5, -0.5, 1, 1);
  vertex(0.5, 0.5, 0.5, 0, 1);
  endShape();

  //box(1);

  popMatrix();
}

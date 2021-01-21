PImage[] gif;
String leadingZero;
int frame;

void drawGIF(float x, float y, float z, PImage g, float size) {
  pushMatrix();
  //translate(x, y, z);
  scale(size);
  image(g, x, y, 10, 10);
  frame++;
  if (frame >= 15) {
     frame = 0; 
  }
  popMatrix();
}

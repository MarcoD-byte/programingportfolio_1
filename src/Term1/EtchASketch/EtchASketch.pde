// Marco DalCanto | Etch A Sketch | 18 Sept 2024
int x, y;
PImage e1;

void setup() {
  size(800, 650);
  background(128);
  x = width/2;
  y = height/2;
  e1 = loadImage("Etch.png");
  frameRate(60);
}

void draw() {
  image(e1, 0, 0);
  strokeWeight(2);
  point(x, y);
  if (keyPressed) {
    if (key == 'w' || key =='W') {
      y = y-1;
    } else if (key == 's' || key == 'S') {
      y = y+1;
    } else if (key == 'a' ||key == 'A') {
      x = x-1;
    } else if (key == 'd' || key == 'D') {
      x = x+1;
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      x=x-1;
    } else if (keyCode == RIGHT) {
      x=x+1;
    } else if (keyCode == UP) {
      y=y-1;
    } else if (keyCode == DOWN) {
      y=y+1;
    }
  }
}

void mousePressed() {
   saveFrame("line-######.png");
}

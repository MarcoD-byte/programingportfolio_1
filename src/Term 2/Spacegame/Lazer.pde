class Lazer {
  // Member Variables
  int x, y, w, h, speed, type;
  PImage l1;


  // Constructor
  Lazer (int x, int y, int type) {
    this.x = x;
    this.y = y;
    w = 12;
    h = 12;
    speed = 3;
    this.type = type;
    if (type == 2) {
      l1 = loadImage("Lazer.png");
      speed = 3;
    } else if (type == 1) {
      l1 = loadImage("Lazer1.png");
      speed = 5;
    }
  }

  // Member Methods
  void display() {
    imageMode(CENTER);
    if (type == 2) {
      image(l1, x, y, w, h);
    } else if (type == 1) {
      image(l1, x, y, w/6, h*2);
    }
  }
  void move () {
    y -= speed;
  }
  boolean reachTop() {
    if (y < 0-h) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}

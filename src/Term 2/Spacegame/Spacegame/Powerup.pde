class Powerup {
  // Member Variables
  int x, y, diam, speed;
  char type;
  PImage t1, h1, b1, a1;

  // Constructor
  Powerup () {
    t1 = loadImage("turret.png");
    h1= loadImage("heart.png");
    b1= loadImage("bomb.png");
    a1= loadImage("ammo.png");
    x = int(random(width));
    y= -100;
    diam = int(random(30, 50));
    speed = int(random(1, 5));
    int rand = int(random(0, 7));
    if (rand == 0) {
      // health
      type = 'h';
    } else if (rand == 1 || rand == 3) {
      // ammo
      type = 'a';
    } else if (rand ==  2 || rand == 5 || rand == 6) {
      // turret
      type = 't';
    } else if (rand == 4) {
      // bomb ammo
      type = 'b';
    }
  }

  // Member Methods
  void display() {
    if (type == 'h') {
      image(h1, x, y);
    } else if (type == 'a') {
      image(a1, x, y);
    } else if (type == 't') {
      image(t1, x, y);
    } else if (type == 'b') {
      image(b1, x, y);
    }
  }
  void move () {
    y+= speed;
  }
  boolean reachedBottom() {
    if (y-120 > height) {
      return true;
    }
    return false;
  }
  boolean intersect(Spaceship s) {
    float d = dist(x, y, s.x, s.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}

class Spaceship {
  // Member Variables
  int x, y, w, lazerCount, bombCount, turretCount, health, weapon;
  PImage ship;

  // Constructor
  Spaceship () {
    x = width/2;
    y = height/2;
    w = 100;
    lazerCount = 30;
    bombCount = 3;
    turretCount = 1;
    weapon = 1;
    health = 100;
    reload = new Timer(1000);
    reload.start();
    ship = loadImage("Ship.png");
  }

  // Member Methods
  void display() {
    image(ship, x, y, 75, 100);
  }
  void move (int tempX, int tempY) {
    x = tempX;
    y = tempY;
    if (keyPressed) {
      if (key == 'w') {
        y += -1;
      } else if (key == 's') {
        y+= 1;
      } else if (key == 'a') {
        x+= -1;
      } else if (key == 'd') {
        x+= 1;
      }
    }
  }
  boolean fire() {
    if (play == true) {
      if (weapon == 2) {
        if (bombCount < 1) {
          return false;
        } else {
          return true;
        }
      } else {
        if (lazerCount < 1) {
          return false;
        } else {
          return true;
        }
      }
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

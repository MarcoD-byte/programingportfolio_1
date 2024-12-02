class Rock {
  // Member Variables
  int x, y, diam, speed;
  PImage r1;

  // Constructor
  Rock () {
    x = int(random(width));
    y= -100;
    diam = int(random(75,100));
    speed = int(random(1, 5));
    r1 = loadImage("Astroid01.png");
  }

  // Member Methods
  void display() {
    imageMode(CENTER);
    r1.resize(diam,diam);
    image(r1, x, y);
  }
  void move () {
    y+= speed;
  }
  boolean reachedBottom() {
    if (y-120 > height) {
      return true;
    }return false;
  }
}

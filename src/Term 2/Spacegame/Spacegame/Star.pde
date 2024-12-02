class Star {
  // Member Variables
  int x, y, diam, speed, scolor;


  // Constructor
  Star (int x, int y) {
    this.x = x;
    this.y = y;
    diam = int(random(1, 5));
    speed = int(random(1, 4));
    scolor = int(random(150, 255));
  }

  // Member Methods
  void display() {
    fill(scolor);
    ellipse(x, y, diam,diam);
  }
  void move () {
    this.y += speed;
  }
  boolean reachedBottm() {
    if (y-120 > height) {
      return true;
    }
    return false;
  }
}

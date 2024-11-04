class Button {
  // Memeber Variables
  int x, y, w, h;
  color c1, c2;
  String val;
  boolean on, isNum;

  // Constructor
  Button(int x, int y, int w, int h, String val, boolean isNum) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    c1 = color(#6A6A6A);
    c2 = color(#E89700);
    this.val = val;
    on=false;
    this.isNum = isNum;
  }


  // Member Methods
  void display() {
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    textSize(15);
    on = false;
    rectMode(CENTER);
    rect(x, y, w, h);
    fill(255);
    textAlign(CENTER, CENTER);
    text(val, x, y);
  }

  boolean hover(int mx, int my) {
    if (mx>x-w/2 && mx<x+w/2 && my>y-h/2 && my<y+h/2) {
      on = true;
      return on;
    } else {
      on = false;
      return on;
    }
  }
}

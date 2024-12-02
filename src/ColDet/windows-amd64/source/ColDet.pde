// Marco DalCanto | ColDet | Septemeber 9 2024
// int xspeed, yspeed, xpos, ypos, wdth, ht;
int xpos, ypos, xspeed, yspeed;
void setup () {
  size (1000, 1000);
  // size(displayWidth, displayHeight);
  background (0);
  xspeed = 3;
  yspeed = 10;
  // wdth = 20;
  // ht = 20;
  noStroke();
  xpos = width/2;
  ypos = height/2;
  frameRate(30);
}

void draw () {
  // background(0);
  ball(20, 20, 1);
  ball(20, 20, 90);
}


void ball (int wdth, int ht, int plus) {
  fill(255);
  ellipse(xpos+plus, ypos+plus, wdth, ht);
  xpos += xspeed;
  // to make the ball go vertical only, comment the previous line
  ypos += yspeed;
  if (xpos >= width-wdth/2 || xpos <= wdth/2) {
    xspeed = xspeed *-1;
  }
  if (ypos >= height-ht/2 || ypos<= ht/2) {
    yspeed = yspeed *-1;
  }
}

// Marco DalCanto | 6 nov 2024 | Spacegame //<>//
import processing.sound.*;
SoundFile lazer;
Spaceship s1;
ArrayList<Rock> rocks = new ArrayList <Rock>();
ArrayList<Lazer> lazers = new ArrayList<Lazer>();
ArrayList<Powerup> powups = new ArrayList<Powerup>();
ArrayList<Star> stars = new ArrayList<Star>();
int score, wave;
boolean play;
Timer rTime, puTime, reload, turret, sTime;





void setup() {
  size (1000, 1000);
  background (5);
  imageMode(CENTER);
  s1 = new Spaceship();
  score = 0;
  wave = 1;
  play = false;
  rTime = new Timer (700);
  rTime.start();
  puTime = new Timer(2500);
  puTime.start();
  reload = new Timer (750);
  reload.start();
  turret = new Timer (10000);
  turret.start();
  sTime = new Timer (5);
  sTime.start();
  lazer = new SoundFile(this, "lazer1.wav");
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    if (frameCount %1000 == 0) {
      wave=wave+1;
      rTime.totalTime-=50;
      puTime.totalTime+=50;
    }
    //fill(10,255);
    background(10);

    // Render powerups
    if (puTime.isFinished()) {
      powups.add(new Powerup());
      puTime.start();
    }
    for (int i = 0; i<powups.size(); i++) {
      Powerup pu = powups.get(i);
      if (pu.intersect(s1)) {
        powups.remove(pu);
        // 2. health bennefit
        if (pu.type == 'h') {
          s1.health += 20;
          // 3. reload some ammo
        } else if (pu.type == 'a') {
          s1.lazerCount += 50;
        } else if (pu.type == 'b') {
          s1.bombCount += 1;
          //5. turret count
        } else if (pu.type == 't' && s1.turretCount < 4) {
          s1.turretCount *= 2;
          turret.start();
        }
      }
      pu.display();
      pu.move();
      if (pu.reachedBottom()) {
        powups.remove(pu);
      }
      if (turret.isFinished()) {
        s1.turretCount = 1;
      }
    }
    // lasers
    if (reload.isFinished() && s1.lazerCount <=50) {
      s1.lazerCount ++;
      reload.start();
    }
    //Stars
    if (sTime.isFinished()) {
      stars.add(new Star(int(random(0, width)), -10));
    }

    for (int i = 0; i < stars.size(); i++) {
      Star star = stars.get (i);
      if (star.reachedBottm()) {
        stars.remove(star);
      }
      star.move();
      star.display();
    }


    // Lazer intersect w/rock
    for (int i = 0; i < lazers.size(); i++) {
      Lazer lazer = lazers.get (i);
      for (int k = 0; k < rocks.size(); k++) {
        Rock rock = rocks.get(k);
        if (lazer.intersect(rock)) {
          if (lazer.type == 1) {
            rock.diam -= 10;
            if (rock.diam < 50) {
              rocks.remove(rock);
            }
            score += 100;
            lazers.remove(lazer);
          } else {
            rocks.remove(rock);
            lazers.remove(lazer);
          }
        }
      }
      lazer.display();
      lazer.move();

      if (lazer.reachTop()) {
        lazers.remove(lazer);
      }
    }

    // spaceship
    s1.display();
    s1.move(mouseX, mouseY);


    // Asteroids
    if (rTime.isFinished()) {
      rocks.add(new Rock());
      rTime.start();
    }
    // Asteroid intersect w/ship
    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get (i);
      rock.display();
      rock.move();
      if (s1.intersect(rock)) {
        s1.health -= rock.diam/4;
        score += rock.diam/4;
        rocks.remove(rock);
        if (s1.health <0) {
          gameover();
          noLoop();
        }
      }
      // rock reached bottom
      if (rock.reachedBottom()) {
        gameover();
        rocks.remove(rock);
        noLoop();
      }
    }
  }// info pannel
  infoPannel();
}

void infoPannel() {
  rectMode(CENTER);
  textAlign(CENTER);
  fill(150, 127);
  rect(width/2, 20, width, 40);
  fill(255);
  textSize(30);
  text("Score: " + score, width/2-400, 36);
  text("Wave: " + wave, width/2+400, 36);
  text("Bombs: " +s1.bombCount, width/2+200, 36);
  text("Lazers: " + s1.lazerCount, width/2-200, 36);
  text("Health: "+ s1.health, width/2, 36);
}

void startScreen() {
  background (0);
  fill(255);
  textAlign(CENTER);
  textSize(50);
  text("Welcome to SpaceGame", width/2, 300);
  text("click to start...", width/2, 350);
  textSize(20);
  fill(150);
  text("Pick weapon with '1' or '2'", width/2, 500);
  text("Don't let astroids hit the bottom!", width/2, 520);
  if (mousePressed) {
    play = true;
  }
}

void gameover() {
  background (0);
  fill(255);
  textAlign(CENTER);
  textSize(50);
  text("Game over", width/2, 300);
  text("Score:" + score, width/2, 350);
  text("Level:" + wave, width/2, 400);
  //text("click to restart...", width/2, 450);
  if (mousePressed) {
    play = true;
  }
}

void ticker() {
}

void keyPressed() {

  if (key == ' ' && s1.fire()) {
    lazer.play();
    if (s1.weapon==1) {
      s1.lazerCount --;
      for (int i = 0; i<s1.turretCount; i++) {
        lazers.add(new Lazer(s1.x +10*i, s1.y, 1));
        lazers.add(new Lazer(s1.x -10*i, s1.y, 1));
      }
    } else if (s1.weapon == 2) {
      s1.bombCount --;
      for (int i = 0; i<s1.turretCount; i++) {
        lazers.add(new Lazer(s1.x +10*i, s1.y, 2));
        lazers.add(new Lazer(s1.x -10*i, s1.y, 2));
      }
    }
  }
  if (key == '1') {
    s1.weapon = 1;
  }
  if (key =='2') {
    s1.weapon = 2;
  }
}
void mousePressed() {

  if (s1.fire()) {
    lazer.play();
    if (s1.weapon==1) {
      s1.lazerCount --;
      for (int i = 0; i<s1.turretCount; i++) {
        lazers.add(new Lazer(s1.x +10*i, s1.y, 1));
        lazers.add(new Lazer(s1.x -10*i, s1.y, 1));
      }
    }
    if (s1.weapon == 2) {
      s1.bombCount --;
      for (int i = 0; i<s1.turretCount; i++) {
        lazers.add(new Lazer(s1.x +15*i, s1.y, 2));
        lazers.add(new Lazer(s1.x -15*i, s1.y, 2));
      }
    }
  }
}

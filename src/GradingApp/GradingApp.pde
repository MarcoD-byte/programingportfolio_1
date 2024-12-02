// Marco DalCanto | Grades App | 9/11/24

float grade;


void setup() {
  size(400, 150);
  background(100);

}

void draw () {
  background(100);

  // Title
  textAlign(CENTER);
  fill(255);
  textSize(20);
  text("Grades by Marco DalCanto", width/2, 20);

  //Line
  stroke(255);
  strokeWeight(1);
  line(0, 100, width, 100);

  // Tic Marks
  for (int i = 0; i<=width; i+=40) {
    line(i, 95, i, 105);
    textSize(8);
    fill(255);
    text( (float)i/width*4, i, 120);
  }



  //Marker
  fill (0);
  stroke(255);
  ellipse(mouseX, 100, 6, 6);
  textSize(12);
  fill(255);
  text((float)mouseX/width*4, mouseX, 90);

  //
  grade = (float) mouseX/width*4;
  assignGrade(grade);
}

void assignGrade(float tgrade) {
  // println(grade);
  fill(255);
  if (tgrade >= 3.51) {
    text("Assign letter grade A :)", width/2, 135);
  } else if (tgrade >=3.0) { // In one conditional statement, you can only ever have one if and one else. However, you can have as many else if's as you like!
    text ("Assign letter grade A-", width/2, 135);
  } else if (tgrade >=2.84) {
    text ("Assign letter grade B+", width/2, 135);
  } else if (tgrade >= 2.67) {
    text ("Assign letter grade B", width/2, 135);
  } else if (tgrade >= 2.5) {
    text ("Assign letter grade B-", width/2, 135);
  } else if (tgrade >= 2.34) {
    text ("Assign letter grade C+", width/2, 135);
  } else if (tgrade >= 2.17) {
    text ("Assign letter grade C", width/2, 135);
  } else if (tgrade >= 2.00) {
    text ("Assign letter grade C-", width/2, 135);
  } else if (tgrade >= 1.66) {
    text ("Assign letter grade D+", width/2, 135);
  } else if (tgrade >= 1.33) {
    text ("Assign letter grade D", width/2, 135);
  } else if (tgrade >= 1.00) {
    text ("Assign letter grade D-", width/2, 135);
  } else {
    text ("Assign letter grade F  :( ", width/2, 135);
  }
}

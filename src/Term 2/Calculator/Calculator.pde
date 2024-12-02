// Marco DalCanto | Calculator App | 30 Sept 2024
Button[] buttons = new Button[23];
String dVal1, dVal2, d2Val1, d3Val1, d4Val1;
String d2Val2, d3Val2, d4Val2;
float l, r, result;
char op;
boolean left;



void setup() {
  dVal1 = "0";
  dVal2 = "";
  d2Val1 = "0";
  d3Val1 = "0";
  d4Val1 = "0";
  d2Val2 = "0+0";
  d3Val2 = "0+0";
  d4Val2 = "0+0";
  size(300, 520);
  background(75);
  l=0.0;
  r=0.0;
  result = 0.0;
  op = ' ';
  left = true;
  buttons[0] = new Button(40, 490, 80, 60, "0", true);
  buttons[1] = new Button(40, 440, 80, 40, "1", true);
  buttons[2] = new Button(120, 440, 80, 40, "2", true);
  buttons[3] = new Button(200, 440, 80, 40, "3", true);
  buttons[4] = new Button(40, 400, 80, 40, "4", true);
  buttons[5] = new Button(120, 400, 80, 40, "5", true);
  buttons[6] = new Button(200, 400, 80, 40, "6", true);
  buttons[7] = new Button(40, 360, 80, 40, "7", true);
  buttons[8] = new Button(120, 360, 80, 40, "8", true);
  buttons[9] = new Button(200, 360, 80, 40, "9", true);
  buttons[10] = new Button(110, 490, 60, 60, ".", false);
  buttons[11] = new Button(170, 490, 60, 60, "±", false);
  buttons[12] = new Button(250, 490, 100, 60, "Enter", false);
  buttons[13] = new Button(270, 430, 60, 60, "+", false);
  buttons[14] = new Button(270, 370, 60, 60, "-", false);
  buttons[15] = new Button(270, 250, 60, 60, "÷", false);
  buttons[16] = new Button(270, 310, 60, 60, "x", false);
  buttons[17] = new Button(60, 320, 120, 40, "Clear", false);
  buttons[18] = new Button(180, 320, 120, 40, "Del", false);
  buttons[19] = new Button(35, 270, 60, 40, "abs", false);
  buttons[20] = new Button(120, 270, 60, 40, "x²", false);
  buttons[21] = new Button(200, 270, 60, 40, "^", false);
  buttons[22] = new Button(120, 200, 60, 40, "√", false);
}

void draw() {
  background(75);
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}


void updateDisplay() {
  // Create Display Box
  fill(#6A6A6A);
  rectMode(CENTER);
  stroke(0);
  rect(width/2, 80, width-1, 160);
  for (var i=0; i<160; i=i+40) {
    line(0, i, width, i);
  }
  // Create Diaplay text
  fill(255);
  textAlign(RIGHT);
  textSize(20);
  text(dVal1 + dVal2, width-10, 145);
  text(d2Val1, width-10, 110);
  text(d3Val1, width-10, 70);
  text(d4Val1, width-10, 30);
  textSize(14);
  textAlign(LEFT);
  text(d2Val2, 10, 110);
  text(d3Val2, 10, 70);
  text(d4Val2, 10, 30);
  textAlign(CENTER);
}

void mousePressed() {

  // for numbers
  for (var i=0; i<buttons.length; i++) {
    // on the left
    if (buttons[i].on && buttons[i].isNum && left && (dVal1.length()+dVal2.length()<20)) {
      handleEvent(str(i), true);

      // On the right
    } else if (buttons[i].on && buttons[i].isNum && !left) {
      handleEvent(str(i), true);

      //Clear
    } else if (buttons[17].on) {
      handleEvent("clear", false);

      // dot
    } else if (buttons[i].on && buttons[i].val.equals(".")) {
      handleEvent(".", false);
      // Del
    } else if (buttons[i].on && buttons [i].val.equals("Del")) {
      handleEvent("del", false);
      // Square
    } else if (buttons[i].on && buttons [i].val.equals("x²")) {
      if (left) {
        l = l*l;
        dVal1 = str(l);
      } else {
        r = r*r;
        dVal2 = str(r);
      }
      // Sqrt
    } else if (buttons[i].on && buttons [i].val.equals("√")) {
      if (left) {
        l = sqrt(l);
        dVal1 = str(l);
      } else {
        r = sqrt(r);
        dVal2 = str(r);
      }
      // abs()
    } else if (buttons[i].on && buttons [i].val.equals("abs")) {
      if (left) {
        dVal1 = "abs(" + dVal1;
        l = abs(l);
      } else
        dVal2 = "abs" + dVal2;
      r = abs(r);
      // Positive/negative
    } else if (buttons[i].on && buttons [i].val.equals("±")) {
      if (left) {
        l=l*-1;
        dVal1 = str(l);
      } else {
        r=r*-1;
        dVal2 = str(r);
      }
      // Operaters
    } else if (buttons[i].on && buttons [i].val.equals("+")) {
      handleEvent("+", false);
    } else if (buttons[i].on && buttons [i].val.equals("-")) {
      handleEvent("-", false);
    } else if (buttons[i].on && buttons [i].val.equals("x")) {
      handleEvent("*", false);
    } else if (buttons[i].on && buttons [i].val.equals("÷")) {
      handleEvent("/", false);

      // Power
    } else if (buttons[i].on && buttons [i].val.equals("^")) {
      op = '^';
      left = false;
      dVal1 += '^';
      // Enter
    } else if (buttons[i].on && buttons[i].val.equals("Enter")) {
      handleEvent("enter", false);
    }
  }
}

void keyPressed() {
  println("key: " + key);
  println("key code:" + keyCode);
  if (key == 0 || keyCode == 96 || keyCode == 48) {
    handleEvent("0", true);
    println("0");
  }
  if (key == 1 || keyCode == 97 || keyCode == 49) {
    handleEvent("1", true);
    println("1");
  }
  if (key == 2 || keyCode == 98 || keyCode == 50) {
    handleEvent("2", true);
    println("2 ");
  }
  if (key == 3 || keyCode == 99 || keyCode == 51) {
    handleEvent("3", true);
    println(" 3");
  }
  if (key == 4 || keyCode == 100 || keyCode == 52) {
    handleEvent("4", true);
    println("4 ");
  }
  if (key == 5 || keyCode == 101|| keyCode == 53) {
    handleEvent("5", true);
    println("5 ");
  }
  if (key == 6 || keyCode == 102|| keyCode == 54) {
    handleEvent("6", true);
    println(" 6");
  }
  if (key == 7 || keyCode == 103|| keyCode == 55) {
    handleEvent("7", true);
    println(" 7");
  }
  if (keyCode == 104|| keyCode == 56) {
    handleEvent("8", true);
    println(" 8");
  }
  if (key == 9 || keyCode == 105|| keyCode == 57) {
    handleEvent("9", true);
    println(" 9");
  }
  if (keyCode == 107) {
    handleEvent("+", false);
    println(" +");
  }
  if ( keyCode == 45 || keyCode == 109) {
    handleEvent("-", false);
    println(" -");
  }
  if ( keyCode == 106) {
    handleEvent("*", false);
    println("* ");
  }
  if (keyCode == 111 || keyCode == 47) {
    handleEvent("/", false);
    println(" /");
  }
  if (key == '.' || keyCode == 110 || keyCode == 46) {
    handleEvent(".", false);
    println(" .");
  }
  if (keyCode == 10 || keyCode == 61) {
    handleEvent("enter", false);
    println("enter");
  }
  if (keyCode == 68 || keyCode == 8) {
    handleEvent("del", false);
    println("del");
  }
  if (keyCode == 67 || key == 'c') {
    handleEvent("clear", false);
    println("clear");
  }
}


void handleEvent(String val, boolean isNum) {
  if (isNum && dVal1.length() + dVal2.length()<20) {
    if (left) {
      if (dVal1.equals("0") || dVal1.equals(str(result))) {
        dVal1  = val;
      } else {
        dVal1 += val;
      }
      l= float(dVal1);
    } else {
      dVal2 += val;
      r=float(dVal2);
    }
  } else if (dVal1.length()+dVal2.length()<20) {
    if (val == "clear") {
      dVal2 = "";
      dVal1 = "0";
      l=0.0;
      r=0.0;
      result = 0.0;
      op = ' ';
      left = true;
    } else if (val == "+") {
      op = '+';
      left = false;
      dVal1 += '+';
    } else if (val == "-") {
      op = '-';
      left = false;
      dVal1 += '-';
    } else if (val == "/") {
      op = '/';
      left = false;
      dVal1 += '÷';
    } else if (val == "*") {
      op = '*';
      left = false;
      dVal1 += 'x';
    } else  if (val == "enter") {
      d4Val2 = d3Val2;
      d3Val2 = d2Val2;
      d2Val2 = dVal1+dVal2;
      performCalc();
      l = result;
      r = 0;
      d4Val1 = d3Val1;
      d3Val1 = d2Val1;
      d2Val1 = dVal1;
      left = true;
    } else if (val == ".") {
      if (left) {
        if (!dVal1.contains(".")) {
          dVal1 += '.';
        }
      } else if (!dVal2.contains("."))
        dVal2 += '.';
    } else  if (val == "del") {
      if (left) {
        if (dVal1.length()>1) {
          dVal1 = dVal1.substring(0, dVal1.length() - 1);
          l = float(dVal1);
        } else if (dVal1.length()==1) {
          dVal1 = "0";
          l = 0;
        }
      } else if (!left) {
        if (dVal2.length() >1) {
          dVal2 = dVal2.substring(0, dVal2.length() - 1);
          r = float(dVal2);
        } else if (dVal2.length()==1) {
          dVal2 = "";
          r = 0;
        } else if (op !=' ') {
          dVal1 = dVal1.substring(0, dVal1.length() - 1);
          left = true;

          println(op, left);
        }
      }
    }
  }
}


void performCalc() {

  if (op == '+') {
    result = l +r;
    dVal1 = str(result);
    dVal2 = "";
  }
  // operators
  else if (op == '-') {
    result = l -r;
    dVal1 = str(result);
    dVal2 = "";
  } else if (op == '*') {
    result = l * r;
    dVal1 = str(result);
    dVal2 = "";
  } else if (op == '/') {
    result = l / r;
    dVal1 = str(result);
    dVal2 = "";
  } else if (op == ' ') {
    result = l+r;
    dVal1 = str(result);
    dVal2 = "";
  } else if (op == '^') {
    result = pow(l, r);
    dVal1 = str(result);
    dVal2 = "";
  }
}

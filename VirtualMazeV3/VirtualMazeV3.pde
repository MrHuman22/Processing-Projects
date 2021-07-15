float res;
int cols, rows;
int x, y;
Option[] options;
ArrayList<Trace> path;
boolean debugMode;


boolean[][] grid;

void setup() {
  size(720, 720);
  debugMode = false;
  res = width/11;
  cols = 11;
  rows = 11;
  x = 5;
  y = 5;
  grid = new boolean[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = false;
    }
  }
  grid[x][y] = true;

  // setting our options
  options = new Option[4];
  options[0] = new Option(-1, 0, "Left");
  options[1] = new Option(0, -1, "Up");
  options[2] = new Option(1, 0, "Right");
  options[3] = new Option(0, 1, "Down");

  // init Footsteps
  path = new ArrayList<Trace>();
  path.add(new Trace(x, y));
}

void draw() {
  background(0);
  // get valid options
  ArrayList<Option> validOptions = new ArrayList<Option>();
  for (int i = 0; i < options.length; i++) {
    if (options[i].isValidMove()) {
      validOptions.add(options[i]);
    }
  }

  if (frameCount % 120 == 0) {
    int choice = floor(random(validOptions.size())); //
    validOptions.get(choice).move();
    if (debugMode) {
      println("Moving " + validOptions.get(choice).dir + "... Now x: " + x + ", y: " + y);
    }
    grid[x][y] = true;
    path.add(new Trace(x, y));

    if (debugMode) {
      print("Current Valid Options: ");
      for (Option o : validOptions) {
        print(o.dir + ", ");
      }
      print("\n");
    }
  }

  stroke(255);
  strokeWeight(5);
  noFill();
  beginShape();
  for (int i = 0; i < path.size(); i++) {
    vertex((path.get(i).pastX + 0.5)*res, (0.5 + path.get(i).pastY)*res);
  }
  endShape();

  fill(0);
  //draw circles on top
  for (Trace t : path) {
    t.show();
  }
}
/* <---------------------------------------------> */

void keyPressed() {
  if (keyCode == TAB) {
    debugMode = !debugMode;
  }
}

/* <---------------------------------------------> */

class Option {
  int dx;
  int dy;
  String dir;
  Option(int dx_, int dy_, String dir_) {
    dx = dx_;
    dy = dy_;
    dir = dir_;
  }

  void move() {
    x = x + dx;
    y = y + dy;
  }

  boolean isValidMove() {
    int newX = x + dx;
    int newY = y + dy;
    // check that it's on the board AND hasn't been visited before
    return (newX >= 0) && (newX < cols) && (newY >= 0) && (newY < rows) && (!grid[newX][newY]);
  }
}

/* <---------------------------------------------> */

class Trace {
  int pastX;
  int pastY;
  Trace(int x_, int y_) {
    pastX = x_;
    pastY = y_;
  }

  void show() {
    ellipse((pastX + 0.5) * res, (pastY + 0.5) * res, 0.5*res, 0.5*res);
  }
}

int rows, cols;
int pathLength;
Square[][] grid;
float res;
boolean pathFound;
int headCol;
int headRow;
int endCol;
int dx, dy;
int nextCol, nextRow;
int pathProgress;

void setup() {
  size(800, 800);
  pathLength = 20;
  rows = 8;
  cols = 8;
  res = width/rows;
  grid = new Square[cols][rows];
  initGrid();
  pickStartAndEnd();
  headRow = rows - 1;
  pathFound = false;
  nextRow = headRow;
  nextCol = headCol;
  pathProgress = 1;
}

void draw() {

  background(0);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j].show();
    }
  }
  // add to path
  if (frameCount%20 == 0 && !pathFound) {
    move();
  }
}

void chooseADirection() {
  switch(int(random(4))) {
  case 0:
    dx = 0;
    dy = -1;
    print("Move Up from (" + str(headCol) + ", " + str(headRow) + ")\t");
    break;
  case 1:
    dx = 0;
    dy = 1;
    print("Move Down from (" + str(headCol) + ", " + str(headRow) + ")\t");
    break;
  case 2:
    dx = -1;
    dy = 0;
    print("Move Left from (" + str(headCol) + ", " + str(headRow) + ")\t");
    break;
  case 3:
    dx = 1;
    dy = 0;
    print("Move Right from (" + str(headCol) + ", " + str(headRow) + ")\t");
    break;
  default:
    dx = 0;
    dy = 0;
    break;
  }
  nextCol = headCol + dx;
  nextRow = headRow + dy;
}

void move() {
  // don't allow illegal moves
  chooseADirection();
  //while(dy + headRow < 0 || dy + headRow >= rows || dx + headCol < 0 || dy + headCol >= cols){
  //  chooseADirection();
  //}
  if (!illegalMove() && !doublingUp() && !adjacentPath()) {
  //if (!illegalMove() && !doublingUp() && !adjacentPath()) {
    grid[headCol][headRow].type = "OnPath";
    headCol = nextCol;
    headRow = nextRow;
    pathProgress += 1;
    print("Making the move...\n");
  } else {
    print("Do nothing.\n");
  }
}

boolean illegalMove() {
  // checks if the next move is illegal
  if (nextCol < 0 || nextCol >= cols || nextRow < 0 || nextRow >= rows) {
    print("Illegal move - would go off board!\t");
    return true;
  } else {
    print("Legal move\t");
    return false;
  }
}

boolean doublingUp() {
  // not illegal moves are already excluded by illegalMove()
  // returns true if 
  if (grid[nextCol][nextRow].type == "OnPath" || grid[nextCol][nextRow].type == "Start") {
    print("Doubling-up detected!\t");
    return true;
  } else {
    print("No double-up detected\t");
    return false;
  }
}

boolean adjacentPath() {
  // counts the number of OnPaths (or Starts) around the next thing. Should only be 1
  int count = 0;
  if (nextCol - 1 >= 0 && grid[nextCol-1][nextRow].pathSquare) {
    count += 1;
  }
  if (nextCol + 1 < cols && grid[nextCol+1][nextRow].pathSquare) {
    count += 1;
  }
  if (nextRow - 1 >= 0 && grid[nextCol][nextRow - 1].pathSquare) {
    count += 1;
  }
  if (nextRow + 1 > rows && grid[nextCol][nextRow + 1].pathSquare) {
    count += 1;
  }
  if(count > 1){
    print("Adjacent path detected!\t");
    return true;
  } else {
    print("No adjacent path.\t");
    return false;
  }
  
}

void initGrid() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = new Square("OffPath", i, j);
    }
  }
}

void pickStartAndEnd() {
  int startCol = int(random(cols));
  grid[startCol][rows-1].type = "Start";
  grid[startCol][rows-1].pathSquare = true;
  endCol = int(random(cols));
  grid[endCol][0].type = "End";
  grid[endCol][0].pathSquare = true;
  headCol = startCol;
}

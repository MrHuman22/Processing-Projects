int rows, cols;
int pathLength;
Square[][] grid;
float res;
boolean pathFound;
int headCol;
int headRow;
int endCol;
int dx, dy;

void setup() {
  size(800, 800);
  pathLength = 20;
  rows = 8;
  cols = 8;
  res = width/rows;
  grid = new Square[cols][rows];
  initGrid();
  pickEnds();
  headRow = rows - 1;
  pathFound = false;
}

void draw() {

  background(0);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j].show();
    }
  }
  // add to path
  if(frameCount%20 == 0 && !pathFound){
    move();
  }
}

void chooseADirection(){
  switch(int(random(4))){
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
}

void move(){
  // don't allow illegal moves
  chooseADirection();
  //while(dy + headRow < 0 || dy + headRow >= rows || dx + headCol < 0 || dy + headCol >= cols){
  //  chooseADirection();
  //}
  if(dy + headRow < 0 || dy + headRow >= rows - 1 || dx + headCol < 0 || dy + headCol > cols - 1){
    print("Illegal move detected. Do nothing.\n");
  } else {
    headRow = dy + headRow;
    headCol = dx + headCol;
    grid[headCol][headRow].type = "OnPath";
    print("\n");
  }
  
  
  
}

void initGrid(){
 for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = new Square("OffPath",i,j);
    }
  }
}

void pickEnds(){
  int startCol = int(random(cols));
  grid[startCol][rows-1].type = "Start";
  endCol = int(random(cols));
  grid[endCol][0].type = "End";
  headCol = startCol;
}

int rows, cols;
int pathLength;
Square[][] grid;
float res;

void setup() {
  size(800, 800);
  pathLength = 20;
  rows = 8;
  cols = 8;
  res = width/rows;
  grid = new Square[cols][rows];
  initGrid();
  pickEnds();
 
  
}

void draw() {
  background(0);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j].show();
    }
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
  int endCol = int(random(cols));
  grid[endCol][0].type = "End";
}

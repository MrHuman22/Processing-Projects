class Grid {
  Square[][] grid; // stores probability data as well as movement data
  int rows, cols, startCol, endCol;

  Grid(int cols_, int rows_) {
    rows = rows_;
    cols = cols_;
    grid = new Square[cols][rows];
    initGrid();
  }

  void initGrid() {
    // fills the grid with squares with col, row coordinates
    // updates the edges
    // adds the moves
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        Square newSquare = new Square(i, j);

        // if right of left edge, fill with moves to the left,
        if (i > 0) {
          newSquare.addInitMoves(-1,0);
        }
        
        // if left of right edge, add moves right
        if (i < cols - 1){
          newSquare.addInitMoves(1,0);
        }
        
        // if below top row, add moves up
        if(j > 0){
          newSquare.addInitMoves(0,-1);
        }
        
        // if above bottom row, add moves down
        if(j < rows -1){
          newSquare.addInitMoves(0,1);
        }
        grid[i][j] = newSquare;
      }
    }
    
    // choose the start and end
    startCol = int(random(cols-1));
    endCol = int(random(cols-1));
    
    // set start and end square
    grid[endCol][0].mark();
    grid[startCol][rows-1].mark();
  }

  void update() {
    // loop over the grid and distribute movement data across the grid
    // update moves depending on current grid state
  }

  void show() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        grid[i][j].show();
      }
    }
  }
  
  void hover(){
    // work out over which square the mouse sits
    // call temporaryshow on that square
    int mouseCol = floor(mouseX/res);
    int mouseRow = floor(mouseY/res);
    grid[mouseCol][mouseRow].tempShow();
    for(Pos move: grid[mouseCol][mouseRow].moves){
      Pos neighbour = grid[mouseCol][mouseRow].getNeighbourCoords(move);
      grid[neighbour.col][neighbour.row].tempShow();
    }
    
  }
}

class Grid{
  Square[][] grid; // stores probability data as well as movement data
  int rows, cols;
  
  Grid(int cols_, int rows_){
    rows = rows_;
    cols = cols_;
    grid = new Square[cols][rows];
    initGrid();
    
  }
  
  void initGrid(){
     // fills the grid with squares with col, row coordinates
     // updates the edges
     // adds the moves
  }
  
  void update(){
    // loop over the grid and distribute movement data across the grid
    // update moves depending on current grid state
  
  }
  
  void show(){
    for(int i = 0; i < cols; i++){
      for(int j = 0; j < rows; j++){
        grid[i][j].show();
      }
    }
  }
}

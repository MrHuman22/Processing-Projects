class Pos{
  int col, row;
  //int nextCol, nextRow;
  
  Pos(int col_, int row_){
    col = col_;
    row = row_;
  }
  
  void shift(Pos other){
    col += other.col;
    row += other.row;
  }
  
  //Pos step(Pos other){
  //  // returns the position
  //  return new Pos(col+other.col, row + other.row);
  //}
  

}

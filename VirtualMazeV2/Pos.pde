class Pos{
  int col, row;
  
  Pos(int col_, int row_){
    col = col_;
    row = row_;
  }
  
  void add(Pos other){
    col += other.col;
    row += other.row;
  }
}

class Seeker {
  Pos pos;
  Seeker() {
    pos = new Pos(grid.startCol, grid.rows-1);
  }
  
  void show(){
    noStroke();
    fill(255,20, 20);
    ellipse((pos.col + 0.5)*res, (pos.row + 0.5)*res, res/2, res/2);
  }
  
  
}

class Square{
  Pos pos;
  boolean onPath;
  int routes; // how many squares lead to this square
  boolean noMovesLeft;
  ArrayList<Pos> moves;
  color col;
  
  Square(int col, int row){
    pos = new Pos(col, row);
    moves = new ArrayList<Pos>();
    onPath = false;
    noMovesLeft = false;
    col = color(0);
  }
  
  void update(){
    // chooses a random element from moves
    Pos choice = moves.get(floor(random(moves.size()))); // round down
    pos.shift(choice);
    
  }
  
  void show(){
      // shows the square
      fill(col);
      stroke(255);
      strokeWeight(5);
      rect(pos.col*res, pos.row*res, res, res);
  }
  
  void mark(){
    onPath = true;
    col = color(160, 225, 255);
  }
  
  void addInitMoves(int colOffset, int rowOffset){
    for(int k = 0; k < 4; k++){
      moves.add(new Pos(colOffset, rowOffset));
    }
  }
  
  Pos getNeighbourCoords(Pos offset){
    return new Pos(pos.col + offset.col, pos.row + offset.row);
  }
  
  void tempShow(){
    fill(255, 100);
    stroke(255);
    strokeWeight(5);
    rect(pos.col*res, pos.row*res, res, res);
  }

}

class Square{
  String type;
  int col, row;
  boolean pathSquare;
  Square(String type_, int col_, int row_){
    type = type_;
    col = col_;
    row = row_;
    pathSquare = false;
  }
  
  void show(){
    switch(type){
      case "End":
        fill(10,10,255);
        break;
      case "Start":
        fill(10,255,10);
        break;
      case "OnPath":
        fill(255);
        break;
      case "OffPath":
        fill(0);
        break;
    }
    stroke(255);
    strokeWeight(5);
    rect(res*col, res*row, res, res);
  }
  

}

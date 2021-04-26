class EndEffector{
  PVector pos; // determined by the positions of the winches
  
  EndEffector(Winch w1, Winch w2){
    pos = locateEndEffector(w1, w2);
  }
  
  PVector locateEndEffector(Winch w1, Winch w2){
    PVector soln = new PVector(0,0);
    // solve the equation of intersection of 2 circles
    return soln;
  }
  
  float angularPositionToR(Winch w1, Winch w2){
    
  }
}

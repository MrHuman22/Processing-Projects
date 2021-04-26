class Winch{
  PVector centre, pos;
  float radius;
  float angle;
  // needs to know it's own circumference
  float C;
  float aPos;
  float spoolLength;
  
  Winch(float x, float y, float r, float len){
    centre = new PVector(x,y);
    radius = r;
    C = 2*PI*radius;
    aPos = len/C*TWO_PI;
    pos = new PVector(centre.x + radius*cos(aPos), centre.y + radius*cos(aPos));
}
  
  float spoolL2aPos(float spoolL){
    return spoolL/C*TWO_PI;
  }
  
  float aPos2Spool(float aPos){
    return C/(aPos*TWO_PI);
  }
  
  void updateInverse(float len){
    aPos = len/C*TWO_PI;
    pos.set(centre.x + radius*cos(aPos), centre.y + radius*sin(aPos));
  }
  
  void show(){
    stroke(255);
    strokeWeight(3);
    noFill();
    ellipse(centre.x, centre.y, radius, radius);
    strokeWeight(1);
    line(centre.x, centre.y, pos.x, pos.y);
  }
}

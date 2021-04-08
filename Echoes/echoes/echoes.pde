PVector[] pointSource;
int pointCount;
float t, v;

void setup(){
  size(1000, 1000);
  pointCount = 360;
  pointSource = new PVector[pointCount];
  noFill();
  stroke(255,100);
  t = 0;
  v = 1;
  updateWavefront();
  strokeWeight(5);
}

void draw(){
  background(0);
  updateWavefront();
  renderWavefront();
  t += 1;
}

void updateWavefront(){
  for(int i = 0; i < pointCount; i++){
    PVector prev = pointSource[i];
    float currentX, currentY;
    if(prev.x < 0){
      
    }
    pointSource[i] = new PVector(v*t*cos(i), v*t*sin(i));
  }
}

void renderWavefront(){
  pushMatrix();
  translate(width/2, height/2);
  //beginShape();
  for(int i = 0; i < pointCount; i++){
     PVector p = pointSource[i];
     //vertex(p.x, p.y);
     point(p.x, p.y);
  }
  //endShape(CLOSE);
  popMatrix();
}

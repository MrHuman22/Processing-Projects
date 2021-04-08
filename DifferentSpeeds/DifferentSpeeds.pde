import processing.sound.*;

/* 
Can be used to show polyrythms
*/

float circleDiam, r, theta, miniCircleDiam;
PVector startPos;


PVector c1pos, c2pos, c3pos;
PVector[] circles;
int circleCount;
SoundFile clap;


void setup() {
  size(720, 720, P2D);
  circleDiam = width*0.75;
  miniCircleDiam = circleDiam/5;
  fill(0);
  stroke(255);
  strokeWeight(10);
  theta = 0;
  r = circleDiam/2;
  circleCount = 5;
  clap = new SoundFile(this, "clap.wav");
  startPos = new PVector(r, 0);
  circles = new PVector[circleCount];
  updateAndDrawCircles(theta);
}

void draw() {
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  ellipse(0, 0, circleDiam, circleDiam);
  updateAndDrawCircles(theta);
  popMatrix();
  theta += 0.01;
}

void updateAndDrawCircles(float theta) {
  for (int i = 0; i < circleCount; i++) {
    circles[i] = new PVector(r*cos((i+1)*theta), r*sin((i+1)*theta),0);
    if((circles[i].dist(startPos) < 10) && (circles[i].z == 0) ){
      stroke(0,255,0);
      //clap.play();
    } else {
      stroke(255);
    }
    ellipse(circles[i].x, circles[i].y, miniCircleDiam, miniCircleDiam);
  }
}

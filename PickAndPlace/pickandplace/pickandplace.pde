/*
Show how the string lengths can be calculated and controlled from the winches
 */

// defining key points
PVector PostLeft, PulleyLeft, PulleyRight, PostRight;
PVector target;
Winch winchLeft, winchRight;
PVector R, r;
float a;
int winchSize;


void setup() {
  size(1000, 1000);
  ellipseMode(RADIUS);
  
  // the frame
  PostLeft = new PVector(150, height-150);
  PulleyLeft = new PVector(150, 150);
  PulleyRight = new PVector(width-150, 150);
  PostRight = new PVector(width-150, height - 150);
  
  //the end effector
  target = new PVector(width/2, height/2); //init at centre
  R = PVector.sub(target,PulleyLeft);
  r = PVector.sub(target,PulleyRight);
  
  // the winches
  winchSize = 30;
  winchLeft = new Winch(PostLeft.x - winchSize, PostLeft.y, winchSize, R.mag());
  winchRight = new Winch(PostRight.x + winchSize, PostRight.y, winchSize, R.mag());

  
}

void draw() {
  background(0);

  target.set(mouseX, mouseY);
  //target.set(width/2, height/2 + 350*sin(a)); // testing straight up and down
  //target.set(PulleyLeft.x+350*cos(a), PulleyLeft.y+350*sin(a));
  R = PVector.sub(target,PulleyLeft);
  r = PVector.sub(target,PulleyRight);
  
  // update and draw winches
  winchLeft.updateInverse(R.mag());
  winchLeft.show();
  winchRight.updateInverse(r.mag());
  winchRight.show();

  // draw the frame
  drawAll();
  
  // increment the angle;
  //a += 0.01;
  
  
}

void drawAll(){
  drawFrame();
  showTarget();
  showString();
  showCircles();
  displayCoords(PulleyLeft, "Above");
  displayCoords(PulleyRight, "Above");
  displayCoords(target, "Below");
  
  showRadii(R,"R",width/2, height*0.8);
  showRadii(r,"r",width/2, height*0.8+15);
}

void showRadii(PVector radius, String name, float x, float y){
  // pick a point halfway between the target and the pulley
  float r = radius.mag();
  text(name + ": " + str(r),x, y);
  
}

void showCircles() {
  stroke(255, 255, 255, 100);
  strokeWeight(1);
  noFill();
  ellipse(PulleyLeft.x, PulleyRight.y, R.mag(), R.mag());
  ellipse(PulleyRight.x, PulleyRight.y, r.mag(), r.mag());
}

void drawFrame() {
  stroke(255);
  strokeWeight(10);
  noFill();
  beginShape();
  vertex(PostLeft.x, PostLeft.y);
  vertex(PulleyLeft.x, PulleyLeft.y);
  vertex(PulleyRight.x, PulleyRight.y);
  vertex(PostRight.x, PostRight.y);
  endShape();
}

void showString() {
  stroke(255);
  strokeWeight(2);
  line(PulleyLeft.x, PulleyLeft.y, target.x, target.y);
  line(PulleyRight.x, PulleyRight.y, target.x, target.y);
}

void showTarget() {
  fill(255);
  ellipse(target.x, target.y, 10, 10);
}



void displayCoords(PVector keyPoint, String pos) {
  String textToDisplay = "( " + str(keyPoint.x) + ", " + str(keyPoint.y) + " )";
  switch(pos) {
  case "Above" :
    text(textToDisplay, keyPoint.x, keyPoint.y - 10);
    break;
  case "Below" :
    text(textToDisplay, keyPoint.x, keyPoint.y + 30);
    break;
  default:
    text(textToDisplay, keyPoint.x, keyPoint.y - 10);
    break;
  }
}

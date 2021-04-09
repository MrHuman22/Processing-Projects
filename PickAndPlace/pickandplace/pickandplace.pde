/*
Show how the string lengths can be calculated and controlled from the winches
 */

// defining key points
PVector WinchLeft, PulleyLeft, PulleyRight, WinchRight;
PVector target;
PVector R, r;

void setup() {
  size(1000, 1000);
  WinchLeft = new PVector(150, height-150);
  PulleyLeft = new PVector(150, 150);
  PulleyRight = new PVector(width-150, 150);
  WinchRight = new PVector(width-150, height - 150);

  ellipseMode(RADIUS);
  target = new PVector(width/2, height/2);
}

void draw() {
  background(0);

  target.set(mouseX, mouseY);
  R = PVector.sub(target, PulleyLeft);
  r = PVector.sub(target, PulleyRight);

  // draw the frame
  drawFrame();
  showTarget();
  showString();
  showRadii();
  displayCoords(PulleyLeft, "Above");
  displayCoords(PulleyRight, "Above");
  displayCoords(target, "Below");
}

void showRadii() {
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
  vertex(WinchLeft.x, WinchLeft.y);
  vertex(PulleyLeft.x, PulleyLeft.y);
  vertex(PulleyRight.x, PulleyRight.y);
  vertex(WinchRight.x, WinchRight.y);
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

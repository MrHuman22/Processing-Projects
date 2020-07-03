/* 
Author: Peter Newman
Intention: I want to show the relative motions of various cams and followers
*/
float diameter, radius;

void setup(){
  size(720, 720);
  diameter = 300;
  radius = diameter/2;
  strokeWeight(5);
  noFill();
  stroke(255);
}

void draw(){
  background(0);
  pushMatrix();
    translate(width/2, height/3);
    ellipse(0,0,diameter,diameter);
  popMatrix();

}

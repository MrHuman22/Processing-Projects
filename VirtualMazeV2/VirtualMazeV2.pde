/* in this model, we have a seeker moving about the board 
It inspects the square it's on and chooses a direction based on the weighting of that square
Squares can be biased in various ways depending on the evolution of the path
All squares control for out of bounds errors and can be biased by removing
instances of offsets from the pool
There is a custom Pos which is a grid version of the PVector class
*/

Grid grid;
float res;
boolean inspectMode;
Seeker s;


void setup(){
  size(800, 800);
  res = width/8;
  inspectMode = false;
  grid = new Grid(8, 8);
  s = new Seeker();
}

void draw(){
  background(0);
  grid.show();
  if(inspectMode){
    grid.hover();
  }
  s.show();
}

void keyPressed(){
  if(key == ' '){
    inspectMode = !inspectMode;
  }
}

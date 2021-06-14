// step 1: make a single piano key = white bar in the middle of the screen
Keyboard k;

void setup() {
  size(1000,500);
  k = new Keyboard();
  
}

void draw() {
  background(0);
  positionMouse();
  k.show();
  
}

void positionMouse(){
  

}

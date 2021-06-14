import processing.sound.*;

// step 1: make a single piano key = white bar in the middle of the screen
Keyboard kb;


void setup() {
  size(1000, 500);
  kb = new Keyboard();
}

void draw() {
  background(0);
  kb.positionMouse();
  kb.show();
}

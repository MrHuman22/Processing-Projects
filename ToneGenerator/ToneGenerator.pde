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
  kb.hover();
  kb.show();
  //kb.playNotes();
}

void mousePressed(){
  if(mouseButton == LEFT){
    kb.keys[kb.selectedKey].isSelected = true;
    println("Selecting Key ", str(kb.selectedKey), "-->", kb.keys[kb.selectedKey].note, " isSelected: ",  kb.keys[kb.selectedKey].isSelected);
  } else if(mouseButton == RIGHT){
    kb.keys[kb.selectedKey].toggleSustain();
    println("Toggling Sustain on Key ",  str(kb.selectedKey), "-->", kb.keys[kb.selectedKey].note, " isSustained: ", kb.keys[kb.selectedKey].isSustained); 
  }
}

void mouseReleased(){
 
    kb.keys[kb.selectedKey].isSelected = false;
    println("Deselecting Key ", str(kb.selectedKey), "-->", kb.keys[kb.selectedKey].note, " isSelected: ",  kb.keys[kb.selectedKey].isSelected);
  
}

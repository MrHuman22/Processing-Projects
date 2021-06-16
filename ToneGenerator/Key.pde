class Key {
  /*
   Each key has an associated frequency
   It needs to be able to detect if it's been pressed
   */
  float freq, w, h;
  String note;
  PVector topL;
  boolean isWhite;
  boolean isSustained = false;
  boolean isSelected = false;
  boolean isUnderMouse = false;

  Key(String note_, float freq_, boolean isWhite_) {
    note = note_;
    freq = freq_;
    isWhite = isWhite_;
    // always lines up with the top left
    if (isWhite) {
      w = width/8;
      h = height;
    } else {
      w = width/16;
      h = height*0.75;
    }
  }
  
  void toggleSustain(){
    isSustained = !isSustained;
  }

  void show() {
    stroke(0);
    strokeWeight(2);
    if(isSustained){
      fill(255, 30, 30);
    } else if (isSelected) {
      fill(30, 255, 30);
    } else if (isUnderMouse) {
      fill(30, 30, 255);
    } else if (isWhite) {
      fill(255);
    } else {
      fill(0);
    }
    rect(topL.x, topL.y, w, h);
  }
}

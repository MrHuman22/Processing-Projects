class Keyboard {
  Key[] keys;
  SinOsc sineWaves;
  Keyboard() {
    keys = new Key[13];
    initKeys();
  }

  void initKeys() {
    keys[0] = new Key("C", 261.63, true);
    keys[1] = new Key("C#", 277.18, false);
    keys[2] = new Key("D", 293.66, true);
    keys[3] = new Key("D#", 311.13, false);
    keys[4] = new Key("E", 329.63, true);
    keys[5] = new Key("F", 349.23, true);
    keys[6] = new Key("F#", 369.99, false);
    keys[7] = new Key("G", 392.00, true);
    keys[8] = new Key("G#", 415.30, false);
    keys[9] = new Key("A", 440.00, true);
    keys[10] = new Key("A#", 466.16, false);
    keys[11] = new Key("B", 493.88, true);
    keys[12] = new Key("C", 523.25, true);

    // now positioning the keys
    keys[0].topL = new PVector(0, 0);

    for (int i = 1; i < keys.length; i++) {
      float w = keys[i].w;
      if (keys[i].isWhite) {
        if (keys[i-1].isWhite) {
          keys[i].topL = new PVector(keys[i-1].topL.x+w, 0);
        } else {
          keys[i].topL = new PVector(keys[i-2].topL.x + w, 0);
        }
      } else {
        keys[i].topL = new PVector(keys[i-1].topL.x+w*1.5, 0);
      }
    }
  }

  void positionMouse() {
    // first, set all things to not selected
    for (Key eachK : keys) {
      eachK.isUnderMouse = false;
    }

    for (int i = 0; i < keys.length; i++) {
      // grabbing relevant info
      float x = keys[i].topL.x;
      float w = keys[i].w;
      float h = keys[i].h;
      // set the black keys BEFORE the white keys
      if (!keys[i].isWhite) {
        if (mouseX > x && mouseX < x+w && mouseY < h) {
          keys[i].isUnderMouse = true;
          keys[i-1].isUnderMouse = false;
          return; //finish early
        }
      } else {
        if (mouseX > x && mouseX < x+w && mouseY < h) {
          keys[i].isUnderMouse = true;
        }
      }
    }
  }

  void show() {
    //first draw the white keys
    for (Key k : keys) {
      if (k.isWhite) {
        k.show();
      }
    }

    //now draw the black keys
    for (Key k : keys) {
      if (!k.isWhite) {
        k.show();
      }
    }
  }
}

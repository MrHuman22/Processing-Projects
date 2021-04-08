// Attempt 1 with arrays


//Tentacle t;
Tentacle[] creature;

void setup(){
    size(1000, 1000);
    creature = new Tentacle[1];
    creature[0] = new Tentacle(width/2, height/2);
    stroke(255);
    strokeWeight(5);
}

void draw(){
    background(0);
    for(Tentacle t: creature){
    t.update();
    t.show();
    }
}

Segment seg1, seg2;

void setup(){
    size(1000, 1000);
    seg1 = new Segment(width/2, height/2, 100, 0);
}

void draw(){
    background(0);
    seg1.show();
}
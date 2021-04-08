class Segment{
    // needs a start, an end and an angle
    PVector a;
    PVector b;
    float relAngle; // it's own offset
    float absAngle; // related the angular position of the parent
    float length;
    boolean isRoot;
    int lineThick;
    float xOff;

    // root constructor
    Segment(float x, float y, float length_, float angle_, int lineThick_){
        a = new PVector(x,y);
        length = length_;
        relAngle = angle_;
        absAngle = relAngle;
        calculateEndPoint(); // calculates b
        isRoot = true;
        lineThick = lineThick_;
        xOff = random(10000);
    }
    
    //child constructor
    Segment(Segment parent, float length_, float angle_, int lineThick_){
      a = new PVector(parent.b.x,parent.b.y);
      length = length_;
      relAngle = angle_;
      absAngle = parent.absAngle + relAngle;
      calculateEndPoint();
      isRoot = false;
      lineThick = lineThick_;
      xOff = random(10000);
    }

    void calculateEndPoint(){
        float bx = a.x + length*cos(absAngle);
        float by = a.y + length*sin(absAngle);
        b = new PVector(bx, by);
    }

    void show(){
        strokeWeight(lineThick);
        line(a.x, a.y, b.x, b.y);
    }
    
    void wiggle(){
      //relAngle -= 0.01;
      xOff += 0.005;
      relAngle = map(noise(xOff),0,1,-PI/2, PI/2);
    }
    
    void update(float parentAngle){
      absAngle = parentAngle + relAngle;
    }
    
}

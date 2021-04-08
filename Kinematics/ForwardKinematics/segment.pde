class Segment{
    // needs a start, an end and an angle
    PVector a;
    PVector b;
    float angle;
    float length;


    Segment(float x, float y, float length_, float angle_){
        a = new PVector(x,y);
        length = length_;
        angle = angle_;
        calculateEndPoint(); // calculates b
    }

    void calculateEndPoint(){
        float bx = length*cos(angle);
        float by = length*sin(angle);
        b = new PVector(bx, by);
    }

    void show(){
        line(a.x, a.y, b.x, b.y);
    }

}
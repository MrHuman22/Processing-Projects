class Tentacle{
  // tentacles consist of an array of segments
  // the tentacle knows which segments are connected
  
  Segment[] tentacle;
  float anchorX;
  float anchorY;
  int segCount;
  
  Tentacle(float anchorX_, float anchorY_){
    segCount = 20;
    tentacle = new Segment[segCount];
    anchorX = anchorX_;
    anchorY = anchorY_;
    initTentacle();
    
  }
  
  void initTentacle(){
    tentacle[0] = new Segment(anchorX, anchorY, 100, random(TWO_PI), 20);
    float scale;
    scale = 0.75;
    for(int i = 1; i < segCount; i++){
      if(i == 1){
        tentacle[i] = new Segment(tentacle[0],tentacle[0].length*scale,random(TWO_PI),round(tentacle[0].lineThick*scale));
      } else {
        tentacle[i] = new Segment(tentacle[i-1], tentacle[i-1].length*scale, random(TWO_PI), round(tentacle[i-1].lineThick*scale));
      }
    }
  }
  
  void show(){
  for(int i = 0; i < tentacle.length; i++){
      tentacle[i].show();
    }
  }
  
  void update(){
    for(int i = 0; i < tentacle.length; i++){
      tentacle[i].wiggle();  
      // if it's the root, then 
      if(tentacle[i].isRoot){
        tentacle[i].update(0);
        
      } else {
        tentacle[i].a = tentacle[i-1].b.copy(); // update the start point
        tentacle[i].update(tentacle[i-1].absAngle); // update the angle  
      }
      
      tentacle[i].calculateEndPoint(); //regardless, calculate the end point
    }
  }
  
}

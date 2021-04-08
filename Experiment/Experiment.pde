float theta, r;

void setup(){
  size(720, 720);
  theta = 0;
  r = 300;
}

void draw(){
   background(0);
   noFill();
   stroke(255);
   strokeWeight(5);
   ellipse(width/2, height/2, 600, 600);
   fill(255);
   ellipse(width/2 + r*cos(theta), height/2 +  r*sin(theta), 50, 50);
   
   theta += 0.01;
   
}

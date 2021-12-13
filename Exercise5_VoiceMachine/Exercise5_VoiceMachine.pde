import ddf.minim.*;

Minim minim;
AudioInput in;  

float number = 200;
float x,y,w,h;

void setup() {
  size(700, 700, P3D);
  background(0);
  noStroke();
  surface.setTitle("VoiceMachine... Press 'Space' to refresh  " + frameRate);

  minim = new Minim(this);
  in = minim.getLineIn();
}

void draw() {
  
  float a = 0;
  float angle = (2*PI) /70;
  int step = in.bufferSize() / 70;
  for (int i=0; i < in.bufferSize()-step; i+=step) {
    float x1 = width/2 + cos(a) * (1000 * in.mix.get(i) + 100);
    float y1 = height/2 + sin(a) * (1000 * in.mix.get(i) + 100);
    float x2 = width/2 + cos(a + angle) * (1000 * in.mix.get(i+step) + 100);
    float y2 = height/2 + sin(a + angle) * (1000 * in.mix.get(i+step) + 100);
    stroke(random(255), random(255),random(255));
     line(y1, x1, y2, x2);
    a += angle;
    println("a:  ", a , "   x1:", x1);
    
    if(x1 >= 750){   //automatically refresh when x1 reaches 750.
    //background(0);
    background(random(10));
    }
  }
  
  if(keyPressed && key == ' '){
    background(0);
  }
}

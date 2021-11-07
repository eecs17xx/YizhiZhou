import ddf.minim.*;

Minim minim;
AudioInput in;  

float number = 200;
float x,y,w,h;

void setup() {
  size(700, 700, P3D);
  background(0);
  noStroke();

  minim = new Minim(this);
  in = minim.getLineIn();
}

void draw() {
  
    float a = 0;
    float angle = (2*PI)/90;
    int step = in.bufferSize()/100;
    
    for (int i = 0; i < number-step; i++) {
    stroke(random(255), random(100), random(100));
    x = width/2 + cos(a) * (1000 * in.mix.get(i) + 50);
    y = height/2 + sin(a) * (1000 * in.mix.get(i) + 50);
    w = width/2 + cos(a + angle) *(700 * in.mix.get(i+step) + 50);
    h = height/2 + sin(a + angle) *(888 * in.mix.get(i+step) + 50);
    line(x, y, w, h);
    a+= angle;
    println(x);

  }
  
  if(keyPressed && key == ' '){
    background(0);
  }
}

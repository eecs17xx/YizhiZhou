//Exercise5

import processing.sound.*;
import ddf.minim.*;
import ddf.minim.ugens.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

AudioIn mic;
Amplitude amp;

int num = 5000;
float mts = PI/600;
float r = 100;
int rdtr = 120;
int rdu = 5;

PVector v[] = new PVector[num];
boolean mv = true;
boolean mo = true;
color c[] = new color[num];  //color of dots
float theta[] = new float[num];  //initial angle
float mtheta[] = new float[num]; //switch from angle to exact values
float dtheta[] = new float[num]; //speed
float easing[] = new float[num];
int rdt[] = new int[num];


void setup() {
  frameRate(60);
  colorMode(RGB,255);
  size(1300,900,P2D);
  for(int i =0; i < num-1; i++){
    c[i] = color(random(20,255),random(0,255),random(0,255));
    v[i] = new PVector(random(width),random(height));
    theta[i] = round(random(360));
    dtheta[i] = random(mts);
    mtheta[i] = theta[i]/180*PI;
    rdt[i] = round(random(-rdtr, rdtr));
    easing[i] = random(0.02, 0.3);
  }
  
  mic = new AudioIn(this, 1);
  mic.start();
  amp = new Amplitude(this);
  amp.input(mic);
}

void draw() {

  fill(0,0,0,25);
  rect(0,0,width,height);
  pushMatrix();
  noStroke();
  
  r = map (amp.analyze(),0,0.1,100,width-200);
  
  if (mv) {
    if (mo) {
      for (int i = 0; i < num-1; i++){
        mtheta[i] += dtheta[i];
        v[i].lerp(mouseX+cos(mtheta[i])*(rdt[i]+r), mouseY+sin(mtheta[i])*(rdt[i]+r),0,easing[i]);
        fill(c[i]);
        ellipse(v[i].x,v[i].y,rdu,rdu);
      }
    }
   if (!mo) {
      for (int i = 0; i < num-1; i++){
        v[i].lerp(mouseX+cos(mtheta[i])*(rdt[i]+r), mouseY+sin(mtheta[i])*(rdt[i]+r),0,easing[i]);
        fill(c[i]);
        ellipse(v[i].x,v[i].y,rdu,rdu);
      }
    }
  }
  
  if (!mv) {
    if (mo) {
      for (int i = 0; i < num-1; i++){
        mtheta[i] += dtheta[i];
        v[i].lerp(mouseX+cos(mtheta[i])*(rdt[i]), mouseY+sin(mtheta[i])*(rdt[i]),0,easing[i]);
        fill(c[i]);
        ellipse(v[i].x,v[i].y,rdu,rdu);
      }
    }
   if (!mo) {
      for (int i = 0; i < num-1; i++){
        v[i].lerp(mouseX+cos(mtheta[i])*(rdt[i]), mouseY+sin(mtheta[i])*(rdt[i]),0,easing[i]);
        fill(c[i]);
        ellipse(v[i].x,v[i].y,rdu,rdu);
      }
    }
  }
  popMatrix();
  fill(0);
  rect(0,0,width,15);
  fill(255);
  textAlign(LEFT, TOP);
  text("r= "+ r,0,0);
  text("fps = "+ round(frameRate), 80,0);
}

//Gather together
void mousePressed() {
  mv = !mv;
}

void keyPressed() {
  if (key == ' ' || key == ' ') {
    mo = !mo;
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (e == -1) r += 10;
  if (e ==1) r -= 10;
}

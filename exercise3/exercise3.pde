PImage bg;

float rotSeconds = 0;
float rotMinutes = 0;
float rotHours = 0;
int lastSecond = 0;
int lastMinute = 0;
int lastHour = 0;

float faceSize = 500;
float lengthSecondHand = 220;
float lengthMinuteHand = 170;
float lengthHourHand = 120;

color outlineCol = color(85, 245, 85);
color secondCol = color(85, 245, 85);
color faceCol = color(0);

PFont font;

void setup() {
  size(800, 600, P2D); 
  strokeWeight(2);

  bg = loadImage("bg.jpg");
  bg.resize(800, 600);
  
    background(bg);
}

void draw() {
  background(bg);
  int s = second();
  int m = minute();
  int h = hour();
  int d = day();     
  int mo = month();   
  int y = year();
  
  String secondBeatiful = s + "";
  String minuteBeatiful = m + "";
  String hourBeatiful = h + "";
  if (s < 10) {
    secondBeatiful = "0" + s;
  }
  if (m < 10) {
    minuteBeatiful = "0" + m;
  }
  if (h < 10) {
    hourBeatiful = "0" + h;
  }
  
  font = createFont("Arial", 20);
  textFont(font);
  String currentTime = hourBeatiful + ":" + minuteBeatiful + ":" + secondBeatiful;
  textSize(40);
  text(currentTime,  20, 50);
  String currentDate = y + "/" + mo + "/" + d;
  textSize(25);
  text(currentDate,  35, 85);
  
  if (s != lastSecond) {
    rotSeconds = ((float) s / 60) * TWO_PI;
    lastSecond = s;
  }
  
  if (m != lastMinute) {
    rotMinutes = ((float) m / 60) * TWO_PI; 
    lastMinute = m;
  }
  
  if (h != lastHour) {
    rotHours = ((float) h / 12) * TWO_PI;  
    println(h);
    lastHour = h;
  }
  
  fill(faceCol);
  stroke(outlineCol);
  ellipse(width/2, height/2, faceSize, faceSize);
  
  stroke(255, 245, 2555, 45);
  for(int i=0; i<12; i++) {
    float rot = ((float) i/12) * TWO_PI;
    pushMatrix();
    translate(width/2, height/2);
    rotate(rot);
    line(0, faceSize/5, 0, faceSize/7);
    popMatrix();
  }
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(rotSeconds);
  fill(secondCol);
  stroke(secondCol);
  line(0,0,0, -lengthSecondHand);
  ellipse(0, -lengthSecondHand, 3,10);
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(rotMinutes);
  fill(0);
  stroke(outlineCol);
  line(0,0,0, -lengthMinuteHand);
  ellipse(0, -lengthMinuteHand, 5,5);
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(rotHours);
  line(0,0,0, -lengthHourHand);
  ellipse(0, -lengthHourHand, 7,5);
  popMatrix();
  
  fill(faceCol);
  ellipse(width/2, height/2, 10, 10);
}

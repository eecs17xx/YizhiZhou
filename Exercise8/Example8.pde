import oscP5.*;
import netP5.*;

String ipNumber = "127.0.0.1";
int receivePort = 7110;
int sendPort = 7400;
OscP5 oscP5;
NetAddress myRemoteLocation;

String channel = "test";

Button button;

PFont font;
int fontSize = 24;
color receiveOff = color(50,0,0);
color receiveOn = color(255,50,0);
color receiveNow = receiveOff;
float sizeOff = 100;
float sizeOn = 110;
float sizeNow = sizeOff;

float oscSendData = 0;
float oscReceiveData = 0;

void setup() {
  size(700, 550, P2D);
  oscSetup();
  button = new Button(width/4,height/2,100,color(0,100,50),fontSize,"Send","ellipse");
  font = createFont("Arial",fontSize);
}

void draw(){
  background(127);
  
  fill(0);
  textAlign(CENTER);
  textFont(font,fontSize);
  text("OSC Send",width/4,fontSize*1.5);
  text("OSC Receive",(width/4)+(width/2),fontSize*1.5);
   
  button.update();
  
  if (oscReceiveData > 0.5) {
    sizeNow = sizeOn;
    receiveNow = receiveOn;
  } else {
    sizeNow = sizeOff;
    receiveNow = receiveOff;  
  }

  fill(receiveNow);
  rect((width/4)+(width/2),height/2,sizeNow,sizeNow);
}


void oscSetup() {
  oscP5 = new OscP5(this, receivePort);  // start osc
  myRemoteLocation = new NetAddress(ipNumber, sendPort);
}

void oscEvent(OscMessage myMessage) {
  println(myMessage);
  if(myMessage.checkAddrPattern("/" + channel)) {
    if(myMessage.checkTypetag("f")) {  // types are i = int, f = float, s = String, ifs = all
      oscReceiveData = myMessage.get(0).floatValue();  // commands are intValue, floatValue, stringValue
    }  
  }
}

void oscSend(){
  OscMessage myMessage;
  myMessage = new OscMessage("/" + channel);
  myMessage.add(oscSendData);
  oscP5.send(myMessage, myRemoteLocation);
}

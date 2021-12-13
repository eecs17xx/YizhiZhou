//Exercise7

PShader shader;

void setup() {
  size(1000, 800, P2D);
  shader = loadShader("blobby.glsl");
  shader.set("resolution", float(width), float(height));
  shader.set("rate", random(0.8,1.6));
  shader.set("depth", random(0.6,1.8));
}

void draw() {
  background(mouseX,mouseY,100);
  
  noStroke();
  fill(0, 127, 255);
  rectMode(CENTER);
  rect(width/2, height/2, 400, 400);
  rect(mouseX, mouseY, 50, 50);

  shader.set("time", float(millis())/1222.0);
  shader.set("tex0", get());

 shader(shader);
 //println("rate:  "+rate + "depth:"  +depth);
 println(millis());
}

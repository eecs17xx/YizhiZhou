LetterGenerator lg;
String input = "acbabcbac";
PImage bg;

void setup() {
  size(1000, 600, P3D);
  
  bg = loadImage("bg.jpg");
  lg = new LetterGenerator(input, 0, height);
}

void draw() {
  background(mouseY, 127+mouseX, mouseX);
  
  lg.run(); 
}

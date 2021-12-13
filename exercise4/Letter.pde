class Letter {
  
  PShape s;
  PVector position;
  PVector[] vertices;
  float spread = 0.6;
  float yPos;
  float yHeight = 10;
  float hyHeight = yHeight/2;
  
  Letter(PShape _s, float x, float y) {
    s = _s;
    y = height/2;
    position = new PVector(x, yPos);
    vertices = new PVector[s.getVertexCount()];

  }
  
  void update() {
    for (int i=0; i<vertices.length; i++) {
      vertices[i] = s.getVertex(i);
      vertices[i].add(new PVector(random(-spread, spread), random(-spread, spread)));
      s.setVertex(i, vertices[i]);
      
      
    }
          yPos += spread;
          
  if (yPos >= 50 || yPos <= 500) {
    spread *= -1;
  }
  }
  
  void draw() {
    shapeMode(CENTER);;
    shape(s, position.x+random(1,3), position.y+random(0,2));
  }
  
  void run() {
    update();
    draw();
  }
  
}

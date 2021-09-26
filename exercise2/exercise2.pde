PImage img1,img2,img3,img4;
float x;
float y;
float a;
float b;
float speedX = 4;
float speedY = 3;

void setup() {
  size(800,600,P2D);
  
  img1 = loadImage("img1.jpg");
 
  img2 = loadImage("img2.png");

  img3 = loadImage("img3.png");
    x = 0;
    y = 500;
    
  img4 = loadImage("img4.png");
    a = 800;
    b = 300;
}

void draw() {
  
  imageMode(CORNER);
  image(img1, 0, 0, width, height);
 
  imageMode(CENTER);
  image(img2, mouseX, mouseY, 60, 60);
  
  imageMode(CENTER);
  image(img3, x, y, 250, 180);
  
  imageMode(CENTER);
  image(img4, a, b, 250, 180);
  
  x += speedX;
  if (x > width ) {
    speedX *= -1;
  }
  else if (x >= 800) {
    x = 0;
  }
  
  a += speedY;
  if (a > width || a < 0) {
    speedY *= -1;
  }
  
}

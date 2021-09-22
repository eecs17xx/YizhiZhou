color bgcolor = color(255,255,255);
PImage img1;
int count = 0;
PFont font;

void setup(){
   size(800,600,P2D);
   //frameRate(60);
   background(bgcolor);
   
   img1 = loadImage("gouzi.png");
   
   font = createFont("Arial", 25);
}

void draw() { 
         textFont(font);
    
    if (mousePressed && (mouseButton == LEFT)){
        
            rectMode(CENTER);
            line(mouseX,mouseY,pmouseX,pmouseY);
         
        rect(10, 10, 25, 25);
        fill(0);
        text("You may start drawing", 40, 25);
     }
     

     
    if (mousePressed && (mouseButton == RIGHT)) {
          
            int r = int(random(255));
            int g = int(random(255));
            int b = int(random(255));
            int q = int(random(255));
            
            line(mouseX,mouseY,random(width),random(height));
         
            rect(775, 10, 25, 25);
            fill(r,g,b);
            text("colorful!!", 700, 50);
            println(r,g,b);
            stroke(r,g,b,q);
    }
}

void mousePressed() {
            
  int r = int(random(255));            
  int g = int(random(255));
  int b = int(random(255));
  
  if (mousePressed && (mouseButton == CENTER)) {
          background(255,255,255);      
    }
    if(mouseButton == CENTER) {
    fill(r,g,b);
    text("Want to reset the board? Press CENTER mouseButton!", 100, mouseY - 60);
    image(img1, mouseX,mouseY,80,80);
    imageMode(CENTER);
    
     count++;
    
    while(count > 1  && mouseButton == CENTER && mousePressed) {
       
        background(255,255,255); 
        count--;
        count--;
        
      }
    }    
}






  
 

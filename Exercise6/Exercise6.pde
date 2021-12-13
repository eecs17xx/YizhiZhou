import gab.opencv.*;
import processing.video.*;

OpenCV openCV;

Movie movie;
Capture capture;

void setup() {
  size(640, 760, FX2D);
  
  setupCapture(0);
  setupMovie("1.MP4");   
}

void draw() {  
  background(0);
  
  if (videoImg != null) {
    if (openCV == null) {
      setupOpenCV(videoImg);
    } else {
      updateOpenCV(videoImg);
    }

    image(openCV.getSnapshot(), 0, 0);
  } 
  
  surface.setTitle("my hamster" + frameRate);
}

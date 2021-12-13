int threshold = 32;
boolean armOpenCvUpdate = false;
int scaler = 2;

void setupOpenCV(PImage img) { 
  openCV = new OpenCV(this, img);
}

void updateOpenCV(PImage img) {
  if (armOpenCvUpdate) {
    openCV.loadImage(img);
    openCV.gray();
    openCV.threshold(threshold);
    armOpenCvUpdate = false;
  }
}

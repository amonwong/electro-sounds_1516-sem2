//"Woodblock_a" by Amon Wong 16536, LASALLE 2016, YEAR 2 BA(HONS) Music 
//Principal Studies with Andrea Schegel
//Inspired by Raven Kwok, Ryoji Ikeda, Ryoichi Kurokawa
//Credits to Reddit's Processing community for helping out with TunnelCamera
//Music Used: 疾走する閃光 - Fox Capture Plan // Animus Vox - The Glitch Mob
//https://vimeo.com/157943147

//Libraries Used: Minim & Syphon



//IMPORT LIBRARIES
import ddf.minim.*;
import ddf.minim.analysis.*;
import codeanticode.syphon.*;


//ESTABLISH
Minim minim;
AudioInput in;
BeatDetect beat;
TunnelCamera cam; 
SyphonServer server;


//VARIABLES
float tileSize = 20;
ArrayList<Box> boxes;


//Syphon Settings
void settings() {
  size(1280,720, P3D);
  PJOGL.profile=1;
}


//SETUP
void setup( ) {
  size(960, 540, P3D);
  server = new SyphonServer(this, "Processing Syphon");
  minim = new Minim(this);
  minim.debugOn();

    // get a line in from Minim, default bit depth is 16
    in = minim.getLineIn(Minim.STEREO, 128);
    beat = new BeatDetect();

  boxes = new ArrayList();
  for (int x=0; x<10; x++) {
    for (int y=0; y<10; y++) {
      for (int z=0; z<10; z++) {
        boxes.add(new Box(x-5, y-5, z-5));
      }
    }
  }
  cam = new TunnelCamera(new PVector((tileSize*tileSize)/2, 200, -200));
}


//DRAW
void draw() {
  background(255, 50);
  cam.setCamHeight(mouseY);
  cam.update();
  noStroke();
  lights();
  translate(width/2, height/2);

  //if (key == 'w') {
  //  rotateY(frameCount*0.005);
  //}

  for (Box box : boxes) {
    box.draw();
    box.update();
    box.minimline();
  }
  server.sendScreen();
}


//CONTROL 
void keyPressed() {
  if (key=='e') {
    for (Box box : boxes) {
      box.change(0, 0.2);
    }
  } else if (key=='r') {
    for (Box box : boxes) {
      box.change(random(4, 20), 0.01);
    }
  }
}


//ENDING MINIM
void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();

  super.stop();
}
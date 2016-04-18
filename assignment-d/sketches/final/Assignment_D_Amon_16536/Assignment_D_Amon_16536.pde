//"Deep" by Amon Wong 16536, LASALLE 2016, YEAR 2 BA(HONS) Music 
//Principal Studies with Andrea Schegel
//Inspired by Raven Kwok, Ryoji Ikeda, Ryoichi Kurokawa, Diana Lange
//Music Used: Amon Wong - "Past and Languages" 
//https://vimeo.com/163207128
//https://www.youtube.com/watch?v=uIxuCLkh5l8&feature=youtu.be
//Libraries Used: Minim, Syphon, PeasyCam & Midibus 

// Keyboard Controls : 
// 1 = "Original State" 
// 2 = "Explode Cubes" 
// 3 = "Move Cubes Slowly" 
// w = "Draw Lines" 
// keyboard = "to glitch"


//IMPORT LIBRARIES
import ddf.minim.*;
import ddf.minim.analysis.*;
import codeanticode.syphon.*;
import peasy.*;
import themidibus.*; 
import javax.sound.midi.MidiMessage; 

//ESTABLISH
Minim minim;
AudioInput in;
BeatDetect beat;
SyphonServer server;
PeasyCam cam;
MidiBus myBus; 



//VARIABLES
float tileSize = 20;
ArrayList<Box> boxes;
float mat1[][]; 
float mat2[][];
int gridMaxX = 20; 
int gridMaxY = 20; 

float chaos = 2;
float chaosF = 0.01; 
int midiDevice  = 3;
float cammin = 50;
float cammax = 8000;

//Syphon Settings
void settings() {
  size(1280, 720, P3D);
  PJOGL.profile=1;
}


//SETUP
void setup() {
  size(960, 540, P3D);
  //noCursor();
  
  //Midi Bus
  MidiBus.list(); 
  myBus = new MidiBus(this, midiDevice, 1); 
  
  //Syphon
  server = new SyphonServer(this, "Processing Syphon");
  minim = new Minim(this);
  minim.debugOn();

  //PeasyCam 
  cam = new PeasyCam(this, width/2, height/2, 0, 1000);
  cam.setMinimumDistance(cammin);
  cam.setMaximumDistance(cammax);  

  // Minim
  in = minim.getLineIn(Minim.STEREO, 128);
  beat = new BeatDetect();
  
  // Creating no. of Boxes
  boxes = new ArrayList();
  for (int x=0; x<10; x++) {
    for (int y=0; y<10; y++) {
      for (int z=0; z<10; z++) {
        boxes.add(new Box(x-5, y-5, z-5));
      }
    }
  }
}


//DRAW
void draw() {
  background(10, 30);
  colorMode(HSB, 360, 100, 100);


  //lighting
  fill(0, 51, 102); 
  ambientLight(102, 102, 102);
  lightSpecular(204, 204, 204);
  directionalLight(102, 102, 102, 0, 0, -1);
  specular(255, 255, 255);
  shininess(10.0);
  lights();
  translate(width/2, height/2);

  //To Link with Keyboard (Movement)
  if (key == '1') {
    rotateY(frameCount*0.002);
    rotateX(frameCount*0.002);
  }  

  if (key == '2') {
    rotateY(frameCount*0.002);
  }

// Draw Boxes
  for (Box box : boxes) {
    box.draw();
    box.update();
    box.minimline();
  }

  server.sendScreen();
}


//ENDING MINIM
void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();

  super.stop();
}
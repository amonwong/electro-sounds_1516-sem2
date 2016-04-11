//"Assignment C" by Amon Wong 16536, LASALLE 2016, YEAR 2 BA(HONS) Music 
//Principal Studies with Andrea Schegel
//Recreation of one aspect of "Raven Kwok - 1DDCB (New Age Dark Age)"
//https://vimeo.com/150841540
//Reference from HE_Mesh "Ref_WB_Voronoi_3D" example

// Keyboard and Mouse Buttons
// 1 : Change to black background (white lines)
// 2 : Change to white background (black lines)
// r : Divide points to create quads within quads 
// mousePressed : introduce Voronoi tessellation 

//Libraries Used: HE_Mesh & Syphon

//IMPORT LIBRARIES
import wblut.processing.*;
import wblut.geom.*;
import java.util.List;
import codeanticode.syphon.*;

//ESTABLISH
List<WB_Point> points;
List<WB_VoronoiCell3D> voronoi;
WB_Render3D render;
WB_GeometryFactory gf=WB_GeometryFactory.instance();
WB_AABB box;
SyphonServer server;


//VARIABLES
int state = 1; 


//Syphon Settings
void settings() {
  size(1280, 720, P3D);
  PJOGL.profile=1;
}

//SETUP
void setup() {
  size(960, 540, P3D);
  frameRate(30);
  smooth(8);
  server = new SyphonServer(this, "Processing Syphon");


  render= new WB_Render3D(this);
  points=new ArrayList<WB_Point>();
  // add points to collection
  for (int i=0; i<5; i++) {
    for (int j=0; j<5; j++) {
      for (int k=0; k<5; k++) {
        points.add(new WB_Point(-200+i*80, -200+j*80, -200+k*80));
      }
    }
  }
  box=new WB_AABB(-250, -250, -250, 250, 250, 250);
  voronoi= WB_Voronoi.getVoronoi3D(points, box);
}

//DRAW
void draw() {
  background(0);
  hint(DISABLE_DEPTH_TEST);

  //changing of backgrounds
  if (state == 1) {
    stroke(255, 50);
    background (0, 70);
  }
  if (state == 2) {
    stroke(0, 50); 
    background (255, 70 );
  }


  // moving camera down Z-Axis
  translate(width/2, height/2, frameCount%1000);

  noFill();
  // making points very small
  strokeWeight(0.00001);

  render.drawPoints(points, 1); 

  strokeWeight(1);
  for (WB_VoronoiCell3D vor : voronoi) {

    render.drawMesh(vor.getMesh());
  }
  server.sendScreen();
}

//CONTROL 
void mousePressed() {
  for (WB_Point p : points) {
    p.addSelf(random(-5, 5), random(-5, 5), random(-5, 5));
  } 
  voronoi= WB_Voronoi.getVoronoi3D(points, box);
}

void keyPressed() {
  //Changing Color of Background

  if (key == '1') {
    state = 1;
  } else if (key == '2') {
    state = 2;
  }

  //dividing within itself
  if (key == 'd') {
    for (WB_Point p : points) {
      //p.scaleSelf(random(-1, 1), random(-1, 1), random(-1, 1));
      p.divSelf(random(-1, -5));
    } 
    voronoi= WB_Voronoi.getVoronoi3D(points, box);
  }
}
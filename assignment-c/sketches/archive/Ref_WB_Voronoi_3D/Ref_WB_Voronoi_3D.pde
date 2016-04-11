import wblut.processing.*;
import wblut.geom.*;
import java.util.List;

List<WB_Point> points;
List<WB_VoronoiCell3D> voronoi;

WB_Render3D render;
WB_GeometryFactory gf=WB_GeometryFactory.instance();
WB_AABB box;

void setup() {
  size(800, 800, P3D);
  smooth(8);
  render= new WB_Render3D(this);

  points=new ArrayList<WB_Point>();
  // add points to collection
  for (int i=0; i<6; i++) {
    for (int j=0; j<6; j++) {
      for (int k=0; k<6; k++) {
      points.add(new WB_Point(-200+i*80, -200+j*80 , -200+k*80));
      }
    }
  }
  box=new WB_AABB(-250,-250,-250,250,250,250);
  voronoi= WB_Voronoi.getVoronoi3D(points,box);

  textAlign(CENTER);
}

void draw() {
  background(255);
  directionalLight(255, 255, 255, 1, 1, -1);
  directionalLight(127, 127, 127, -1, -1, 1);
  translate(400, 400, 0);
  fill(0);
  text("click",0,350);
  rotateY(mouseX*1.0f/width*TWO_PI);
  rotateX(mouseY*1.0f/height*TWO_PI);
  noFill();
  strokeWeight(2);
  render.drawPoints(points, 1); 
  strokeWeight(1);
  for (WB_VoronoiCell3D vor : voronoi) {

    render.drawMesh(vor.getMesh());
  }
 
}


void mousePressed() {
  for (WB_Point p : points) {
    p.addSelf(random(-5, 5), random(-5, 5), random(-5, 5));
  } 
 voronoi= WB_Voronoi.getVoronoi3D(points,box);
}
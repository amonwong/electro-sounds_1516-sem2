class Box {

  //Global Variables
  float x, y, z, s;
  float nx, ny, nz, ns;
  int col;
  float dist = random(4, 10);
  float scl = 0.05;

  //Constructor
  Box(float theX, float theY, float theZ) {
    x = theX*dist;
    y = theY*dist;
    z = theZ*dist;
    s = random(10, 20);
    col = int(random(255));
  }
  
  
  //Functions
  void draw() {

    translate(x, y, z);
    rotate(PI/3);
    fill(col);
    box(s);
    stroke(255, 30);
  }

  void update() {
    x += (nx-x)*scl;
    y += (ny-y)*scl;
    z += (nz-z)*scl;
  }

  void change(float theDist, float theScl) {
    scl = theScl;
    nx = random(-5, 5)*theDist;
    ny = random(-5, 5)*theDist;
    nz = random(-5, 5)*theDist;
  }

  void minimline() {
    beat.detect(in.mix);

    if (key == 'w') {
      for (int i = 0; i < in.bufferSize() - 1; i+=5)
      {     

        //grey
        //stroke(#DBD9D9, random(20, 40));

        //blackish
        stroke(#403E3E, random(10, 20));

        //centipede
        //line( 50 + in.left.get(i)*100, i+1, 0, in.right.get(i)*100);
        
        //normal line
        line(0, 0, in.right.get(i)*100, in.left.get(i)*100, i*100, 0.01);

        //example line
        //line(0, 0, 0, in.left.get(i)*50, i*10,50);
      }
      //original line by Andy
      //for (int i=0; i<1; i++) {
      //  line(0, 0, 0, width*10, i*10, 50);
      //}
    }
    //glitch effect
    //if (key == 'q') {
    if ( beat.isOnset() ) rotate(PI/6);
    //}
  }
}
//End Box
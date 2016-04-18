class Box {

  //Global Variables
  float x, y, z, s;
  float nx, ny, nz, ns;
  int col ;
  float dist = random(5, 15);
  float scl = 0.05;

  //Constructor
  Box(float theX, float theY, float theZ) {
    x = theX*dist;
    y = theY*dist;
    z = theZ*dist;
    s = random(1, 40);
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

        //color of mimin line        
        stroke(#EAE8E8, random(20, 5));

        //yellow lines 
        if ( beat.isOnset() ) stroke(#F0E352, random(80, 90));

        //minim line
        line(10, 10, in.right.get(i)*10, in.left.get(i)*10, i*10, 0.001);  
     
        //example line
        //line(0, 0, 0, in.left.get(i)*50, i*10,50);
      }
    }
  }
}

 
  
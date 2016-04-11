//Inspired by Frieder Nake 6/7/64 Nr. 20 Zufälliger Polygonzug
//Code by Amon Wong Chong Hao

//The computer-generated drawing belongs to the earliest ever by Nake, 
//and also to the very early in all of algorithmic drawings. 
//The generative algorithm is the simplest possible: 
//from the current point draw a randomly chosen edge (direction and length), 
//Stay within the drawing’s boundary.

float xlinestart, ylinestart, xlineend, ylineend;

void setup () { 
  size (960, 540); 
  background (255);
  smooth();

  xlineend = width/2;
  ylineend = height/2;
}

void draw () {


  xlinestart  = random(50, width-50);
  ylinestart = random(50, height-50);

  line (xlinestart, ylinestart, xlineend, ylineend);
  xlineend = xlinestart;
  ylineend = ylinestart;
  delay(50); 

  while (keyPressed);  
  {     
    save("example1.jpg");
  }
}
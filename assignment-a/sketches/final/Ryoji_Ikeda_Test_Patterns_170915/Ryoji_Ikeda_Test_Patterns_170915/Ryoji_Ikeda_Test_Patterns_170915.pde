//code by Amon Wong Chong Hao
// Inspiration : "test patten [nº3]" by Ryoji Ikeda (2011, 2013, 2014) (audiovisual installation) 

float xstart = 0;
float xend = 480;
float y = 0;

void setup() {
  size(960, 540);
  background(255);
  stroke(255);
}

void draw() { 
  line(xstart, y, xend, y);
  y = y + 1;

  if (y > height) { // to return to starting point
    y = 0;
  }
  {
    if (random(100) > 70) { // to randomize bar code color
      stroke(0);
    } else {
      stroke(255, random(100));
    }
  }
  if (y >= 540) {  // drawing the second column on the right
    xstart = xstart + 480; 
    xend = xend + 480;
 
  }
}
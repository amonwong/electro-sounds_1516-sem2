//This code is based off Sol Lewitt's Wall Drawing #118
// Modified from Mitchell F Chan's video 
// Code by Amon Wong Chong Hao
// 
// “On a wall surface, any continuous stretch of wall,
// using a hard pencil, place
// fifty points at random.
// The points should be evenly
// distributed over the area
// of the wall. All of the
// points should be connected
// by straight lines. “

int x[] = new int[50];
int y[] = new int[50];


void setup() {
  size(960,540, P3D);
  background (249);
  stroke(100, 80);
  smooth();
}

void draw () {
background(249);
for (int n = 0; n<50; n++) {
  x[n] = int(random(50, width-50));
    y[n] = int(random(50, height-50));
    for (int j = 0; j<n; j++) {
      line(x[n], y[n], x[j], y[j]);
    }
}
    noLoop();
}
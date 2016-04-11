// This code is based off Sol Lewitt's Wall Drawing #118
// Inspired by Mitchell F Chan's video 
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

float allxpoints[] = new float[50];
float allypoints[] = new float[50];

float xpointsmove[] = new float[50];
float ypointsmove[] = new float[50];



void setup() {
  fullScreen(P3D);
  background(240);
  stroke(100, 80);
  smooth();
  
  for (int n = 0; n<50; n++) {
    allxpoints[n] = (random(50, width-50));
    allypoints[n] = (random(50, height-50));
    xpointsmove[n] = (random(-0.5, .5));
    ypointsmove[n] = (random(-0.5, .5));
  }
}

void draw () {
  background(240);
  for (int n = 0; n<50; n++) {
    allxpoints[n] += xpointsmove[n]; //mvmt x
    allypoints[n] += ypointsmove[n]; //mvmt y

    if (allxpoints[n] <= 0) { // trying to correct to x boundary
      allxpoints[n] = 1;
      xpointsmove[n] = -xpointsmove[n];
    } else if (allxpoints[n] >= width) {
      allxpoints[n] = width -1;
      xpointsmove[n] = -xpointsmove[n];
    }

    if (allypoints[n] <= 0) { //  trying to correct to y boundary
      allypoints[n] = 1;
      ypointsmove[n] = -ypointsmove[n];
    } else if (allypoints[n] >= height) {
      allypoints[n] = height -1;
      ypointsmove[n] = -ypointsmove[n];
    } 

    for (int j = 0; j<n; j++) { 
      line(allxpoints[n], allypoints[n], allxpoints[j], allypoints[j]) 
        ;
    }
  }
}
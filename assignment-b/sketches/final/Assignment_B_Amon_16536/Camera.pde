class TunnelCamera {

  //Global Variables
  PVector pos;
  PVector target;

  PVector acc;
  PVector vel;

  float friction;

  float accSpeed;

  //Constructor
  TunnelCamera(PVector _pos) {
    pos = _pos.copy();
    target = new PVector (0, 0, 0);
    acc = new PVector (0, 0, 0);
    vel = new PVector (0, 0, 0);

    friction = 0.95;
    accSpeed = 0.25;
  } 

  //Functions
  void update() {

    if (mousePressed && mouseButton == LEFT) {
      acc = new PVector(0, 0, accSpeed);
    } else if (mousePressed && mouseButton == RIGHT) {
      acc = new PVector(0, 0, -accSpeed);
    }

    vel.add(acc);
    pos.add(vel);
    acc.mult(0);

    target = new PVector(pos.x, pos.y, pos.z + 0.5);

    camera(pos.x, pos.y, pos.z, target.x, target.y, target.z, sin(radians(frameCount*0.3)), 1, 0);
  }

  void setCamHeight(float _camHeight) {
    pos.y = _camHeight;
  }
} 
// End TunnelCamera
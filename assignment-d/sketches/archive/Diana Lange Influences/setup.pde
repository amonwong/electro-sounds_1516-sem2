void setSetup()
{


  // SetSize --------------------------------------------------------------------
  actRandomSeed = 100; //possibilities of structure 

  isPlaying = true;
  maxPositionFactor = 50;// speed in which it moves (10 is default) 

  positionFactor = 1000; // how much the positions of dots varies (9.3 default) 




  zFactor = 13; // How long the structure extends (1) 
  connectionFactor = 0.6;
  oldCircleSize = 100;
  morphCount = 0;
  frameCounter = 0;

  // Camera --------------------------------------------------------------------
  cam = new PeasyCam(this, width/2, height/2, 0, 1000);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(8000);
}
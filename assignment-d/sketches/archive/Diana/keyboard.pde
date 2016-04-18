// Control

void keyReleased ()
{
  if (key == 'q' ) 
  {
    actRandomSeed +=1;
    morphing = true;
    frameCounter = 0;
  }
  if (key == 'w' ) 
  {
    actRandomSeed -=1;
    morphing = true;
    frameCounter = 0;
  }
}

void keyPressed()
{
  // Position
  if (key == 'a' ) 
  {
    positionFactor -= 0.10;
    positionFactor = constrain (positionFactor, 0,maxPositionFactor);
    creatDotList ();
  }

  if (key == 's' && positionFactor < maxPositionFactor) 
  {
    positionFactor += 0.10;
    positionFactor = constrain (positionFactor, 0,maxPositionFactor);
    creatDotList ();
  }

  if (key == 'e' ) {
    zFactor -= 0.1;
    zFactor = constrain (zFactor,0,4);

  }
  if (key == 'r' ) {
    zFactor += 0.1;
    zFactor = constrain (zFactor,0,4);
  }

  // No. of Lines 
  if (key == 'y' ) {
    connectionFactor -=0.05;
    connectionFactor = constrain (connectionFactor, 0,2);
  }

  if (key == 'x' ) {
    connectionFactor +=0.05;
    connectionFactor = constrain (connectionFactor, 0,2);
  }
    
  // Alternative Drawing Mode
  
  {
    if (altMode == false) 
    {
      altMode = true;
      dotAmount = 600;
      setupDotList ();
      creatDotList ();
    }
    else if (altMode == true) 
    {
      altMode = false;
      dotAmount = 500;
      setupDotList ();
      creatDotList ();
    }
    
  }
}
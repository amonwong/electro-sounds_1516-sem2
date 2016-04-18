// manipulation of lines between the dots
void checkDistanceRight (PVector currentDot)
{
  int dotCount = 0;
  int circleCount = circleAmount;
  int circle = 0;
  while (circle < circleCount)
  {
    int count = 0;
    int countMax = dotAmount/circleAmount;

    PVector checkDot;

    while (count < countMax)
    {
      checkDot = dotList [ dotCount ];
      if (altMode == true) checkDot = dotList [ count+(circle*count) ];

      float startZ = zFactor*currentDot.z;
      float targetZ = zFactor*checkDot.z;

      float distance = dist( currentDot.x, currentDot.y, currentDot.z, checkDot.x, checkDot.y, checkDot.z);


      if (distance < (200*connectionFactor) && distance > (130*connectionFactor))
      {
        stroke (255, 30);
        strokeWeight (0.5);      
        if (altMode == true) {
          stroke (255, 13);
          strokeWeight (0.5);
        }
        line (currentDot.x, currentDot.y, startZ, checkDot.x, checkDot.y, targetZ);
      }

      if (distance < (130*connectionFactor) && distance> (80*connectionFactor))
      {
        stroke (255, 30);
        strokeWeight (0.75);
        if (altMode == true) {
          stroke (255, 13);
          strokeWeight (0.5);
        }
        line (currentDot.x, currentDot.y, startZ, checkDot.x, checkDot.y, targetZ);
      }

      if (distance < (80*connectionFactor) && distance > (40*connectionFactor))
      {
        stroke (255, 30);
        strokeWeight (1);
        if (altMode == true) {
          stroke (255, 13);
          strokeWeight (0.5);
        }
        line (currentDot.x, currentDot.y, startZ, checkDot.x, checkDot.y, targetZ);
      }

      dotCount++;
      count++;
    }
    circle++;
  }
}
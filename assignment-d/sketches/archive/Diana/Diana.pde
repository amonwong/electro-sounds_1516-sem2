// "Study of Diana Lange's Works"
// Amon Wong 16536, LASALLE 2016, YEAR 2 BA(HONS) Music
//Principal Studies with Andrea Schegel 
//Libraries Used: PeasyCam 

// Libraries
import peasy.*;

// Classes --------------------------------------------------------------------
PeasyCam cam;

// Variables --------------------------------------------------------------------
int dotAmount = 500, actRandomSeed, circleAmount = 16, maxPositionFactor = 10, frameCounter;
float positionFactor, zFactor, connectionFactor, oldCircleSize, morphCount;
PVector dotList[];
float [] checkCircleSizeList;
float [] prevCircleSizeList;
PVector prevDotList[];

// Boolean --------------------------------------------------------------------
boolean isPlaying = false, hideimage = false, morphing = false, createNewDotList = false, altMode = false;

void setup()
{

  size (960, 540, P3D);
  background (247);
  smooth();
  frameRate(30);
  
  // she does several tabs to make do with her sketch
  setSetup();
  setupDotList ();
  creatDotList ();
}

void draw()
{
  background (0);

  // create dotlist then draw lines between dots
  if (morphing == true) creatDotList();

  drawLinesBetweenDots();

  if (morphing == true ) morphCount += 0.2;
  if (morphCount >=maxPositionFactor)
  {
    morphCount = 0;
    morphing = false;
    createNewDotList = true;
  }

  if (createNewDotList == true) creatDotList ();  
  createNewDotList = false;

  if (morphing == false) frameCounter++;
  if (frameCounter == 25)
  {
    actRandomSeed +=1;
    morphing = true;
    frameCounter = 0;
  }
  
  // added this filter to see if her sketch works well with filters
  if (key == '2') {
    filter(ERODE);
  }
}
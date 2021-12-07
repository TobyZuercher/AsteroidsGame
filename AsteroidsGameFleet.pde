Spaceship[] ships = new Spaceship[12];
double[] xPos = {0, -35, -35, -60, -60, -20, -20, 20, 20, 60, 60, 100}, yPos = {0, -18, 18, -48, 48, -36, 36, -24, 24, -12, 12, 0};
Star[] stars = new Star[150];
ArrayList<Asteroid> asts = new ArrayList<Asteroid>();
int destAsteroids = 0;
public void setup() 
{
  size(600, 600);
  background(0);
  for(int i = 0; i < stars.length; i++)
    stars[i] = new Star();
  for(int i = 0; i < ships.length; i++) {
    ships[i] = new Spaceship();
    double x = width/2, y = height/2;
    ships[i].setY(y + yPos[i]);
    ships[i].setX(x + xPos[i]);
  }
  for(int i = 0; i < 20; i++) {
    asts.add(new Asteroid());
  }
}
public void draw() 
{
  background(0);
  if(w && Math.abs(ships[0].getSpeedPlusAccel(0.1)) <= 10)
    for(int i = 0; i < ships.length; i++) {
      ships[i].accelerate(0.1);
    }
  if(a) {
    pushMatrix();
    translate((float)ships[0].getX(), (float)ships[0].getY());
    double x = ships[0].getX(), y = ships[0].getY();
    rotate(radians(-5));
    for(int i = 0; i < ships.length; i++) {
      ships[i].turn(-5); //ROTATE, maybe use rotate() + translate() function?? //no idea how to do this. maybe have an "offset rot" variable?
      ships[i].setY(y + yPos[i]);
      ships[i].setX(x + xPos[i]);
    }
    popMatrix();
    //rotate(radians(-5));
    //translate(-(float)ships[0].getX(), -(float)ships[0].getY());
  }
  if(d)
    for(int i = 0; i < ships.length; i++)
      ships[i].turn(5);
  if(space) {
    double x = (Math.random() * width), y = (Math.random() * height), pDir = (Math.random() * 360);
    for(int i = 0; i < ships.length; i++) {
      ships[i].setY(y + yPos[i]);
      ships[i].setX(x + xPos[i]);
      ships[i].setYspeed(0);
      ships[i].setXspeed(0);
      ships[i].turn(pDir);
    }
    for(int i = 0; i < stars.length; i++)
      stars[i].change();
    space = false;
  }
  
  if(!w) {   
    if(ships[0].getXspeed() > 0)
      for(int i = 0; i < ships.length; i++)
        ships[i].setXspeed(ships[i].getXspeed() - Math.abs(Math.cos(ships[i].getAngleofDirection()))/(1/ships[i].getBrakes()));
    if(ships[0].getXspeed() < 0)
      for(int i = 0; i < ships.length; i++)
        ships[i].setXspeed(ships[i].getXspeed() + Math.abs(Math.cos(ships[i].getAngleofDirection()))/(1/ships[i].getBrakes()));
        
    if(ships[0].getYspeed() > 0)
      for(int i = 0; i < ships.length; i++)
        ships[i].setYspeed(ships[i].getYspeed() - Math.abs(Math.sin(ships[i].getAngleofDirection()))/(1/ships[i].getBrakes()));
    if(ships[0].getYspeed() < 0)
      for(int i = 0; i < ships.length; i++)
        ships[i].setYspeed(ships[i].getYspeed() + Math.abs(Math.sin(ships[i].getAngleofDirection()))/(1/ships[i].getBrakes()));
        
    if(Math.abs(ships[0].getXspeed()) < 0.5)
      for(int i = 0; i < ships.length; i++)
        ships[i].setXspeed(0);
    if(Math.abs(ships[0].getYspeed()) < 0.5)
      for(int i = 0; i < ships.length; i++)
        ships[i].setYspeed(0);
  }
  
  for(int i = 0; i < stars.length; i++)
    stars[i].show();
  
  for(int i = 0; i < asts.size(); i++){
    asts.get(i).move();
    asts.get(i).show();
  }
  
  for(int i = 0; i < ships.length; i++) {
    ships[i].move();
    ships[i].show();
  }
  for(int i = 0; i < ships.length; i++) {
    for(int j = 0; j < ships[i].getCorners(); j++)
      for(int k = 0; k < asts.size(); k++)
        if((double)dist((float)ships[i].getCornerPosX(j), (float)ships[i].getCornerPosY(j), (float)asts.get(k).getCenterX(), (float)asts.get(k).getCenterY()) < asts.get(k).getRadius()) {
          asts.set(k, new Asteroid());
          destAsteroids++;
        }
  }
  System.out.println(destAsteroids);
  
  noStroke();
  fill(0, 0, 255);
  rect(0, 0, width, 5);
  rect(0, height-5, width, 5);
  fill(255, 150, 0);
  rect(0, 0, 5, height);
  rect(width-5, 0, 5, height);
}
boolean w = false, a = false, s = false, d = false, space = false;

void keyPressed()
{
  move(key, true);
}

void keyReleased()
{
  move(key, false);
}

boolean move(char c, boolean b)
{
  switch(c)
  {
    case 'W': return w = b;
    case 'w': return w = b;
    
    case 'A': return a = b;
    case 'a': return a = b;
    
    case 'S': return s = b;
    case 's': return s = b;
    
    case 'D': return d = b;
    case 'd': return d = b;
    
    case ' ': return space = b;
    
    default: return b;
  }
}

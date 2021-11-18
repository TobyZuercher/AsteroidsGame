Spaceship sam = new Spaceship();
Star[] stars = new Star[100];
public void setup() 
{
  size(800, 800);
  background(0);
  for(int i = 0; i < stars.length; i++)
    stars[i] = new Star();
}
public void draw() 
{
  background(0);
  if(w == true && abs((float)sam.getSpeed()) <= 20) sam.accelerate(0.1);
  //if(s == true) sam.accelerate(-0.1);
  if(a == true) sam.turn(-5);
  if(d == true) sam.turn(5);
  
  if(w == false) {   
    sam.setXspeed(sam.getXspeed() - (cos((float)sam.getAngleofDirection()))/3);  //MAKE THESE BASED ON - or + X/Y COORDS SO THAT IT WORK
    sam.setYspeed(sam.getYspeed() - (sin((float)sam.getAngleofDirection()))/3);     
    //sam.accelerate(-(sam.getSpeed())/30);
    if(abs((float)sam.getXspeed()) < 0.5)
      sam.setXspeed(0);
    if(abs((float)sam.getYspeed()) < 0.5)
      sam.setYspeed(0);
  }
  
  for(int i = 0; i < stars.length; i++)
    stars[i].show();
  
  sam.move();
  sam.show();
}
boolean w = false, a = false, s = false, d = false;

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
    
    default: return b;
  }
}

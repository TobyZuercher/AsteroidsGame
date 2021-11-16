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
  if(w == true) sam.accelerate(0.1);
  if(s == true) sam.accelerate(-0.1);
  if(a == true) sam.turn(-5);
  if(d == true) sam.turn(5);
  
  if(w == false) {
    double trueDir;
    trueDir = sam.getDirection();
    sam.setDirection(sam.getAngleofDirection());
    sam.accelerate(-(sam.getSpeed())/20);
    sam.setDirection(trueDir);
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

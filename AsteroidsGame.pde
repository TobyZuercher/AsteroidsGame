Spaceship sam;
Star[] stars = new Star[100];
public void setup() 
{
  size(600, 600);
  background(0);
  sam = new Spaceship();
  for(int i = 0; i < stars.length; i++)
    stars[i] = new Star();
}
public void draw() 
{
  background(0);
  if(w == true && Math.abs(sam.getSpeedPlusAccel(0.1)) <= 10)
    sam.accelerate(0.1);
  if(a == true) sam.turn(-5);
  if(d == true) sam.turn(5);
  if(space == true) {
    sam.setX(Math.random() * width);
    sam.setY(Math.random() * height);
    sam.setYspeed(0);
    sam.setXspeed(0);
    sam.setDirection(Math.random() * 360);
    space = false;
  }
  
  if(w == false) {   
    if(sam.getXspeed() > 0)
      sam.setXspeed(sam.getXspeed() - Math.abs(Math.cos(sam.getAngleofDirection()))/(1/sam.getBrakes()));  //MAKE THESE BASED ON - or + X/Y COORDS SO THAT IT WORK
    if(sam.getXspeed() < 0)
      sam.setXspeed(sam.getXspeed() + Math.abs(Math.cos(sam.getAngleofDirection()))/(1/sam.getBrakes()));
      
    if(sam.getYspeed() > 0)
      sam.setYspeed(sam.getYspeed() - Math.abs(Math.sin(sam.getAngleofDirection()))/(1/sam.getBrakes())); 
    if(sam.getYspeed() < 0)
      sam.setYspeed(sam.getYspeed() + Math.abs(Math.sin(sam.getAngleofDirection()))/(1/sam.getBrakes()));
      
    if(Math.abs(sam.getXspeed()) < 0.5)
      sam.setXspeed(0);
    if(Math.abs(sam.getYspeed()) < 0.5)
      sam.setYspeed(0);
  }
  
  for(int i = 0; i < stars.length; i++)
    stars[i].show();
  
  sam.move();
  sam.show();
  
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

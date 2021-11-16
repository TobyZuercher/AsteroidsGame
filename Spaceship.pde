class Spaceship extends Floater  
{   
    Spaceship()
    {
      corners = 4;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = -8;
      yCorners[0] = -8;
      xCorners[1] = 0;
      yCorners[1] = -2;
      xCorners[2] = -8;
      yCorners[2] = 8;
      xCorners[3] = 16;
      yCorners[3] = 0;
      myColor = 200;
      myCenterX = 400;
      myCenterY = 400;
      myXspeed = 0;
      myYspeed = 0;
      myPointDirection = 0;
    }
    
    public double getX() { return myCenterX; }
    public void setX(double d) { myCenterX = d; }
    public double getY() { return myCenterY; }
    public void setY(double d) { myCenterY = d; }
    public double getSpeed() { return ((cos(radians((float)myPointDirection)) * myXspeed) + (sin(radians((float)myPointDirection)) * myYspeed)); }
    public double getXspeed() { return myXspeed; }
    public void setXspeed(double d) { myXspeed = d; }
    public double getYspeed() { return myYspeed; }
    public void setYspeed(double d) { myYspeed = d; }
    public double getDirection() { return myPointDirection; }
    public void setDirection(double d) { myPointDirection = d; }
    public double getAngleofDirection() { 
      if((float)myXspeed != 0)
        return atan((float)(myYspeed/myXspeed));
      else if(myYspeed > 0)
        return 270;
      else if(myYspeed < 0)
        return 90;
      return 0;
  }
}
